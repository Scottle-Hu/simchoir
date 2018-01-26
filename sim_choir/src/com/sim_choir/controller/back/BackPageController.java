package com.sim_choir.controller.back;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.dao.ContactDao;
import com.sim_choir.dao.MessageDao;
import com.sim_choir.dao.RemarkDao;
import com.sim_choir.entity.Album;
import com.sim_choir.entity.Announcement;
import com.sim_choir.entity.Contact;
import com.sim_choir.entity.History;
import com.sim_choir.entity.Introduction;
import com.sim_choir.entity.Member;
import com.sim_choir.entity.Message;
import com.sim_choir.entity.News;
import com.sim_choir.entity.Remark;
import com.sim_choir.entity.Song;
import com.sim_choir.service.AlbumService;
import com.sim_choir.service.AnnouncementService;
import com.sim_choir.service.HistoryService;
import com.sim_choir.service.IntroductionService;
import com.sim_choir.service.MemberService;
import com.sim_choir.service.NewsService;
import com.sim_choir.service.PictureService;
import com.sim_choir.service.SongService;
import com.sim_choir.service.StatisticsService;
import com.sim_choir.util.VerifyCodeUtils;

/**
 * 后台页面的控制器
 * 
 * @author Charles
 * 
 */
@Controller
@RequestMapping("/back")
public class BackPageController {

	@Resource
	private PictureService pictureService;
	@Resource
	private AlbumService albumService;
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
	private RemarkDao remarkDao;
	@Resource
	private ContactDao contactDao;
	@Resource
	private MessageDao messageDao;
	@Resource
	private StatisticsService statisticsService;

	@RequestMapping("/login")
	public String loginPage(HttpServletRequest request) {
		// 传递验证码
		String veriCode = VerifyCodeUtils.generateVerifyCode(4);
		request.removeAttribute("veriCode");
		request.setAttribute("veriCode", veriCode);

		veriCode=null;
		
		return "back/login";
	}

	@RequestMapping("/main")
	public String mainPage(HttpServletRequest request) {
		// 判断是否从登陆页面过来
		if (request.getSession().getAttribute("admin") == null) {
			System.out.println("过滤");
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		//获取各个统计量
		int todayNum=statisticsService.findToday();
		int weekNum = statisticsService.findWeek();
		int monthNum=statisticsService.findMonth();
		int totalNum = statisticsService.findAllNum();
		request.removeAttribute("todayNum");
		request.removeAttribute("weekNum");
		request.removeAttribute("monthNum");
		request.removeAttribute("totalNum");
		request.setAttribute("todayNum",todayNum);
		request.setAttribute("weekNum", weekNum);
		request.setAttribute("monthNum",monthNum);
		request.setAttribute("totalNum", totalNum);
		//获取最新评论
		List<Remark> remarkList = remarkDao.findAllRemark();
		List<Remark> latestRemark = new ArrayList<Remark>();
		if(remarkList.size()>=6){
			for(int i = 0;i<6;i++){
				latestRemark.add(remarkList.get(remarkList.size()-1-i));
			}
		}else{
			for(int i = 0;i<remarkList.size();i++){
				latestRemark.add(remarkList.get(remarkList.size()-1-i));
			}
		}
		request.removeAttribute("latestRemark");
		request.setAttribute("latestRemark", latestRemark);
		
		latestRemark=null;
		
		//获取各个内容数量
		int albumNum = albumService.getAll().size();
		int memberNum = memberService.getAll().size();
		int noticeNum = annoService.getAll().size();
		int songNum = songService.getAllSongs().size();
		int newsNum = newsService.getAll().size();
		int messageNum = messageDao.findAll().size();
		request.setAttribute("albumNum", albumNum);
		request.setAttribute("memberNum", memberNum);
		request.setAttribute("noticeNum", noticeNum);
		request.setAttribute("songNum", songNum);
		request.setAttribute("newsNum", newsNum);
		request.setAttribute("messageNum", messageNum);

		
		return "back/index";
	}

	// 相册管理
	@RequestMapping("/picture")
	public String picturePage(HttpServletRequest request) {
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		// 获取所有相册
		Album latest = albumService.getLatest();
		List<Album> albumList = albumService.getAll();
		albumList.add(0, latest);
		// 传递给页面
		request.removeAttribute("albumList");
		request.setAttribute("albumList", albumList);
		
		albumList=null;

		return "back/picManagement";
	}

	// 相册编辑页面
	@RequestMapping("/pic-edit")
	public String picEdit(HttpServletRequest request) {
		// 判断是否从本站页面页面过来
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		// 获取编辑相册的id
		String id = request.getParameter("albumId");
		if (id != null) {
			// 获取相册对象
			Album album = albumService.getById(Integer.parseInt(id));
			if (album != null) {
				// 传递给页面
				request.removeAttribute("album");
				request.setAttribute("album", album);
				
				album=null;
			} else {
				return "redirect:/back/picture.html";
			}
		} else {
			return "redirect:/back/picture.html";
		}
		return "back/picEdit";
	}

	// 成员管理页面
	@RequestMapping("/member")
	public String memberManagement(HttpServletRequest request) {
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		// 获取所有成员
		List<Member> memberList = memberService.getAll();
		//传递
		request.removeAttribute("memberList");
		request.setAttribute("memberList", memberList);
		//获取预览成员
		List<Member> previewMember = memberService.getPreview();
		request.removeAttribute("previewMember");
		request.setAttribute("previewMember", previewMember);
		
		memberList=null;
		previewMember=null;
		
		return "back/memberManagement";
	}
	
	//公告管理
	@RequestMapping("/notice")
	public String noticePage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取所有公告
		List<Announcement> annoList=annoService.getAll();
		request.removeAttribute("annoList");
		request.setAttribute("annoList", annoList);
		
		annoList=null;
		
		return "back/notice";
	}
	
	//公告编辑
	@RequestMapping("/notice-edit")
	public String noticeEdit(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		String annoId = request.getParameter("annoId");
		if(annoId!=null){
			Announcement anno = annoService.getById(Integer.parseInt(annoId));
			request.removeAttribute("anno");
			request.setAttribute("anno", anno);
			
			anno=null;
		}else{
			return "redirect:/back/notice.html";
		}
		
		return "back/noticeEdit";
	}
	
	//公告发布
	@RequestMapping("/notice-add")
	public String noticeAdd(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		return "back/noticeAdd";
	}
	
	//歌曲管理页面
	@RequestMapping("/song")
	public String songPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取所有歌曲
		List<Song> songList = songService.getAllSongs();
		request.removeAttribute("songList");
		request.setAttribute("songList", songList);
		
		songList=null;
		
		return "back/song";
	}
	
	//歌曲添加页面
	@RequestMapping("/song-add")
	public String songAdd(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		return "back/songAdd";
	}
	
	//新闻管理
	@RequestMapping("/news")
	public String newsPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取所有新闻
		List<News> newsList = newsService.getAll();
		request.removeAttribute("newsList");
		request.setAttribute("newsList", newsList);
		
		newsList=null;
		
		return "back/news";
	}
	
	//添加新闻页面
	@RequestMapping("/add-news")
	public String addNewsPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		
		return "back/newsAdd";
	}
	
	//评论管理页面
	@RequestMapping("/remark")
	public String remarkPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取所有评论
		List<Remark> remarkList=remarkDao.findAllRemark();
		for(int i=0;i<remarkList.size()/2;i++){
			Remark t = remarkList.get(remarkList.size()-i-1);
			remarkList.set(remarkList.size()-i-1, remarkList.get(i));
			remarkList.set(i, t);
		}
		request.removeAttribute("remarkList");
		request.setAttribute("remarkList", remarkList);
		
		remarkList=null;
		
		return "back/remark";
	}
	
	//歌曲评论页面
	@RequestMapping("/remark-song")
	public String songRemark(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取歌曲评论
		List<Remark> remarkList=remarkDao.findAllSongRemark();
		for(int i=0;i<remarkList.size()/2;i++){
			Remark t = remarkList.get(remarkList.size()-i-1);
			remarkList.set(remarkList.size()-i-1, remarkList.get(i));
			remarkList.set(i, t);
		}
		request.removeAttribute("remarkList");
		request.setAttribute("remarkList", remarkList);
		
		remarkList=null;
		
		return "back/remark-song";
	}
	
	//动态评论页面
	@RequestMapping("/remark-news")
	public String newsRemark(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取歌曲评论
		List<Remark> remarkList=remarkDao.findAllNewsRemark();
		for(int i=0;i<remarkList.size()/2;i++){
			Remark t = remarkList.get(remarkList.size()-i-1);
			remarkList.set(remarkList.size()-i-1, remarkList.get(i));
			remarkList.set(i, t);
		}
		request.removeAttribute("remarkList");
		request.setAttribute("remarkList", remarkList);
		
		remarkList=null;
		
		return "back/remark-news";
	}
	
	//消息中心页面
	@RequestMapping("/message")
	public String messagePage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		
		//获取所有消息
		List<Message> messageList = messageDao.findAll();
		int numOfWait = messageDao.findNumOfWait();
		int numOfAlready = messageDao.findNumOfAlready();
		request.removeAttribute("messageList");
		request.removeAttribute("numOfWait");
		request.removeAttribute("numOfAlready");
		request.setAttribute("messageList", messageList);
		request.setAttribute("numOfWait", numOfWait);
		request.setAttribute("numOfAlready", numOfAlready);
		
		messageList=null;
		
		return "back/message";
	}
	
	//已读消息页面
	@RequestMapping("/message-already")
	public String messageAlreadyPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		
		//获取所有消息
		List<Message> messageList = messageDao.findAlready();
		int numOfWait = messageDao.findNumOfWait();
		int numOfAlready = messageDao.findNumOfAlready();
		request.removeAttribute("messageList");
		request.removeAttribute("numOfWait");
		request.removeAttribute("numOfAlready");
		request.setAttribute("messageList", messageList);
		request.setAttribute("numOfWait", numOfWait);
		request.setAttribute("numOfAlready", numOfAlready);
		
		messageList=null;
		
		return "back/message2";
	}
	
	//未读消息页面
	@RequestMapping("/message-wait")
	public String messageWaitPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		
		//获取所有消息
		List<Message> messageList = messageDao.findWait();
		int numOfWait = messageDao.findNumOfWait();
		int numOfAlready = messageDao.findNumOfAlready();
		request.removeAttribute("messageList");
		request.removeAttribute("numOfWait");
		request.removeAttribute("numOfAlready");
		request.setAttribute("messageList", messageList);
		request.setAttribute("numOfWait", numOfWait);
		request.setAttribute("numOfAlready", numOfAlready);
		
		messageList=null;
		
		return "back/message3";
	}

	//设置联系方式页面
	@RequestMapping("/contact")
	public String contactPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		Contact contact = contactDao.find();
		request.removeAttribute("contact");
		request.setAttribute("contact", contact);
		
		contact=null;
		
		return "back/contact";
	}
	
	//消息详情页面
	@RequestMapping("/this-message")
	public String thisMessage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		String id=request.getParameter("messageId");
		if(id!=null){
			messageDao.read(Integer.parseInt(id));
			
			Message message = messageDao.findById(Integer.parseInt(id));
			request.removeAttribute("message");
			request.setAttribute("message", message);
			
			message=null;
			
		}else{
			return "redirect:/back/message.html";
		}
		id=null;
		
		return "back/thisMessage";
	}
	
	
	//流量统计页面
	@RequestMapping("/webSet")
	public String statisticPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		//获取各个统计量
		int todayNum=statisticsService.findToday();
		int weekNum = statisticsService.findWeek();
		int monthNum=statisticsService.findMonth();
		int totalNum = statisticsService.findAllNum();
		request.removeAttribute("todayNum");
		request.removeAttribute("weekNum");
		request.removeAttribute("monthNum");
		request.removeAttribute("totalNum");
		request.setAttribute("todayNum",todayNum);
		request.setAttribute("weekNum", weekNum);
		request.setAttribute("monthNum",monthNum);
		request.setAttribute("totalNum", totalNum);
		
		return "back/statistic";
	}
	
	//历史和简介管理
	@RequestMapping("/intro-his")
	public String introductionAndHistoryPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		//获取简介
		Introduction introduction = introductionService.get();
		request.removeAttribute("introduction");
		request.setAttribute("introduction", introduction);
		//获取历史
		List<History> historyList = historyService.getAll();
		request.removeAttribute("historyList");
		request.setAttribute("historyList", historyList);
		
		introduction=null;
		historyList=null;
		
		return "back/intro-his";
	}
	
	//指挥特辑管理
	@RequestMapping("/conductor")
	public String conductorPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		//获取内容
		String conductor =contactDao.findPreOfConductor();
		request.removeAttribute("conductor");
		request.setAttribute("conductor", conductor);
		List<History> history = historyService.getAll();
		request.removeAttribute("historyList");
		request.setAttribute("historyList", history);
		
		conductor=null;
		history=null;
		
		return "back/conductor";
	}
	
	//添加历史事件
	@RequestMapping("/add-history")
	public String addHistoryPage(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		int numOfWait = messageDao.findNumOfWait();
		request.removeAttribute("numOfWait");
		request.setAttribute("numOfWait", numOfWait);
		
		return "back/addHistory";
	}
	
	//出错页面404
	@RequestMapping("/404")
	public String page404(){
		
		return "404";
	}
	
	//出错页面500
	@RequestMapping("/500")
	public String page500(){
		
		return "500";
	}
	
}
