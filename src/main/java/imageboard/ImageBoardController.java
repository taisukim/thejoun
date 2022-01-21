package imageboard;

import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import comment.CommentService;
import comment.CommentVo;
import freeboard.FreeBoardVo;
import user.UserVo;
import util.CommonUtil;

@Controller
public class ImageBoardController {

	@Autowired
	ImageBoardService imageBoardService;
	
	@Autowired
	CommentService cService;
	
	@GetMapping("admin/imageboard/index.do")
	public String adminIndex(Model model, HttpServletRequest req, HttpSession sess, ImageBoardVo vo) {
		
		int totCount = imageBoardService.count(vo); //총 개수
		int totPage = totCount / 10; //총 페이지 수
		if (totCount % 10 > 0) totPage++;
		System.out.println("totPage : "+totPage);
		
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);

		int pageRange = 10;
		int startPage = (vo.getPage()-1)/pageRange*pageRange+1; // 시작페이지
		int endPage = startPage + pageRange - 1;// 종료페이지
		if (endPage > totPage) endPage = totPage;
		
		String param = "&orderby="+vo.getOrderby();
		
		List<ImageBoardVo> list = imageBoardService.selectList(vo);
		model.addAttribute("list", list);
		model.addAttribute("totPage", totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10, param));
		return "admin/imageboard/index";
	}
	
	@GetMapping("/admin/imageboard/view.do")
	public String adminView(Model model, @RequestParam int image_board_no) {
		model.addAttribute("data", imageBoardService.view(image_board_no));
		CommentVo cv = new CommentVo();
		cv.setBoard_no(image_board_no);
		cv.setTablename(1);
		model.addAttribute("cList", cService.selectList(cv));

		return "admin/imageboard/view";
	}
	
	@GetMapping("/admin/imageboard/delete.do")
	public String adminImageboardDelete(Model model, ImageBoardVo vo) {
		int r = imageBoardService.delete(vo);
		if ( r > 0 ) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			
		} else {
			model.addAttribute("msg", "삭제 오류가 발생하였습니다.");
			model.addAttribute("url", "view.do?image_board_no="+vo.getImage_board_no());
		}
		return "include/return";
	}
	
	@GetMapping("/admin/imageboard/deleteAjax.do")
	public String adminImageboardDeleteAjax(Model model, ImageBoardVo vo) {
		model.addAttribute("result", imageBoardService.delete(vo));
		return "include/result";
	}
	
	@GetMapping("/imageboard/index.do")
	public String index(Model model, HttpServletRequest req, HttpSession sess, ImageBoardVo vo) {
		
		int totCount = imageBoardService.count(vo); //총 개수
		int totPage = totCount / 10; //총 페이지 수
		if (totCount % 10 > 0) totPage++;
		System.out.println("totPage : "+totPage);
		
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);

		int pageRange = 10;
		int startPage = (vo.getPage()-1)/pageRange*pageRange+1; // 시작페이지
		int endPage = startPage + pageRange - 1;// 종료페이지
		if (endPage > totPage) endPage = totPage;
		
		String param = "&orderby="+vo.getOrderby()+"&category="+vo.getCategory();
	
		List<ImageBoardVo> list = imageBoardService.selectList(vo);
		
		model.addAttribute("list", list);
		model.addAttribute("totPage", totPage);
		model.addAttribute("totCount", totCount);
		model.addAttribute("pageArea", CommonUtil.getPageArea("index.do", vo.getPage(), totPage, 10, param));
		
		return "imageboard/index";
	}
	
	@RequestMapping("/imageboard/write.do")
	public String write() {
		return "imageboard/write";
	}
	
	@PostMapping("/imageboard/insert.do")
	public String insert(ImageBoardVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		vo.setUserno(((UserVo)sess.getAttribute("userInfo")).getUserno());
		
		int r = imageBoardService.insert(vo);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류가 발생하였습니다.");
			req.setAttribute("url", "write.do");
		} 
		
		return "/include/return";
	}
	
	@GetMapping("/imageboard/view.do")
	public String view(Model model, @RequestParam int image_board_no) {
		model.addAttribute("data", imageBoardService.view(image_board_no));
		CommentVo cv = new CommentVo();
		cv.setBoard_no(image_board_no);
		cv.setTablename(3);
		model.addAttribute("cList", cService.selectList(cv));

		return "imageboard/view";
	}
	
	@GetMapping("/imageboard/edit.do")
	public String edit(Model model, @RequestParam int image_board_no) {
		model.addAttribute("data", imageBoardService.edit(image_board_no));
		return "imageboard/edit";
	}
	
	@PostMapping("/imageboard/update.do")
	public String update(Model model, ImageBoardVo vo, HttpServletRequest req) {
		
		int r = imageBoardService.update(vo);
		if ( r > 0 ) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?image_board_no="+vo.getImage_board_no());
		} else {
			model.addAttribute("msg", "수정 오류가 발생하였습니다.");
			model.addAttribute("url", "edit.do?image_board_no="+vo.getImage_board_no());
		}
		return "include/return";
	}
	
	@GetMapping("/imageboard/delete.do")
	public String delete(Model model, ImageBoardVo vo) {
		int r = imageBoardService.delete(vo);
		if ( r > 0 ) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			
		} else {
			model.addAttribute("msg", "삭제 오류가 발생하였습니다.");
			model.addAttribute("url", "view.do?image_board_no="+vo.getImage_board_no());
		}
		return "include/return";
	}
	
	@GetMapping("/imageboard/deleteAjax.do")
	public String deleteAjax(Model model, ImageBoardVo vo) {
		model.addAttribute("result", imageBoardService.delete(vo));
		return "include/result";
	}
	
	
}
