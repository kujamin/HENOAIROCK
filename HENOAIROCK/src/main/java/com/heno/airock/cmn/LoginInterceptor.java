package com.heno.airock.cmn;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
    final Logger  LOG = LogManager.getLogger(getClass());
	
	/**
	 * Controller로 보내기 전에 호출
	 * false 발생하면  controller를 호출 하지 않음
	 * Object는 핸들러 정보를 의미(RequestMapping, DefaultServletHandler)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		LOG.debug("LoginInterceptor preHandle()");
		
		//session객체 생성
		HttpSession  session = request.getSession();
		
		if(null == session.getAttribute("user")) {
			
			//login 페이지로 이동
			LOG.debug("┌──────────────────────────────┐");
			LOG.debug("│preHandle                     │");
			LOG.debug("└──────────────────────────────┘");	
			// /ehr/login/loginView.do
			response.sendRedirect(request.getContextPath()+"/login/loginView.do");
			return false;//controller호출 않됨
		}
		
		
		return true;
	}

	
	/**
	 * postHandle() 메서드는 컨트롤러가 실행된 후에 호출됩니다.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		LOG.debug("LoginInterceptor postHandle()");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * view까지 처리가 끝나면 호출 
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		LOG.debug("LoginInterceptor afterCompletion()");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
}
