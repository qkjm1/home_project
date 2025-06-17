package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.repository.MemberRepository;
import com.example.demo.service.MemberService;
import com.example.demo.vo.Member;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.ui.Model;

@Controller
public class ImgProfileController {
	@Autowired
	private Rq rq;

	@Autowired
	private MemberRepository memberRepository;

	@PostMapping("/member/uploadProfile")
	public String uploadProfileImage(@RequestParam("profileImage") MultipartFile image, HttpServletRequest req,
			Model model) throws IOException {
		if (!image.isEmpty()) {
			String uploadDir = "C:/upload/profile/";
			File dir = new File(uploadDir);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			// 파일명 중복 방지
			String filename = UUID.randomUUID() + "_" + image.getOriginalFilename();
			Path path = Paths.get(uploadDir + filename);
			Files.copy(image.getInputStream(), path);

			// DB에 프로필 이미지 경로 저장 (예: /profile/uuid_img.jpg)
			memberRepository.updateProfileImage(rq.getIsLoginMemberId(),"/profile/" + filename);

			model.addAttribute("msg", "업로드 성공!");
		}

		return "/usr/demo";
	}

	@GetMapping("/member/showMyPage")
	public String showMyPage(HttpServletRequest req, Model model) {
		

		Member member = memberRepository.findById(rq.getIsLoginMemberId());
		String profileImage = member.getProfileImage();
		System.err.println(profileImage);

		if (profileImage == null || profileImage.isEmpty()) {
			profileImage = "/profile/default.png";
		}

		model.addAttribute("profileImage", profileImage);

		return "/usr/demo3"; // JSP 경로
	}

}