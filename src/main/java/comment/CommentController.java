package comment;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {

	@Autowired
	CommentService service;
	
	@PostMapping("/comment/insert.do")
	public String insert(Model model, CommentVo vo) {
		model.addAttribute("result", service.insert(vo));
		return "include/result";
	}
	
	@GetMapping("/comment/list.do")
	public String list(Model model, CommentVo vo) {
		model.addAttribute("cList", service.selectList(vo));
		return "include/commentList";
	}
	
	@GetMapping("/comment/update.do")
	public String update(Model model, CommentVo vo) {
		model.addAttribute("result", service.update(vo));
		return "include/result";
	}
	
	@PostMapping("/comment/insertCommentReply.do")
	public String insertCommentReply(Model model, CommentVo vo, HttpServletRequest req, HttpSession sess) {
		//vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		int r = service.insertCommentReply(vo);
		model.addAttribute("result",r);
		return "/include/result";
	}
	
	@GetMapping("/comment/delete.do")
	public String delete(Model model, CommentVo vo) {
		model.addAttribute("result", service.delete(vo.getComment_no()));
		return "include/result";
	}
}
