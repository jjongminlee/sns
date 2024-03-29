package du.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import du.board.dao.BoardDAO;
import du.board.domain.BoardAttFileVO;
import du.board.domain.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class BoardDAOImpl extends EgovAbstractMapper implements BoardDAO{

	@Override
	public BoardVO selectBoard(long idx) {
		
		return selectOne("Board.selectBoard", idx);
	}
	
	@Override
	public List<BoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return selectList("Board.selectBoardList");
	}

	@Override
	public void insertBoard(BoardVO board) {
		// TODO Auto-generated method stub
		insert("Board.insertBoard", board);
	}
	
	@Override
	public void updateBoard(BoardVO board) {
		update("Board.updateBoard", board);
		
	}

	@Override
	public void deleteBoard(long idx) {
		delete("Board.deleteBoard", idx);
		
	}

	@Override
	public List<BoardVO> searchUser(String id) {
		// TODO Auto-generated method stub
		return selectList("Board.searchUser", id);
	}

	@Override
	public void insertBoardAttFile(BoardAttFileVO attFileVO) {
		insert("Board.insertBoardAttFile", attFileVO);
		
	}
	
	@Override
	public BoardAttFileVO selectBoardAttFile(BoardAttFileVO criteria) {
		
		return selectOne("Board.selectBoardAttFile", criteria);
	}

	@Override
	public void deleteBoardAttFile(BoardAttFileVO criteria) {
		delete("Board.deleteBoardAttFile", criteria);
		
	}

}
