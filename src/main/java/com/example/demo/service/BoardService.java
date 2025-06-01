package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.MemberRepository;
import com.example.demo.vo.Board;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

import utill.Ut;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;

	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	
// 보드아이디로 있는 보드인지 확인
	public Board getBoardById(int boardId) {
		return boardRepository.getBoardById(boardId);
	}
	
	public Board getBoardByName(String boardName) {
		return boardRepository.getBoardByName(boardName);
	}

}
