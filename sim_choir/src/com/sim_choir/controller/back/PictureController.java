package com.sim_choir.controller.back;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sim_choir.entity.Album;
import com.sim_choir.entity.Picture;
import com.sim_choir.service.AlbumService;
import com.sim_choir.service.PictureService;

/**
 * 图片管理的控制器
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class PictureController {

	@Resource
	private PictureService pictureService;
	@Resource
	private AlbumService albumService;
	
	//删除相册
	@RequestMapping("/deleteAlbum")
	public String deleteAlbum(HttpServletRequest request){
		//获取删除相册的id
		String id = request.getParameter("albumId");
		if(id==null){
			return "redirect:/back/picture.html";
		}else{
			//调用service
			albumService.deleteAlbum(Integer.parseInt(id));
		}
		
		return "redirect:/back/picture.html";
	}
	
	//上传单张图片
	@RequestMapping("/singlePicUpload")
	public String singlePic(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException{
		//获取相册id
		String id=request.getParameter("albumId");
		//获取图片字节流
		byte[] pic = file.getBytes();
		//创建图片对象
		if(id!=null && pic!=null){
			Picture picture = new Picture();
			picture.setAlbumId(Integer.parseInt(id));
			picture.setPic(pic);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			//test
			System.out.println(df.format(new Date(System.currentTimeMillis())));
			picture.setDate(df.format(new Date(System.currentTimeMillis())));
			picture.setTittle(file.getOriginalFilename());
			//添加图片
			pictureService.addPic(picture);
			
			return "redirect:/back/picture.html";
		}
		return "redirect:/back/picture.html";
	}
	
	//添加相册
	@RequestMapping("/addAlbum")
	public String addAlbum(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		//获取新建相册的参数
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		if(name!=null && description!=null){
			//建立相册对象
			Album album = new Album();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
			album.setDate(df.format(new Date(System.currentTimeMillis())));
			album.setDescription(description);
			album.setName(name);
			//调用service添加
			albumService.addAlbum(album);
		}
		
		return "redirect:/back/picture.html";
	}
	
	
	//修改首页图片
	@RequestMapping("/updateMainPagePic")
	public String updateMainPagePic(@RequestParam(value="file1",required=false) MultipartFile file1,
									@RequestParam(value="file2",required=false) MultipartFile file2,
									@RequestParam(value="file3",required=false) MultipartFile file3,
									@RequestParam(value="file4",required=false) MultipartFile file4,
									@RequestParam(value="file5",required=false) MultipartFile file5,
									HttpServletRequest request) throws IllegalStateException, IOException{
		request.setCharacterEncoding("utf-8");
		String filePath=request.getSession().getServletContext().getRealPath("/");
		//System.out.println(filePath);
		if(file1!=null && !file1.isEmpty()){
			file1.transferTo(new File(filePath+"images/11.jpg"));
		}
		if(file2!=null && !file2.isEmpty()){
			file2.transferTo(new File(filePath+"images/12.jpg"));
		}
		if(file3!=null && !file3.isEmpty()){
			file3.transferTo(new File(filePath+"images/13.jpg"));
		}
		if(file4!=null && !file4.isEmpty()){
			file4.transferTo(new File(filePath+"images/14.jpg"));
		}
		if(file5!=null && !file5.isEmpty()){
			file5.transferTo(new File(filePath+"images/15.jpg"));
		}
		request.removeAttribute("flush");
		request.setAttribute("flush", true);
		return "redirect:/back/picture.html";
	}
	
	//修改相册名称
	@RequestMapping("/changeAlbumName")
	public String changeAlbumName(HttpServletRequest request){
		//获取修改后的相册名称和id
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		if(name!=null && id!=null){
			//建立album
			Album album = new Album();
			album.setId(Integer.parseInt(id));
			album.setName(name);
			//调用service完成修改名称
			albumService.updateAlbumName(album);
		}else{
			return "redirect:/back/picture.html";
		}
		
		return "redirect:/back/pic-edit.html?albumId="+id;
	}
	
	//修改相册描述
	@RequestMapping("/changeAlbumDesc")
	public String changeAlbumDesc(HttpServletRequest request){
		//获取修改后的相册名称和id
		String desc = request.getParameter("desc");
		String id = request.getParameter("id");
		if(desc!=null && id!=null){
			//建立album
			Album album = new Album();
			album.setId(Integer.parseInt(id));
			album.setDescription(desc);
			//调用service完成修改名称
			albumService.updateAlbumDesc(album);
		}else{
			return "redirect:/back/picture.html";
		}
		
		return "redirect:/back/pic-edit.html?albumId="+id;
	}
	
	//批量删除照片
	@RequestMapping("/deletePics")
	public String deletePics(HttpServletRequest request){
		String id=request.getParameter("id");
		//获取要删除的图片的id集合
		String deletePics = request.getParameter("pics");
		if(deletePics!=null && id!=null){
			//解析
			ArrayList<Integer> pics = new ArrayList<Integer>();
			while(deletePics.length()>0){
				int index = deletePics.indexOf(")(");
				pics.add(Integer.parseInt(deletePics.substring(0,index)));
				deletePics=deletePics.substring(index+2,deletePics.length());
			}
			//删除所有id的图片
			for(int delId:pics){
				pictureService.delete(delId);
			}
		}else{
			return "redirect:/back/picture.html";
		}
		
		return "redirect:/back/pic-edit.html?albumId="+id;
	}
	
	//多图片上传
	@RequestMapping("/multiplePicUpload")
	public String multiplePicUpload(@RequestParam("multipleFile") MultipartFile[] files,
									HttpServletRequest request) throws IOException{
		String id=request.getParameter("id");
		if(id!=null && files.length!=0){
			int id2 = Integer.parseInt(id);
			//获取文件数组并创建图片对象
			Picture[] pics = new Picture[files.length];
			for(int i=0;i<files.length;i++){
				pics[i] = new Picture();
				pics[i].setAlbumId(id2);
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				pics[i].setDate(df.format(new Date(System.currentTimeMillis())));
				pics[i].setPic(files[i].getBytes());
				pics[i].setTittle(files[i].getOriginalFilename());
			}
			//插入
			for(int i=0;i<pics.length;i++){
				pictureService.addPic(pics[i]);
			}
		}else{
			return "redirect:/back/picture.html";
		}
		
		return "redirect:/back/pic-edit.html?albumId="+id;
	}
}
