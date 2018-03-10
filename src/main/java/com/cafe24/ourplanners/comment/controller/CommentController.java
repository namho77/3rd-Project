package com.cafe24.ourplanners.comment.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.ourplanners.comment.service.CommentService;
import com.cafe24.ourplanners.util.CommentCriteria;

@Controller
public class CommentController {
	
	@Inject
	private CommentService service;
	
	@ResponseBody
	@RequestMapping(value = "/board/engineer/comment/json/comment_list.json")
	public HashMap<String, Object> getCommentListJson(HttpServletRequest req, Model model,
			@RequestParam(required = false, defaultValue = "1") Integer nowPage,

			@RequestParam(required = false) Integer parent_board_srl,

			@RequestParam(required = false) Integer pageSize,
			@RequestParam(required = false) Integer blockPage) {

		System.out.println("parent_board_srl :" + parent_board_srl);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (pageSize == null || blockPage == null) {
			ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();

			ConfigurableEnvironment env = ctx.getEnvironment();

			MutablePropertySources propertySources = env.getPropertySources();

			try {
				propertySources.addLast(new ResourcePropertySource("classpath:Environment.properties"));
				if(pageSize == null)
				pageSize = Integer.parseInt(env.getProperty("comment.pageSize"));
				if(blockPage == null)
				blockPage = Integer.parseInt(env.getProperty("comment.blockPage"));
			} catch (Exception e) {
				
				e.printStackTrace();
			}

			ctx.close();
		}

		CommentCriteria scri = new CommentCriteria();

		if (parent_board_srl != null) {
			scri.setParent_board_srl(parent_board_srl);
			System.out.println("parent_board_srl:"+parent_board_srl);
		}
		
		
		scri.setNowPage(nowPage);
		scri.setPageSize(pageSize);
		scri.setBlockPage(blockPage);
		
		System.out.println("nowPage:"+nowPage);
		
			
		
		service.getCommentListJson(scri, map);

		return map;
	}
	
	@RequestMapping(value = "/board/engineer/comment", method = RequestMethod.GET)
	public String listComment(Model model) {
		return "board/engineer/board_engineer_view";
	}
}
