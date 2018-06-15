package com.calbook.web.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.calbook.web.dao.CommunityDAO;
import com.calbook.web.dao.MembersDAO;
import com.calbook.web.util.ChangeURL;
import com.calbook.web.vo.Community;
import com.calbook.web.vo.Members;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	
	@Autowired
	private SqlSession ss;
	
	
	@RequestMapping(value={"social.do"}, method=RequestMethod.GET)
	public String social() {
		return "social.jsp";
	}
	
	
	@RequestMapping(value={"individual_page.do"}, method=RequestMethod.GET)
	public String individual_page(String cEmail, String query, String pg, HttpServletRequest request, Model model) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		Members m = mdao.getMembersEmail(cEmail);
		int count = 0;
		int sPage;
		int fPage;
		int ipg;
		String urlquery;
		
		if(pg == null || pg.equals("null") || pg.equals("")) {
			ipg = 1;
		}else {
			ipg = Integer.parseInt(pg);
		}
		
		if(query == null) {
			query = "";
		}
		urlquery = ChangeURL.getURLFormat(query);
		
		List<Community> cList = cdao.getCommunityList(cEmail, query, ipg);
		count = cdao.getCommunityCount(cEmail, query);
		sPage = ipg - (ipg-1)%5;
		fPage = count/10 + (count%10 == 0? 0:1);
		
		model.addAttribute("member", m);
		model.addAttribute("cEmail", cEmail);
		model.addAttribute("cList", cList);
		model.addAttribute("pg", ipg);
		model.addAttribute("query", query);
		model.addAttribute("urlquery", urlquery);
		model.addAttribute("sPage", sPage);
		model.addAttribute("fPage", fPage);
		return "individual_page.jsp";
	}
	
	
	@RequestMapping(value={"updateMembers.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String updateMembers(HttpServletRequest request) {
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String path = "/social/upload";
		String realPath = request.getServletContext().getRealPath(path);
		System.out.println("path: " + path);
		System.out.println("realPath: " + realPath);
		
		MultipartRequest mulReq = null;
		try {
			mulReq = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String nick = mulReq.getParameter("nick");
		String phone = mulReq.getParameter("phone");
		String pwd = mulReq.getParameter("pwd");
		String open = mulReq.getParameter("open");
		int i_open = 0;
		if(open != null) {
			i_open = 1;
		}
		String fileName = mulReq.getFilesystemName("file");
		System.out.println("nick: " + nick);
		System.out.println("open: " + open);
		System.out.println("fileName: " + fileName);
		
		Members m = new Members();
		m.setEmail(email);
		m.setNick(nick);
		m.setPhone(phone);
		m.setPwd(pwd);
		m.setOpen(i_open);
		m.setProfile(fileName);
		
		int af = mdao.updateMembers(m);
		if(af == 1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value={"diary_detail.do"}, method=RequestMethod.GET)
	public String diary_detil(String pg, String query, String seq, Model model) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		String urlquery = ChangeURL.getURLFormat(query);
		String cEmail = null;
		int iseq = Integer.parseInt(seq);
		
		try {
			cdao.updateHit(iseq);
			Community c = cdao.getCommunity(iseq);
			cEmail = c.getWriter();
			model.addAttribute("com", c);
		}catch (Exception e) {
			System.out.println("다이어리 상세내용 불러오기 실패");
		}
		
		Members m = mdao.getMembersEmail(cEmail);
		model.addAttribute("member", m);
		model.addAttribute("pg", pg);
		model.addAttribute("urlquery", urlquery);
		model.addAttribute("cEmail", cEmail);
		
		return "diary_detail.jsp";
	}
	
	
	@RequestMapping(value={"diary_modi.do"}, method=RequestMethod.GET)
	public String diary_modi(String pg, String query, String seq, Model model) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		String urlquery = ChangeURL.getURLFormat(query);
		Community c = cdao.getCommunity(Integer.parseInt(seq));
		Members m = mdao.getMembersEmail(c.getWriter());
		
		model.addAttribute("pg", pg);
		model.addAttribute("query", query);
		model.addAttribute("urlquery", urlquery);
		model.addAttribute("com", c);
		model.addAttribute("member", m);
		
		return "diary_modi.jsp";
	}
	
	
	@RequestMapping(value={"diary_modi.do"}, method=RequestMethod.POST)
	public String diary_modi(HttpServletRequest request) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		String path = "/social/upload";
		String realPath = request.getServletContext().getRealPath(path);
		System.out.println("path: " + path);
		System.out.println("realPath: " + realPath);
		MultipartRequest mulReq = null;
		
		try {
			mulReq = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String pg = mulReq.getParameter("pg");
		String query = mulReq.getParameter("query");
		String urlquery = ChangeURL.getURLFormat(query);
		String seq = mulReq.getParameter("seq");
		String title = mulReq.getParameter("title");
		String content = mulReq.getParameter("content");
		String fileName = mulReq.getFilesystemName("file");
		System.out.println("fileName: " + fileName);
		if(fileName == null) {
			fileName = mulReq.getParameter("url");
		}
		
		Community c = new Community();
		c.setSeq(Integer.parseInt(seq));
		c.setTitle(title);
		c.setContent(content);
		c.setUrl(fileName);
		
		int af = cdao.updateCommunity(c);
		if(af == 1) {
			return "redirect:diary_detail.do?pg="+pg+"&query="+urlquery+"&seq="+seq;
		}else {
			return "redirect:diary_modi.do?pg="+pg+"&query="+urlquery+"&seq="+seq;
		}
	}
	
	
	@RequestMapping(value={"diary_add.do"}, method=RequestMethod.GET)
	public String diary_add(String pg, String query, HttpServletRequest request, Model model) {
		MembersDAO mdao = ss.getMapper(MembersDAO.class);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		Members m = mdao.getMembersEmail(email);
		String urlquery = ChangeURL.getURLFormat(query);
		
		model.addAttribute("pg", pg);
		model.addAttribute("query", query);
		model.addAttribute("urlquery", urlquery);
		model.addAttribute("member", m);
		
		return "diary_add.jsp";
	}
	
	                        
	@RequestMapping(value={"diary_add.do"}, method=RequestMethod.POST)
	public String diary_add(HttpServletRequest request) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("email");
		String path = "/social/upload";
		String realPath = request.getServletContext().getRealPath(path);
		System.out.println("path: " + path);
		System.out.println("realPath: " + realPath);
		
		MultipartRequest mulReq = null;
		
		try {
			mulReq = new MultipartRequest(request, realPath, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String title = mulReq.getParameter("title");
		String content = mulReq.getParameter("content");
		String pg = mulReq.getParameter("pg");
		String query = mulReq.getParameter("query");
		String urlquery = ChangeURL.getURLFormat(query);
		String oriFileName = mulReq.getOriginalFileName("file");
		String fileName = mulReq.getFilesystemName("file");
		System.out.println("oriFileName: " + oriFileName);
		System.out.println("fileName: " + fileName);
		
		Community c = new Community();
		c.setTitle(title);
		c.setContent(content);
		c.setUrl(fileName);
		c.setWriter(writer);
		
		int af = cdao.addCommunity(c);
		
		if(af == 1) {
			return "redirect:individual_page.do?cEmail="+writer+"&pg="+pg+"&query="+urlquery;
		}else {			
			return "redirect:diary_add.do?pg="+pg+"&query="+urlquery;
		}
	}
	
	@RequestMapping(value={"diary_del.do"}, method=RequestMethod.GET)
	public String diary_del(String pg, String query, String seq, HttpServletRequest request) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String urlquery = ChangeURL.getURLFormat(query);
		int af = cdao.delCommunity(Integer.parseInt(seq));
		
		if(af == 1) {
			return "redirect:individual_page.do?cEmail="+email+"&pg="+pg+"&query="+urlquery;
		}else {
			return "redirect:diary_detail.do?pg="+pg+"&query="+urlquery+"&seq="+seq;
		}
	}
}
