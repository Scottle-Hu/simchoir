package com.sim_choir.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.dao.ContactDao;
import com.sim_choir.dao.StatisticsDao;
import com.sim_choir.entity.Album;
import com.sim_choir.entity.Announcement;
import com.sim_choir.entity.Contact;
import com.sim_choir.entity.History;
import com.sim_choir.entity.Introduction;
import com.sim_choir.entity.Member;
import com.sim_choir.entity.News;
import com.sim_choir.entity.Song;
import com.sim_choir.service.AlbumService;
import com.sim_choir.service.AnnouncementService;
import com.sim_choir.service.HistoryService;
import com.sim_choir.service.IntroductionService;
import com.sim_choir.service.MemberService;
import com.sim_choir.service.NewsService;
import com.sim_choir.service.SongService;
import com.sim_choir.service.StatisticsService;

/**
 * 访问各个页面的控制器
 * 
 * @author Charles
 * 
 */
@Controller
public class PageController {

	@Resource
	private SongService songService;
	@Resource
	private AnnouncementService annoService;
	@Resource
	private NewsService newsService;
	@Resource
	private MemberService memberService;
	@Resource
	private HistoryService historyService;
	@Resource
	private IntroductionService introductionService;
	@Resource
	private AlbumService albumService;
	@Resource
	private ContactDao contactDao;
	@Resource
	private StatisticsService statisticsService;
	

	// 访问首页
	@RequestMapping("/home")
	public String homePage(HttpServletRequest request) {
		//访问量加一
		statisticsService.add();
		
		// 获取预览歌曲列表
		List<Song> songList = songService.getPreview();
		request.removeAttribute("songList");
		request.setAttribute("songList", songList);
		// 获取最近公告列表
		List<Announcement> annoList = annoService.getPreview();
		request.removeAttribute("annoList");
		request.setAttribute("annoList", annoList);
		// 获取最新动态列表
		List<News> newsList = newsService.getPreview();
		request.removeAttribute("newsList");
		request.setAttribute("newsList", newsList);
		
		songList=null;
		annoList=null;
		newsList=null;

		return "index";
	}

	// 访问index-1.jsp，即“合唱团”页面
	@RequestMapping("/choir")
	public String choirPage(HttpServletRequest request) {
		// 获取预览的成员集合
		List<Member> memberList = memberService.getPreview();
		request.removeAttribute("memberList");
		request.setAttribute("memberList", memberList);
		// 获取预览发展历史集合
		List<History> historyList = historyService.getPreview();
		request.removeAttribute("historyList");
		request.setAttribute("historyList", historyList);
		// 获取简介
		Introduction introduction = introductionService.get();
		request.removeAttribute("introduction");
		request.setAttribute("introduction", introduction);

		memberList=null;
		historyList=null;
		introduction=null;
		
		return "index-1";
	}

	// 访问index-2.jsp，即“最新动态”
	@RequestMapping("/news")
	public String newsPage(HttpServletRequest request) {
		// 获取筛选条件，1代表最近更新，2代表浏览最多，3代表评论最多，4代表点赞最多
		String condition = request.getParameter("condition");
		List<News> newsList = newsService.getAll();
		List<News> topNews = new ArrayList<News>();
		if (condition == null || Integer.parseInt(condition) == 2) { // 没有筛选条件，默认按浏览最多
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			// 判断所有动态的个数
			if (newsList.size() == 0) {
				News news = new News();
				news.setTittle("暂无动态");
				news.setContent("没有更多动态了");
				news.setDate(df.format(new Date()));
				topNews.add(news);
				topNews.add(news); // 添加两个空的动态
			} else if (newsList.size() == 1) {
				topNews.add(newsList.get(0));
				News news = new News();
				news.setTittle("暂无动态");
				news.setContent("没有更多动态了");
				news.setDate(df.format(new Date()));
				topNews.add(news); // 添加一个空的动态
			} else {
				// 选择浏览次数最多的两个并排序放入
				if (newsList.get(0).getScanNum() > newsList.get(1).getScanNum()) {
					topNews.add(newsList.get(0));
					topNews.add(newsList.get(1));
				} else {
					topNews.add(newsList.get(1));
					topNews.add(newsList.get(0));
				}
				// 遍历迭代选择最多的两个
				for (int i = 2; i < newsList.size(); i++) {
					News news2 = newsList.get(i);
					if (news2.getScanNum() > topNews.get(0).getScanNum()) {
						topNews.set(1, topNews.get(0));
						topNews.set(0, news2);
					} else if (news2.getScanNum() > topNews.get(1).getScanNum()) {
						topNews.remove(1);
						topNews.add(news2);
					}
				}// #遍历结束，获得浏览次数最多的两个
			}
			condition = "2";
		} else {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			switch (Integer.parseInt(condition)) {
			case 1: {
				topNews = newsService.getPreview();
				condition = "1";
				break;
			}
			case 3: {
				// 判断所有动态的个数
				if (newsList.size() == 0) {
					News news = new News();
					news.setTittle("暂无动态");
					news.setContent("没有更多动态了");
					news.setDate(df.format(new Date()));
					topNews.add(news);
					topNews.add(news); // 添加两个空的动态
				} else if (newsList.size() == 1) {
					topNews.add(newsList.get(0));
					News news = new News();
					news.setTittle("暂无动态");
					news.setContent("没有更多动态了");
					news.setDate(df.format(new Date()));
					topNews.add(news); // 添加一个空的动态
				} else {
					// 选择评论次数最多的两个并排序放入
					if (newsList.get(0).getRemarkList().size() > newsList.get(1).getRemarkList().size()) {
						topNews.add(newsList.get(0));
						topNews.add(newsList.get(1));
					} else {
						topNews.add(newsList.get(1));
						topNews.add(newsList.get(0));
					}
					// 遍历迭代选择最多的两个
					for (int i = 2; i < newsList.size(); i++) {
						News news2 = newsList.get(i);
						if (news2.getRemarkList().size() > topNews.get(0).getRemarkList().size()) {
							topNews.set(1, topNews.get(0));
							topNews.set(0, news2);
						} else if (news2.getRemarkList().size() > topNews.get(1).getRemarkList().size()) {
							topNews.remove(1);
							topNews.add(news2);
						}
					}// #遍历结束，获得评论最多的两个
				}
				condition = "3";
				break;
			}
			case 4: {
				// 判断所有动态的个数
				if (newsList.size() == 0) {
					News news = new News();
					news.setTittle("暂无动态");
					news.setContent("没有更多动态了");
					news.setDate(df.format(new Date()));
					topNews.add(news);
					topNews.add(news); // 添加两个空的动态
				} else if (newsList.size() == 1) {
					topNews.add(newsList.get(0));
					News news = new News();
					news.setTittle("暂无动态");
					news.setContent("没有更多动态了");
					news.setDate(df.format(new Date()));
					topNews.add(news); // 添加一个空的动态
				} else {
					// 选择点赞次数最多的两个并排序放入
					if (newsList.get(0).getPraiseNum() > newsList.get(1).getPraiseNum()) {
						topNews.add(newsList.get(0));
						topNews.add(newsList.get(1));
					} else {
						topNews.add(newsList.get(1));
						topNews.add(newsList.get(0));
					}
					// 遍历迭代选择最多的两个
					for (int i = 2; i < newsList.size(); i++) {
						News news2 = newsList.get(i);
						if (news2.getPraiseNum() > topNews.get(0).getPraiseNum()) {
							topNews.set(1, topNews.get(0));
							topNews.set(0, news2);
						} else if (news2.getPraiseNum() > topNews.get(1).getPraiseNum()) {
							topNews.remove(1);
							topNews.add(news2);
						}
					}// #遍历结束，获得点赞次数最多的两个
				}
				condition = "4";
				break;
			}
			default: {
				topNews = newsService.getPreview();
				condition = "2";
				break;
			}
			}

		}
		request.removeAttribute("conditionId");
		request.setAttribute("conditionId", Integer.parseInt(condition));
		// 根据筛选的条件的两个动态
		request.removeAttribute("topNews");
		request.setAttribute("topNews", topNews);
		// 下面进行分页操作
		// 获取总页数
		int pageNum = newsList.size() / 10 + (newsList.size() % 10 == 0 ? 0 : 1);
		// 传递给页面
		request.removeAttribute("pageNum");
		request.setAttribute("pageNum", pageNum);
		int page = 0;// 当前页数
		// 获取分页页数参数
		String pageStr = request.getParameter("page");
		if (pageStr == null || Integer.parseInt(pageStr) > pageNum) {// 第一次访问或者参数错误
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		// 传递给页面
		request.removeAttribute("page");
		request.setAttribute("page", page);
		// 获取当前页面动态信息
		newsList = newsList.subList(10 * (page - 1), 10 * page > newsList.size() ? newsList.size() : 10 * page);
		// 传递给页面
		request.removeAttribute("newsList");
		request.setAttribute("newsList", newsList);

		condition=null;
		topNews=null;
		newsList=null;
		
		return "index-2";
	}

	// 访问index-3.jsp，即“我们的歌”页面
	@RequestMapping("/song")
	public String songPage(HttpServletRequest request) {
		// 获取所有歌曲列表
		List<Song> songList = songService.getAllSongs();
		// 获取页数,12个每页
		int pageNum = songList.size() / 12 + (songList.size() % 12 == 0 ? 0 : 1);
		// 进行分页
		String pageStr = request.getParameter("page");
		int page = 1; // 第一次访问或者参数非法默认1
		if (pageStr != null && Integer.parseInt(pageStr) <= pageNum) {
			page = Integer.parseInt(pageStr);
		}
		// 传递分页信息
		request.removeAttribute("page");
		request.setAttribute("page", page);
		request.removeAttribute("pageNum");
		request.setAttribute("pageNum", pageNum);
		// 获取分页对象数组
		songList = songList.subList(12 * (page - 1), 12 * page > songList.size() ? songList.size() : 12 * page);
		request.removeAttribute("songList");
		request.setAttribute("songList", songList);
		// 筛选结果对象
		Song topSong = new Song();
		topSong.setName("暂无歌曲");
		topSong.setIntroduction("没有更多歌曲了...");
		// 筛选条件
		String conditionStr = null;
		// 获取筛选条件，1 最近更新，2点赞最多 ， 3 评论最多， 4 浏览最多
		String condition = request.getParameter("condition");
		if (condition == null || Integer.parseInt(condition) > 4 || Integer.parseInt(condition) < 0
				|| Integer.parseInt(condition) == 4) {
			// 默认选择：浏览最多
			if (songList.size() > 0) {
				topSong = songList.get(0);
				for (int i = 1; i < songList.size(); i++) {
					if (songList.get(i).getScanNum() > topSong.getScanNum()) {
						topSong = songList.get(i);
					}
				}
			}
			conditionStr = "浏览最多";
		} else {
			switch (Integer.parseInt(condition)) {
			case 1: { // 最近更新
				conditionStr = "最近更新";
				topSong = songList.size() > 0 ? songService.getById(songList.get(0).getId()) : topSong;
				break;
			}
			case 2: {
				if (songList.size() > 0) {
					topSong = songList.get(0);
					for (int i = 1; i < songList.size(); i++) {
						if (songList.get(i).getPraiseNum() > topSong.getPraiseNum()) {
							topSong = songList.get(i);
						}
					}
				}
				conditionStr = "点赞最多";
				break;
			}
			case 3: {
				if (songList.size() > 0) {
					topSong = songList.get(0);
					for (int i = 1; i < songList.size(); i++) {
						if (songList.get(i).getRemarkList().size() > topSong.getRemarkList().size()) {
							topSong = songList.get(i);
						}
					}
				}
				conditionStr = "评论最多";
				break;
			}
			default: {
				// 便于扩展
				break;
			}

			}
		}

		request.removeAttribute("conditionStr");
		request.setAttribute("conditionStr", conditionStr);
		request.removeAttribute("topSong");
		request.setAttribute("topSong", topSong);

		songList=null;
		conditionStr=null;
		topSong=null;
		pageStr=null;
		
		
		return "index-3";
	}

	// 访问index-4.jsp,即“图片”页面
	@RequestMapping("/picture")
	public String picturePage(HttpServletRequest request) {
		// 获取最新相册
		Album latestAlbum = albumService.getLatest();
		request.removeAttribute("latestAlbum");
		request.setAttribute("latestAlbum", latestAlbum);
		// 获取所有相册集合
		List<Album> albumList = albumService.getAll();
		request.removeAttribute("albumList");
		request.setAttribute("albumList", albumList);

		latestAlbum=null;
		albumList=null;
		
		return "index-4";
	}

	// 访问index-5.jsp，即“公告”页面
	@RequestMapping("/announcement")
	public String annoPage(HttpServletRequest request, HttpServletResponse response) {
		// 获取所有公告集合
		List<Announcement> annoList = annoService.getAll();
		int pageNum = annoList.size() / 10 + (annoList.size() % 10 == 0 ? 0 : 1);
		// 传递分页信息给页面
		request.removeAttribute("pageNum");
		request.setAttribute("pageNum", pageNum);
		// 获取分页信息
		String pageStr = request.getParameter("page");
		int page = 0;
		if (pageStr == null || Integer.parseInt(pageStr) > pageNum) { // 没有参数或参数不合法，即返回第一页
			page = 1;
		} else {
			page = Integer.parseInt(pageStr);
		}
		// 传递当前分页给页面
		request.removeAttribute("page");
		request.setAttribute("page", page);
		// 获取当前分页的公告对象集合
		List<Announcement> currentAnno = annoList.subList(10 * (page - 1),
				10 * page > annoList.size() ? annoList.size() : 10 * page);
		// 传递公告对象给页面
		request.removeAttribute("annoList");
		request.setAttribute("annoList", currentAnno);

		pageStr=null;
		currentAnno=null;
		
		return "index-5";
	}

	// 访问index-6.jsp，即“联系我们”页面
	@RequestMapping("/contact")
	public String contactPage(HttpServletRequest request) {
		//获取联系方式
		Contact contact = contactDao.find();
		request.removeAttribute("contact");
		request.setAttribute("contact", contact);
		
		contact=null;
		
		return "index-6";
	}


	// 访问member.jsp，即现任成员页面
	@RequestMapping("/member")
	public String memberPage(HttpServletRequest request) {
		// 获取所有成员集合
		List<Member> memberList = memberService.getAll();
		request.removeAttribute("memberList");
		request.setAttribute("memberList", memberList);

		memberList=null;
		
		return "member";
	}

	// 访问pics.jsp即具体相册内容页面
	@RequestMapping("/pics.html")
	public String picsPage(HttpServletRequest request, HttpServletResponse response) {
		// 获取相册id
		int id = Integer.parseInt(request.getParameter("albumId"));
		// 获取相册对象
		Album album = albumService.getById(id);
		// 判断是否存在（理论上肯定是存在）
		if (album == null) {
			// 返回去图片页面
			return "index-4";
		} else {
			// 找出上下相册
			List<Album> albumList = albumService.getAll();
			albumList.add(0, albumService.getLatest());
			Album preAlbum = null;
			Album nextAlbum = null;
			if (albumList.size() > 1) {
				if (albumList.indexOf(album) == 0) {
					nextAlbum = albumList.get(1);
				} else if (albumList.indexOf(album) == albumList.size() - 1) {
					preAlbum = albumList.get(albumList.size() - 2);
				} else {
					nextAlbum = albumList.get(albumList.indexOf(album) + 1);
					preAlbum = albumList.get(albumList.indexOf(album) - 1);
				}
			}
			request.removeAttribute("nextAlbum");
			request.removeAttribute("preAlbum");
			request.setAttribute("preAlbum", preAlbum);
			request.setAttribute("nextAlbum", nextAlbum);

			preAlbum=null;
			nextAlbum=null;
			
			// 传递参数给pics.jsp页面
			request.removeAttribute("album");
			request.setAttribute("album", album);
		}
		
		album=null;
				
		return "pics";
	}

	// 访问notice.jsp即具体公告页面
	@RequestMapping("/notice")
	public String noticePge(HttpServletRequest request) {
		// 获取公告id
		int id = Integer.parseInt(request.getParameter("annoId"));
		// 获取公告对象
		Announcement anno = annoService.getById(id);
		// 传递给页面
		request.removeAttribute("anno");
		request.setAttribute("anno", anno);
		// 获取上一个和下一个公告
		List<Announcement> annoList = annoService.getAll();
		int index = annoList.indexOf(anno);
		Announcement priorAnno = null, nextAnno = null;
		if (index == 0) {
			if (annoList.size() > 1) {
				nextAnno = annoList.get(1);
			}
		} else if (index == annoList.size() - 1) {
			if (annoList.size() > 1) {
				priorAnno = annoList.get(annoList.size() - 2);
			}
		} else {
			priorAnno = annoList.get(index - 1);
			nextAnno = annoList.get(index + 1);
		}
		// 传递给页面
		request.removeAttribute("priorAnno");
		request.setAttribute("priorAnno", priorAnno);
		request.removeAttribute("nextAnno");
		request.setAttribute("nextAnno", nextAnno);
		
		anno=null;
		priorAnno=null;
		nextAnno=null;

		return "notice";
	}

	// 访问"thisSong.jsp"，即具体歌曲页面
	@RequestMapping("/thisSong")
	public String thisSongPage(HttpServletRequest request) {
		// 获取id
		String id = request.getParameter("songId");
		// 获取歌曲
		Song song = songService.getById(Integer.parseInt(id));
		if (song == null) { // 找不到歌曲
			return "song";
		} else {
			// 歌曲浏览加一
			songService.updateScanNum(Integer.parseInt(id));
			// 获取前后歌曲
			List<Song> songList = songService.getAllSongs();
			Song preSong = null;
			Song nextSong = null;
			if (songList.size() == 1) {
				// nothing
			} else if (songList.indexOf(song) == 0) {
				nextSong = songList.get(songList.indexOf(song) + 1);
			} else if (songList.indexOf(song) == songList.size() - 1) {
				preSong = songList.get(songList.indexOf(song) - 1);
			} else {
				nextSong = songList.get(songList.indexOf(song) + 1);
				preSong = songList.get(songList.indexOf(song) - 1);
			}
			// 传递给页面
			request.removeAttribute("preSong");
			request.setAttribute("preSong", preSong);
			request.removeAttribute("nextSong");
			request.setAttribute("nextSong", nextSong);
			request.removeAttribute("song");
			request.setAttribute("song", song);
			
			preSong=null;
			nextSong=null;
		}
		
		id=null;
		song=null;

		return "thisSong";
	}
	
	//访问具体新闻的页面
	@RequestMapping("/the-news")
	public String theNewsPage(HttpServletRequest request){
		//获取id
		String id = request.getParameter("newsId");
		if(id!=null){
			
			News news = newsService.getById(Integer.parseInt(id));
			if(news==null){
				return "redirect:/home.html";
			}
			request.removeAttribute("news");
			request.setAttribute("news", news);
			//新闻浏览加一
			newsService.updateScanNum(Integer.parseInt(id));
			//获取上下文新闻
			List<News> newsList =  newsService.getAll();
			News priorNews = null;
			News nextNews = null;
			if (newsList.size() == 1) {
				// nothing
			} else if (newsList.indexOf(news) == 0) {
				nextNews = newsList.get(newsList.indexOf(news) + 1);
			} else if (newsList.indexOf(news) == newsList.size() - 1) {
				priorNews = newsList.get(newsList.indexOf(news) - 1);
			} else {
				nextNews = newsList.get(newsList.indexOf(news) + 1);
				priorNews = newsList.get(newsList.indexOf(news) - 1);
			}
			// 传递给页面
			request.removeAttribute("priorNews");
			request.setAttribute("priorNews", priorNews);
			request.removeAttribute("nextNews");
			request.setAttribute("nextNews", nextNews);
			
			news=null;
			priorNews=null;
			nextNews=null;
		}
		
		id=null;
		
		return "news";
	}
	
	//指挥特辑页面
	@RequestMapping("/conductor")
	public String conductorPage(HttpServletRequest request){
		//获取pre
		String conductor = contactDao.findPreOfConductor();
		request.removeAttribute("conductor");
		request.setAttribute("conductor", conductor);
		
		conductor=null;
		
		return "conductor";
	}
	
	//简介页面
	@RequestMapping("/introduction")
	public String introductionPage(HttpServletRequest request){
		Introduction intro = introductionService.get();
		request.removeAttribute("introduction");
		request.setAttribute("introduction", intro);
		
		intro=null;
		
		return "introduction";
	}
	
	//历史页面
	@RequestMapping("/history")
	public String historyPage(HttpServletRequest request){
		List<History> historyList = historyService.getAll();
		request.removeAttribute("historyList");
		request.setAttribute("historyList", historyList);
		
		historyList=null;
		
		return "history";
	}

}
