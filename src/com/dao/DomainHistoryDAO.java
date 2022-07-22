package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import com.common.DateUtil;
import com.common.DbConn;
import com.ip2location.IP2Location;
import com.ip2location.IPResult;
import com.model.DomainHistory;

public class DomainHistoryDAO {
	
	private static final Logger log = Logger.getLogger("DomainHistoryDAO");
	
	private Connection conn;
	
	public DomainHistoryDAO() throws ClassNotFoundException {
		conn = DbConn.getConn();
	}

	public DomainHistory add(HttpSession session, String domainIp, String searchDomain) {
		DomainHistory domainHistory = new DomainHistory();
		IPResult ipResult = getIp2Location(session, domainIp);
		if (ipResult != null) {
			domainHistory.setDomain(searchDomain);
			domainHistory.setDomainIp(domainIp);
			domainHistory.setCountryCode(ipResult.getCountryShort());
			domainHistory.setCountryName(ipResult.getCountryLong());
			domainHistory.setRegionName(ipResult.getRegion());
			domainHistory.setCityName(ipResult.getCity());
			domainHistory.setLastSearchedDate(new Date());
		} else {
			domainHistory.setDomain(searchDomain);
			domainHistory.setDomainIp(domainIp);
			domainHistory.setCountryCode("-");
			domainHistory.setCountryName("-");
			domainHistory.setRegionName("-");
			domainHistory.setCityName("-");
			domainHistory.setLastSearchedDate(new Date());
		}
			
		try {
			PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO domain_history (domain, domain_ip, country_code, country_name, region_name, city_name, last_searched_date) VALUES (?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, domainHistory.getDomain());
			preparedStatement.setString(2, domainHistory.getDomainIp());
			preparedStatement.setString(3, domainHistory.getCountryCode());
			preparedStatement.setString(4, domainHistory.getCountryName());
			preparedStatement.setString(5, domainHistory.getRegionName());
			preparedStatement.setString(6, domainHistory.getCityName());
			preparedStatement.setString(7, DateUtil.parseDateToString(domainHistory.getLastSearchedDate(), DateUtil.DATE_TIME_FORMAT));
			preparedStatement.executeUpdate();
			return domainHistory;
		} catch (Exception e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return null;
	}
	
	private IPResult getIp2Location(HttpSession session, String ipAddress) {
		IP2Location loc = new IP2Location();
		try {
			String binFile = session.getServletContext().getRealPath("/") + "resources/IP2LOCATION-LITE-DB3.BIN";
			
			loc.Open(binFile, true);
			
			IPResult ipResult = loc.IPQuery(ipAddress);
			if (ipResult.getStatus().equals("OK")) {
				return ipResult;
			}
		} catch (Exception e) {
			log.log(Level.SEVERE, e.getMessage());
		} finally {
			loc.Close();
		}
		return null;
	}

	public List<DomainHistory> listAll() {
		List<DomainHistory> list = new ArrayList<DomainHistory>();
		try {
			PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM domain_history ORDER BY last_searched_date DESC");
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				DomainHistory domainHistory = new DomainHistory();
				domainHistory.setId(rs.getLong("id"));
				domainHistory.setDomain(rs.getString("domain"));
				domainHistory.setDomainIp(rs.getString("domain_ip"));
				domainHistory.setCountryCode(rs.getString("country_code"));
				domainHistory.setCountryName(rs.getString("country_name"));
				domainHistory.setRegionName(rs.getString("region_name"));
				domainHistory.setCityName(rs.getString("city_name"));
				domainHistory.setLastSearchedDateStr(rs.getString("last_searched_date"));
				list.add(domainHistory);
			}
			return list;
		} catch (Exception e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return null;
	}
	
}
