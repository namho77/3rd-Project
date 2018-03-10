package com.cafe24.ourplanners.admin.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cafe24.ourplanners.admin.service.AdminService;
import com.cafe24.ourplanners.util.SearchMemberCriteria;

@RestController
public class AdminRestController {
	
	@Inject
	private AdminService adminService;
	
	// 서비스 게시판 내 검색하기 searchType 기능 추가
		@RequestMapping(value = "/admin/json/member_list.json")
		public HashMap<String, Object> getMemberListSearch(HttpServletRequest req, Model model,
				@RequestParam(required = false, defaultValue = "1") Integer nowPage,
				@RequestParam(required = false) Integer pageSize, 
				@RequestParam(required = false) Integer blockPage,
				@RequestParam(required = false) Integer member_srl,
				@RequestParam(required = false, defaultValue = "") String user_id,
				@RequestParam(required = false, defaultValue = "") String user_name,
				@RequestParam(required = false, defaultValue = "") String email_address,
								
				@RequestParam(required = false, defaultValue = "") String searchType,
				@RequestParam(required = false, defaultValue = "") String keyword) {
				
			HashMap<String, Object> map = new HashMap<String, Object>();

			if (pageSize == null || blockPage == null) {
				ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();

				ConfigurableEnvironment env = ctx.getEnvironment();

				MutablePropertySources propertySources = env.getPropertySources();

				try {
					propertySources.addLast(new ResourcePropertySource("classpath:Environment.properties"));
					pageSize = Integer.parseInt(env.getProperty("admin.member.pageSize"));
					blockPage = Integer.parseInt(env.getProperty("admin.member.blockPage"));
				} catch (Exception e) {
					
					e.printStackTrace();
				}

				ctx.close();
			}

			SearchMemberCriteria scri = new SearchMemberCriteria();

			if (member_srl != null && member_srl != 0)
				scri.setMember_srl(member_srl);
			
			scri.setUser_id(user_id);
			scri.setUser_name(user_name);
			scri.setEmail_address(email_address);
			
			scri.setNowPage(nowPage);
			scri.setPageSize(pageSize);
			scri.setBlockPage(blockPage);
			
			if(searchType != null && searchType.length() != 0)
			scri.setSearchType(searchType);
			if(keyword != null && keyword.length() != 0)
			scri.setKeyword(keyword);
			
			adminService.getSearchMemberList(scri, map);

			return map;
		}
		
}
