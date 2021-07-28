package du.reply.service;

import java.util.List;

import du.reply.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> selectReplyList(long boardIdx);
}
