package du.board.dao;

import java.util.List;


import du.board.domain.BoardVO;

public interface BoardDAO {
	
	public BoardVO selectBoard(long idx);

	public List<BoardVO>selectBoardList();
	
	public void insertBoard(BoardVO board);
	
	public void updateBoard(BoardVO board);
	
	public void deleteBoard(long idx);
	
//	public void insertBoardAttFile(BoardAttFileVO attFileVO);
//	
//	public BoardAttFileVO selectBoardAttFile(BoardAttFileVO criteria);
//	
//	public void deleteBoardAttFile(BoardAttFileVO criteria);
	
	public List<BoardVO> searchUser(String id);
}
