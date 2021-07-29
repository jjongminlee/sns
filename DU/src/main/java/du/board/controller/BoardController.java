package du.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String boardWrite(BoardVO board, HttpSession session) throws Exception {
		boardService.insertBoard(board, session);
		return "redirect:/mainBoard.do";
	}
	
	@RequestMapping("/boardInfoPage.do")
	public ModelAndView boardInfoPage(long idx) {
		
		ModelAndView mav = new ModelAndView("board/boardInfo.jsp");
		BoardVO board = boardService.selectBoard(idx);
		mav.addObject("board", board);
		
		List<ReplyVO> replyList = replyService.selectReplyList(idx);
		mav.addObject("replyList", replyList);
				
		return mav;
	}
	
	@RequestMapping("/boardModifyPage.do")
	public ModelAndView boardModifyPage(long idx) {
		
		ModelAndView mav = new ModelAndView("board/boardModify.jsp");
		BoardVO board = boardService.selectBoard(idx);
		
		mav.addObject("board", board);
				
		return mav;
	}
	
	@RequestMapping(value = "/boardModify.do", method = RequestMethod.POST)
	public String boardModify(@ModelAttribute BoardVO board, HttpSession session) throws Exception {
		boardService.updateBoard(board, session);
		
		return "redirect:/mainBoard.do";
	}
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(BoardVO board) {
		boardService.deleteBoard(board);
		
		return "redirect:/mainBoard.do";
	}
	
}
