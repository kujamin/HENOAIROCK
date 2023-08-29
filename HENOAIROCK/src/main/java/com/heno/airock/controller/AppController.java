package com.heno.airock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AppController {
    @GetMapping("/")
    public String intro() {
    	return "/common/intro";
    	
    }

}	