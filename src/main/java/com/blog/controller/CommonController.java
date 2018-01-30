package com.blog.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class CommonController {
	static Logger logger = Logger.getLogger(CommonController.class);
	
}
