package com.calbook.web.controllers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.calbook.web.dao.MembersDAO;
import com.calbook.web.util.CookieManager;
import com.calbook.web.vo.Members;

@Controller
//@RequestMapping("/*")
public class IndexController {

	@Autowired
	private SqlSession ss;
	
	
	/* 메인화면 */
	@RequestMapping(value={"index.do"}, method=RequestMethod.GET)
	public String login(String error, Model model, HttpServletRequest request) {
		// 쿠키정보 불러오기
		Cookie[] coos = request.getCookies();
		String ckEmail = CookieManager.getCookie(coos, "email");
		String ckPwd = CookieManager.getCookie(coos, "pwd");
		System.out.println("쿠키 email: " + ckEmail);
		System.out.println("쿠키 pwd: " + ckPwd);

		System.out.println("session: " + request.getSession().getAttribute("email"));
		// 로그인 실패 여부 확인
		if(error != null && !error.equals("")) {
			model.addAttribute("errorMsg", "이메일 혹은 비밀번호가 틀렸습니다.");
		}

		model.addAttribute("ckEmail", ckEmail);
		model.addAttribute("ckPwd", ckPwd);

		return "index.jsp";
	}


	/* 이메일 중복 체크 */
	@RequestMapping(value = {"idCheck.do"}, method = RequestMethod.GET)
	@ResponseBody
	public String idcheck(String email, HttpServletRequest request, HttpServletResponse response) {
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		Members m =mdao.getMembersEmail(email);

		if(m == null) {
			return "ok";
		}else {
			return "not ok";
		}
	}
	
	/* 닉네임 중복 체크 */
	@RequestMapping(value = {"nickCheck.do"}, method = RequestMethod.GET)
	@ResponseBody
	public String nickcheck(String nick, HttpServletRequest request, HttpServletResponse response) {
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		Members m =mdao.getMembersNick(nick);
		if(m == null) {
			return "ok";
		}else {
			return "not ok";
		}
	}
	
	
	
	/* 회원가입 proc (개인정보 저장) */
	@RequestMapping(value= {"join.do"}, method=RequestMethod.POST)
	public String join(Members m) {
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		int af = mdao.addMembers(m);
		if(af==1) {
			System.out.println("회원가입성공");
			return "redirect:index.do";
		}else {
			System.out.println("회원가입실패");
			return "index.jsp";
		}
	}


	/* 로그인 Proc */
	@RequestMapping(value={"login.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String login(String email, String pwd, String checkLogin, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("email1: " + email);
		System.out.println("pwd1: " + pwd);
		System.out.println("checkLogin: " + checkLogin);

		HttpSession session = request.getSession();
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		Members m = mdao.getMembersEmail(email);
		//String json = "{\"mid\":\"SEA\",\"pwd\":\"123\"}";
		//System.out.println(json);

		if(m == null) {
			System.out.println("이메일이 틀렸습니다.");
			return "no";
		}else if(!m.getPwd().equals(pwd)) {
			System.out.println("비밀번호가 틀렸습니다.");
			return "no";
		}else {
			System.out.println(m.getEmail() + "님 로그인 성공");
			session.setAttribute("email", email);
			session.setAttribute("nick", m.getNick());
			// 로그인 정보 쿠키 저장&삭제(email, pwd)
			if(checkLogin.equals("true")) {
				Cookie ckEmail = new Cookie("email", email);
				Cookie ckPwd = new Cookie("pwd", pwd);
				ckEmail.setMaxAge(60*60*24*30);
				ckPwd.setMaxAge(60*60*24*30);
				response.addCookie(ckEmail);
				response.addCookie(ckPwd);
				System.out.println("로그인 정보 쿠키(ckEmail) 저장: " + email + ", " + pwd);
			}else if(checkLogin.equals("false")) {
				Cookie ckEmail = new Cookie("email", null);
				Cookie ckPwd = new Cookie("pwd", null);
				ckEmail.setMaxAge(0);
				ckPwd.setMaxAge(0);
				response.addCookie(ckEmail);
				response.addCookie(ckPwd);
				System.out.println("로그인 정보 쿠키(ckEmail) 삭제");
			}		

			//response.getWriter().write("ok");
			return "ok";
		}
	}
	
	
	/* 로그아웃 */
	@RequestMapping(value= {"logout.do"}, method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("email", null);
		session.setAttribute("nick", null);
		return "redirect:index.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
