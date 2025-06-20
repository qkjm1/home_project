package com.example.demo.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BookmarkService;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class usrBookmarkController {
	@Autowired
	private Rq rq;

	@Autowired
	private BookmarkService bookmarkService;

	@RequestMapping("/usr/bookmark/doLike")
	@ResponseBody
	public ResultData doLike(HttpServletRequest req, int articleId) {
		
		System.err.println("==1==");
		System.err.println("articleId "+articleId);
		
		int likeRow = bookmarkService.likeRow(rq.getIsLoginMemberId(), articleId);

		System.err.println(likeRow);
		if(likeRow==1) {
			bookmarkService.delLike(rq.getIsLoginMemberId(), articleId);
			
			return ResultData.from("FS-1", "즐찾취소");
		} 
		if(likeRow==0) {
			ResultData saveLike  = bookmarkService.saveLike(rq.getIsLoginMemberId(), articleId);
			
			return ResultData.from(saveLike.getResultCode(),saveLike.getMsg(),"saveLike",saveLike);
		}
	
		return null;
	}
	
	@RequestMapping("/usr/bookmark/like")
	public String showLike() {
	
		return "/usr/bookmark/like";
	}
}