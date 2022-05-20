package com.shoppingmall.web.interceptor;
//package com.sock.web.interceptor;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//import org.springframework.web.util.WebUtils;
//
//import com.sock.web.memberDto.MemberDto;
//import com.sock.web.service.SessionService;
//
//public class RememberInterceptor extends HandlerInterceptorAdapter {
//	@Autowired
//	private SessionService sessionService;
//
//	@Override
//	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//
//        HttpSession httpSession = request.getSession();
//        Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//        if (loginCookie != null) {
//            MemberDto memberDto = sessionService.checkSessionKey(loginCookie.getValue());
//            if (memberDto != null)
//                httpSession.setAttribute("login", memberDto);
//        }
//
//        return true;
//    }
//}