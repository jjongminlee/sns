package du.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import du.board.domain.BoardVO;
import du.board.service.BoardService;

@Controller
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/boardWritePage.do")
	public String boardWritePage() {
		return "board/boardWrite.jsp";
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite(BoardVO board) {
		boardService.insertBoard(board);
		return "redirect:/mainBoard.do";
	}
}
