package com.kh.spring.lecture.model.service;

@Service("wishService")
@Transactional(propagation=Propagation.REQUIRED)
public class WishServiceImpl implements WishService{
	@Autowired
	Wish wish;
	WishDao wDao;
	
	public Map<String,List> myWishList(Wish wish) throws Exception{
		map<String, List> wishMap=new HashMap<String, List>();
		List<Wish> myWishList=wDao.selectWishList(wish);
		if(myWishList.size()==0) {
			return null;
		}
		List<Wish> myWishList=wDao.selectLecsList(myWishList);
		wishMap.put("myWishList", myWishList);
		wishMap.put("myLecsList", myLecsList);
		return wishMap;
	}
	
	public boolean findWishLecs(Wish wish) throws Exception{
		return wDao.selectCountInWish(Wish);
	}
	public void addLecsInWish(Wish wish) throws Exception{
		wDao.insertLecsInWish(Wish);
	}
	

}
