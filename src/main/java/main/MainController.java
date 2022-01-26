package main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import announce.AnnounceService;
import announce.AnnounceUserVo;
import concernboard.ConcernBoardService;
import concernboard.ConcernBoardVo;
import freeboard.FreeBoardService;
import freeboard.FreeBoardVo;
import user.UserVo;

@Controller
public class MainController {
	@Autowired
	FreeBoardService freeBoardService;	
	@Autowired
	AnnounceService as;
	@Autowired
	ConcernBoardService concernBoardService;
	
	@GetMapping("/index.do")
	public String index(FreeBoardVo vo , Model model , ConcernBoardVo vo2) {
		List<FreeBoardVo> list = freeBoardService.selectList(vo);
		List<ConcernBoardVo> concernlist = concernBoardService.selectList(vo2);
		model.addAttribute("list", list);
		model.addAttribute("concernlist", concernlist);
		return "index";
	}
	
	//메인css 테스트용으로 만든 index2
	@GetMapping("/index2.do")
	public String index2() {
		return "index2";
	}

	@GetMapping("/company/index.do")
	public String companyIndex() {
		return "company/index";
	}
	
	@GetMapping("/include/notice.do")
	public String notice(HttpSession sess, Model model) {
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		List<AnnounceUserVo> userVoList = as.userVoList(uv.getUserno());
		model.addAttribute("userVoList", userVoList);
		return "include/notice";
	}
	
	@GetMapping("/include/chatMain.do")
	public String chatMain(HttpSession sess, Model model) {
		UserVo uv = (UserVo)sess.getAttribute("userInfo");
		int chatCountMain = as.chatCountMain(uv.getUserno());
		model.addAttribute("chatCountMain", chatCountMain);
		return "include/chatMain";
	}


}
