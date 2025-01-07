//package com.filter;
//
//import java.io.IOException;
//
//import org.springframework.stereotype.Component;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpSession;
//
//@Component
//public class AuthenticateFilter implements Filter{
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		HttpServletRequest req = (HttpServletRequest) request;
//		
//		String url = req.getRequestURL().toString();
//		String uri = req.getRequestURI().toString();
//		
//		HttpSession session = req.getSession();
//		
//		System.out.println(url);
//		System.out.println(uri);
//		
//		if (uri.contains("login")||uri.contains("authenticate")||uri.contains("signup")||uri.contains("favicon")) {
//			System.out.println("Public url");
//			chain.doFilter(request, response);
//		} else {
//			if (session.getAttribute("isLogin")==null) {
//				System.out.println("AuthenticateFilter==>Not to login");
//				RequestDispatcher rd = request.getRequestDispatcher("login");
//				rd.forward(request, response);
//			} else {
//				
//				if (session.getAttribute("user").equals("user")) {
//					// login is user
//					if (url.contains("search") || url.contains("rating") ) {
//						chain.doFilter(request, response);
//					} else {
//						RequestDispatcher rd = request.getRequestDispatcher("login");
//						rd.forward(request, response);
//					}
//
//				}
//
//				if (session.getAttribute("user").equals("admin")) {
//					chain.doFilter(request, response);
//				}
//
//			}
//
//		}
//	}
//}
