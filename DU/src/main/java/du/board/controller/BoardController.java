package du.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import du.board.domain.BoardVO;
import du.board.service.BoardService;
import du.reply.domain.ReplyVO;
import du.reply.service.ReplyService;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
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
		
		List<ReplyVO> replyList = replyService.selectReplyList(idx);
		mav.addObject("replyList", replyList);
		
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
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(long idx) {
		boardService.deleteBoard(idx);
		
		return "redirect:/mainBoard.do";
	}
	
}
