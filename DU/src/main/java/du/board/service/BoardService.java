package du.board.service;

import java.util.List;

import du.board.domain.BoardVO;

public interface BoardService {
	
	public BoardVO selectBoard(long idx);

	public List<BoardVO>selectBoardList();
	
	public void insertBoard(BoardVO board);
	
	public void updateBoard(BoardVO board);
	
	public void deleteBoard(long idx);
	
//	public BoardAttFileVO findBoardAttFile(BoardAttFileVO criteria);
//	
//	public void deleteBoardAttFile(BoardAttFileVO criteria) throws Exception;
}
