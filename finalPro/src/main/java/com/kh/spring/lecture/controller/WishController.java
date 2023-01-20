package com.kh.spring.lecture.controller;

	@Controller("WishController")
	@RequestMapping(value="/cart")
public class WishController {
		@Autowired
		WishService wService;
		@Autowired
		Wish wish;
		@Autowired
		Member member;
		
		@RequestMapping(value="/addLecsInWish.wi", method=RequestMethod.POST, produces = "application/text;charset=utf8")
		public @ResponseBody String addLecsInWish(@RequestParam("lec_no") int lec_no,
													HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session = request.getSession();
			Member=(Member)session.getAttribute("memberInfo");
			String mem_no=Member.getMember_no();
			Wish.setMember_no(mem_no);
			Wish.setLec_no(lec_no);
			boolean isAlreadyExisted = wService.findWishLecs(Wish);
			if(isAlreadyExisted==true) {
				return "already_existed";
			}else {
				wService.addLecsInWish(Wish);
				return 	"add_success";
			}
			
			@RequestMapping(value="myWishList.wi", method=RequestMethod.GET)
			public ModelAndView myWishMain(HttpServletRequest request,
											HttpServletResponse response)throws Exception{
				String viewName = (String)request.getAttribute("viewName");
				ModelAndView mav = new ModelAndView(viewName);
				HttpSession session = request.getSession;
				Member member = (Member)session.getAttribute("memberInfo");
				int mem_no = member.getmem_no;
				wish.setMem_no =(member_no);
				Map<String, List> wishMap = wishService.myWishList(wish);
				session.setAttribute("wishMap", wishMap);
				return mav;
			}
		}
	
	
}