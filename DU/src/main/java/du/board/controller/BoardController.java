package du.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import du.board.domain.BoardVO;
import du.board.service.BoardService;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/boardWritePage.do")
	public String boardWritePage() {
		System.out.println();
		return "board/boardWrite.jsp";
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite(BoardVO board) {
		boardService.insertBoard(board);
		return "redirect:/mainBoard.do";
	}
	
	@RequestMapping("/boardInfoPage.do")
	public ModelAndView boardInfoPage(long idx) {
		
		ModelAndView mav = new ModelAndView("board/boardInfo.jsp");
		BoardVO board = boardService.selectBoard(idx);
		
		mav.addObject("board", board);
				
		return mav;
	}
	
	@RequestMapping("/boardModifyPage.do")
	public ModelAndView boardModifyPage(long idx) {
		
		ModelAndView mav = new ModelAndView("board/boardModify.jsp");
		BoardVO board = boardService.selectBoard(idx);
		
		mav.addObject("board", board);
				
		return mav;
	}
	
	@RequestMapping("/boardModify.do")
	public String boardModify(BoardVO board) {
		boardService.updateBoard(board);
		
		return "redirect:/mainBoard.do";
	}
	
}
