package du.board.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;


import du.board.domain.BoardVO;
import du.board.service.BoardService;
import du.common.DownloadView;

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
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(long idx) {
		boardService.deleteBoard(idx);
		
		return "redirect:/mainBoard.do";
	}
	
//	@RequestMapping(
//			value = "/download/boardAttFile.do",
//			method = RequestMethod.POST)
//	public View downloadBoardAttFile(
//			BoardAttFileVO criteria,
//			Model model
//			) throws Exception{
//		BoardAttFileVO attFileVO = boardService.findBoardAttFile(criteria);
//		File file = new File(attFileVO.getFullAttFilePath());
//		
//		model.addAttribute("downloadFile", file);
//		model.addAttribute("downloadFilename", attFileVO.getOldFilename());
//		
//		return new DownloadView();
//	}
	
}
