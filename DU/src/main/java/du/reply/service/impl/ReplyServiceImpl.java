package du.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import du.reply.dao.ReplyDAO;
import du.reply.domain.ReplyVO;
import du.reply.service.ReplyService;



@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVO> selectReplyList(long boardIdx) {
		// TODO Auto-generated method stub
		return replyDAO.selectReplyList(boardIdx);
	}

}
