package du.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import du.board.dao.BoardDAO;
import du.board.domain.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class BoardDAOImpl extends EgovAbstractMapper implements BoardDAO{

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

}
