package du.reply.dao;

import java.util.List;

import du.reply.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> selectReplyList(long boardIdx);
}
