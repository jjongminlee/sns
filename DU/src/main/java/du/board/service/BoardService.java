package du.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import du.board.domain.BoardAttFileVO;
import du.board.domain.BoardVO;

public interface BoardService {
	
	public BoardVO selectBoard(long idx);

	public List<BoardVO>selectBoardList();
	
	public void insertBoard(BoardVO board, HttpSession session) throws Exception;
	
	public void updateBoard(BoardVO board, HttpSession session) throws Exception;
	
	public void deleteBoard(BoardVO board);
	
	public List<BoardVO> searchUser(String id);
	
	public BoardAttFileVO findBoardAttFile(BoardAttFileVO criteria);
	
	public void deleteBoardAttFile(BoardAttFileVO criteria) throws Exception;
}
