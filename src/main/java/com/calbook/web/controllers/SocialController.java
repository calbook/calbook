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

import com.calbook.web.dao.CommunityDAO;
import com.calbook.web.util.ChangeURL;
import com.calbook.web.vo.Community;
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
		
		model.addAttribute("cEmail", cEmail);
		model.addAttribute("cList", cList);
		model.addAttribute("ipg", ipg);
		model.addAttribute("query", urlquery);
		model.addAttribute("sPage", sPage);
		model.addAttribute("fPage", fPage);
		return "individual_page.jsp";
	}
	
	
	@RequestMapping(value={"diary_detail.do"}, method=RequestMethod.GET)
	public String diary_detil(String seq, Model model) {
		CommunityDAO cdao = ss.getMapper(CommunityDAO.class);
		int iseq = Integer.parseInt(seq);
		
		try {
			int af = cdao.updateHit(iseq);
			Community c = cdao.getCommunity(iseq);
			model.addAttribute("com", c);
		}catch (Exception e) {
			System.out.println("���̾ �󼼳��� �ҷ����� ����");
		}
		return "diary_detail.jsp";
	}
	
	
	@RequestMapping(value={"diary_modi.do"}, method=RequestMethod.GET)
	public String diary_modi() {
		return "diary_modi.jsp";
	}
	
	
	@RequestMapping(value={"diary_add.do"}, method=RequestMethod.GET)
	public String diary_add(String pg, String query, Model model) {
		String urlquery = ChangeURL.getURLFormat(query);
		model.addAttribute("pg", pg);
		model.addAttribute("query", query);
		model.addAttribute("urlquery", urlquery);
		
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
		System.out.println("title: " + title);
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