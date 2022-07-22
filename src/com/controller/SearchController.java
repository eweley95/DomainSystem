package com.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DomainHistoryDAO;
import com.model.DomainHistory;
import com.mysql.jdbc.StringUtils;

@WebServlet("/search")
public class SearchController extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	private static Logger log = Logger.getLogger("SearchController");
	
	private DomainHistoryDAO ddao;
	
    public SearchController() throws ClassNotFoundException {
        super();
        ddao = new DomainHistoryDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String searchDomain = request.getParameter("searchDomain");
			if (!StringUtils.isNullOrEmpty(searchDomain)) {
				if (!searchDomain.startsWith("http")) {
					searchDomain = "https://" + searchDomain;
				}
				
				InetAddress inetAddress = InetAddress.getByName(new URL(searchDomain).getHost());
				String domainIp = inetAddress.getHostAddress();
				
				DomainHistory domainHistory = ddao.add(request.getSession(), domainIp, searchDomain);
				request.setAttribute("searchDomain", searchDomain);
				request.setAttribute("domainHistory", domainHistory);
			}
		} catch (Exception e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
