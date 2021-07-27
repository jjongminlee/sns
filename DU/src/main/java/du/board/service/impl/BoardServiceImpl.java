package du.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import du.board.dao.BoardDAO;
import du.board.domain.BoardVO;
import du.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService{

	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public BoardVO selectBoard(long idx) {
		
		return boardDAO.selectBoard(idx);
	}
	
	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList();
	}
	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		boardDAO.insertBoard(board);
	}
	
	@Override
	public void updateBoard(BoardVO board) {
		boardDAO.updateBoard(board);
		
	}

}
