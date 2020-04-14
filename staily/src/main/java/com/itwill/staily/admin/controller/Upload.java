package com.itwill.staily.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class Upload{
	
	@RequestMapping(value = "/upload")
	public void upload(HttpServletResponse response, HttpServletRequest request, @RequestParam("Filedata") MultipartFile Filedata) {
	   	SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	   	String newfilename = df.format(new Date()) + Integer.toString((int) (Math.random()*10));
	   	
		File f = new File("C:\\Users\\stu\\git\\Final-Project\\staily\\src\\main\\webapp\\images\\product\\image\\" + newfilename +".jpg");
		try { 
			Filedata.transferTo(f);
		   	response.getWriter().write(newfilename);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}	
}
