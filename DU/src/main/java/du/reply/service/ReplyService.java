package du.reply.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import du.reply.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> selectReplyList(long boardIdx);


	public void insertReply(HttpSession session, ReplyVO reply);
	
	public void deleteReply(long idx);
	
	public void updateReply(ReplyVO idx);
}
