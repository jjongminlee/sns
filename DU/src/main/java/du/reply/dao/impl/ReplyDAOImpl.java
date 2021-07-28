package du.reply.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import du.reply.dao.ReplyDAO;
import du.reply.domain.ReplyVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class ReplyDAOImpl extends EgovAbstractMapper implements ReplyDAO {

	@Override
	public List<ReplyVO> selectReplyList(long boardIdx) {
		
		return selectList("Reply.selectReplyList", boardIdx);
	}

}
