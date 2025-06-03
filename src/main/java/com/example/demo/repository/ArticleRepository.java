package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Article;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Mapper
public interface ArticleRepository {

	public int writeArticle(int memberId, String title, String body, int boardId);

	public int lastInsertId();

	public void delArticle(int articleId);

	public Article articleRow(int articleId);

	public void modifyArticle(int articleId, String title, String body);

	public int getArticleCountByBoard(int boardId, String searchKeywordTypeCode, String searchKeyword);

	public List<Article> getForPrintArticles(int boardId, int limitTake, int limitForm, String searchKeywordTypeCode,
			String searchKeyword);

	public Article getForPrintArticle(int articleId);
}
