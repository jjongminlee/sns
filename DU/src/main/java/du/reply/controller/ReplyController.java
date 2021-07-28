package du.reply.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import du.reply.domain.ReplyVO;
import du.reply.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService; 
	
	@RequestMapping("replyWrite.do")
	public String replyWrite(HttpSession session, ReplyVO reply) {
		replyService.insertReply(session, reply);
		
		return "redirect:/mainBoard.do";
	}
	
}