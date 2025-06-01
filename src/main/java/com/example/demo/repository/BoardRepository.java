package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.Board;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Mapper
public interface BoardRepository {

	// 보드아이디로 있는지 확인
	public Board getBoardById(int id);

	public Board getBoardByName(String boardName);
}
