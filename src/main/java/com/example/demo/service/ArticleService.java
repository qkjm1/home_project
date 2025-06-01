package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.repository.BookmarkRepository;
import com.example.demo.repository.MemberRepository;
import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

import utill.Ut;

@Service
public class ArticleService {

	@Autowired
	private ArticleRepository articleRepository;

	public ResultData printArticles() {
		return null;
	}

	public ResultData writeArticle(int memberId, String title, String body, int boardId) {
		articleRepository.writeArticle(memberId, title, body, boardId);

		int id = articleRepository.lastInsertId();

		return ResultData.from("S-1", Ut.f("%s번 글이 등록되었습니다", id));
	}

	public void delArticle(int articleId) {
		articleRepository.delArticle(articleId);
	}

	public Article articleRowById(int articleId) {
		return articleRepository.articleRow(articleId);
	}

	// 삭제수정권한
	public ResultData usrAuthor(int loginedMemberId, Article article) {

		if (article.getUsrId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 게시글에 대한 수정/삭제 권한 없음", article.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시글 수정/삭제 가능", article.getId()));
	}
 
	public void modifyArticle(int articleId, String title, String body) {
		articleRepository.modifyArticle(articleId, title, body);
	}

	public int getArticleCountByBoard(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return articleRepository.getArticleCountByBoard(boardId, searchKeywordTypeCode, searchKeyword);
	}

	public List<Article> getForPrintArticles(int boardId, int listInApage, int page, String searchKeywordTypeCode, String searchKeyword) {
		int limitTake = listInApage;
		int limitForm = (page-1)*listInApage;
			
		return articleRepository.getForPrintArticles(boardId, limitTake, limitForm, searchKeywordTypeCode, searchKeyword);
	}
}
