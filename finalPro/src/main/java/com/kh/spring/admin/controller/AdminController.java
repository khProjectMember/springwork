package com.kh.spring.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.board.model.vo.Meeting;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.LectureLocation;
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	
	// 대시보드 이동
		@RequestMapping("admin.ad")
		public String admin(Model model) {
			int mCount = aService.selectNewMemberCount();
			int rCount = aService.selectNewReviewCount();
			
			model.addAttribute("mCount", mCount);
			model.addAttribute("rCount", rCount);
			return "admin/admin";
		}
		// 새로운 멤버
		@RequestMapping(value="selectNewMember.ad", produces="application/json; charset=UTF-8")
		@ResponseBody
		public String selectNewMember() {
			JSONArray array = new JSONArray();
			ArrayList<Member> mList = new ArrayList<Member>();
			mList = aService.selectNewMember();
			int mCount = aService.selectNewMemberCount();
			
			if(mList.size()!=0) {
				for(Member m : mList) {
				//	int reviewCount = aService.selectReviewCount(m.getMemId());
					
					JSONObject json = new JSONObject();
					json.put("memId", m.getMemId());
					json.put("memName", m.getMemName());
					json.put("memNickname", m.getMemNickname());
					json.put("memCdate", m.getMemCdate()+"");
					array.add(json);
				}
			}
			return array.toString();
		}
		
		//새로운 리뷰
		@RequestMapping(value="selectNewReview.ad", produces="application/json; charset=UTF-8")
		@ResponseBody
		public String selectNewReview() {
			JSONArray array = new JSONArray();
			int rCount = aService.selectNewReviewCount();
			ArrayList<Review> rList = new ArrayList<Review>();
			rList = aService.selectNewReview();
			
			if(rList.size()!=0) {
				for(Review r : rList) {
					/* String title = MovieInfo.getMovieInfo(r.getMovieId()).getMovieTitle(); */
					JSONObject json = new JSONObject();
					json.put("revNo", r.getRevNo());
					json.put("revLecture", r.getL().getLecName());
					json.put("revStar", r.getRevStar());
					json.put("revTitle", r.getRevTitle());
					json.put("revDate", r.getRevDate()+"");
					json.put("revCount", r.getRevCount());
					json.put("revRec", r.getRevRec());
					array.add(json);
				}
			}
			return array.toString();
		}
		
	@RequestMapping("list2.le")
	public ModelAndView selectLectureList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = aService.selectListCount_Lecture();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
		ArrayList<Lecture> list = aService.selectLectureList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/enroll_LectureList");
		return mv;
	}
	
	@RequestMapping("list.te")
	public ModelAndView selectTeacherList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = aService.selectListCount_Teacher();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
		ArrayList<Teacher> list = aService.selectTeacherList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/enroll_TeacherList");
		return mv;
	}
	@RequestMapping("mlist.ad")
	public ModelAndView selectMemberList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = aService.selectListCount_Member();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
		ArrayList<Member> list = aService.selectMemberList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/manageMember");
		return mv;
	}
	@RequestMapping("hlist.ad")
	public ModelAndView selectHangoutList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = aService.selectListCount_Hangout();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
		ArrayList<Meeting> list = aService.selectHangoutList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/manageHangout");
		return mv;
	}
	
	@RequestMapping("rlist.ad")
	public ModelAndView selectReviewList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = aService.selectListCount_Review();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
		ArrayList<Review> list = aService.selectReviewList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/manageReview");
		return mv;
	}
	@RequestMapping("nlist.ad")
	public ModelAndView selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = aService.selectListCount_Notice();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 10);
		ArrayList<Notice> list = aService.selectNoticeList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/manageNotice");
		return mv;
	}
	
	
	//강사 강의 등록하는 곳
	@RequestMapping("enrollForm.le")
	public String enrollLectureForm(Teacher t, LectureLocation l, Model model) {
			ArrayList<Teacher> tlist = aService.selectTeachers(t);
			ArrayList<LectureLocation> Llist = aService.selectLocations(l);
			
			model.addAttribute("tlist", tlist);
			model.addAttribute("Llist", Llist);
		return "admin/enroll_Lecture";
	}
	
	@RequestMapping("enrollForm.te")
	public String enrollTeacherForm() {
		return "admin/enroll_Teacher";
	}
	
	
	
	@RequestMapping("teainsert.te")
	public String insertTeacher(Teacher t, HttpSession session, Model model) {
		// System.out.println(b);
		// System.out.println(upfile);
		
		 
		//넘어온 파일이 있으면 : 제목, 작성자, 내용, 파일원본명, 파일저장경로까지 있는 바뀐이름
		//넘어온 파일이 없으면 : 제목, 작성자, 내용
		int result = aService.insertTeacher(t);
		if(result > 0 ) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다");
			return "redirect:list.te";
		} else {
			model.addAttribute("errorMsg","게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("lecinsert.le")
	public String insertLecture(Lecture l, MultipartFile upfile, HttpSession session, Model model) {
		// System.out.println(b);
		// System.out.println(upfile);
		// MultipartFile은 파일을 등록하지 않아도 객체가 생성이 됨. 다만 filename= 비어서 들어온다
		
		if(!upfile.getOriginalFilename().equals("")) { 
			  String changeName = changeFilename(upfile, session);
			  l.setLecFilename(upfile.getOriginalFilename());
			  l.setLecFilename("resources/uploadFiles/"+changeName); 
		}
		int result = aService.insertLecture(l);
		if(result > 0 ) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다");
			return "redirect:list2.le";
		} else {
			model.addAttribute("errorMsg","게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("lecupdate.le")
	public String updateLecture(Lecture l, MultipartFile reupfile, HttpSession session, Model model) {
		if(!reupfile.getOriginalFilename().equals("")) { 
			if(l.getLecFilename() != null) {
				new File(session.getServletContext().getRealPath(l.getLecFilename())).delete();
			}
			  String changeName = changeFilename(reupfile, session);
			  l.setLecFilename(reupfile.getOriginalFilename());
			  l.setLecFilename("resources/uploadFiles/"+changeName); 
		}
		 
		//넘어온 파일이 있으면 : 제목, 작성자, 내용, 파일원본명, 파일저장경로까지 있는 바뀐이름
		//넘어온 파일이 없으면 : 제목, 작성자, 내용
		int result = aService.updateLecture(l);
		System.out.println(result);
		if(result > 0 ) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다");
			return "redirect:list2.le";
		} else {
			model.addAttribute("errorMsg","게시글 수정 실패");
			return "common/errorPage";
		}
		
		
	}
	@RequestMapping("updateForm.le")
	public String modify_Lecture(Integer lecNo, Teacher t, LectureLocation l, Model model) {
		ArrayList<Teacher> tlist = aService.selectTeachers(t);
		ArrayList<LectureLocation> Llist = aService.selectLocations(l);
		 
		model.addAttribute("tlist", tlist);
		model.addAttribute("Llist", Llist);
		model.addAttribute("l", aService.selectLecture(lecNo));
		return "admin/modify_Lecture";
	}
	
	public String changeFilename(MultipartFile upfile, HttpSession session) {
			String originName = upfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000 );
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName = currentTime + ranNum + ext;
			
			//업로드 시키고자 하는 폴더의 물리적인 경로 알아오기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				try {
					upfile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				} 
			return changeName;
	}
	
	

	//리뷰 선택 삭제
		@RequestMapping("deleteReview.ad")
		public String deleteReview_ad(@RequestParam(value="deleteArr[]") List<String> deleteArr) {
//			System.out.println(deleteArr);
			int result = 0;
			for(int i = 0; i < deleteArr.size(); i++) {
				result = aService.deleteReview_ad(deleteArr.get(i));
			}
			
			if(result > 0) {
				return "redirect:rlist.ad";
			} else {
				System.out.println("컨트롤러에서 실패");
				return "";
			}
			
		}
		//공지 선택 삭제
				@RequestMapping("deleteNotice.ad")
				public String deleteNotice_ad(@RequestParam(value="deleteArr[]") List<String> deleteArr) {
//					System.out.println(deleteArr);
					int result = 0;
					for(int i = 0; i < deleteArr.size(); i++) {
						result = aService.deleteNotice_ad(deleteArr.get(i));
					}
					
					if(result > 0) {
						return "redirect:nlist.ad";
					} else {
						System.out.println("컨트롤러에서 실패");
						return "";
					}
					
				}
				//회원 선택 삭제
				@RequestMapping("deleteMember.ad")
				public String deleteMember_ad(@RequestParam(value="deleteArr[]") List<String> deleteArr) {
//					System.out.println(deleteArr);
					int result = 0;
					for(int i = 0; i < deleteArr.size(); i++) {
						result = aService.deleteMember_ad(deleteArr.get(i));
					}
					
					if(result > 0) {
						return "redirect:mlist.ad";
					} else {
						System.out.println("컨트롤러에서 실패");
						return "";
					}
				}
				//회원 선택 삭제
				@RequestMapping("deleteHangout.ad")
				public String deleteHangout_ad(@RequestParam(value="deleteArr[]") List<String> deleteArr) {
					int result = 0;
					for(int i = 0; i < deleteArr.size(); i++) {
						result = aService.deleteHangout_ad(deleteArr.get(i));
					}
					
					if(result > 0) {
						return "redirect:hlist.ad";
					} else {
						System.out.println("컨트롤러에서 실패");
						return "";
					}
				}

				//강사 선택 삭제
				@RequestMapping("deleteTeacher.ad")
				public String deleteTeacher_ad(@RequestParam(value="deleteArr[]") List<String> deleteArr) {
					int result = 0;
					for(int i = 0; i < deleteArr.size(); i++) {
						result = aService.deleteTeacher_ad(deleteArr.get(i));
					}
					
					if(result > 0) {
						return "redirect:list.te";
					} else {
						System.out.println("컨트롤러에서 실패");
						return "";
					}
				}
				//강의 선택 삭제
				@RequestMapping("deleteLecture.ad")
				public String deleteLecture_ad(@RequestParam(value="deleteArr[]") List<String> deleteArr) {
					int result = 0;
					for(int i = 0; i < deleteArr.size(); i++) {
						result = aService.deleteLecture_ad(deleteArr.get(i));
					}
					
					if(result > 0) {
						return "redirect:list2.le";
					} else {
						System.out.println("컨트롤러에서 실패");
						return "";
					}
				}
}