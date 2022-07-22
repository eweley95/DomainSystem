<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <title>Domain Searching System</title>
        
        <link rel="icon" href="resources/images/favicon-32x32.png" type="image/png"/>
        <link rel="stylesheet" href="resources/plugins/simplebar/css/simplebar.css" type="text/css"/>
        <link rel="stylesheet" href="resources/plugins/perfect-scrollbar/css/perfect-scrollbar.css" type="text/css"/>
        <link rel="stylesheet" href="resources/plugins/metismenu/css/metisMenu.min.css" type="text/css"/>
        
        <link rel="stylesheet" href="resources/css/pace.min.css" type="text/css"/>
        <script src="resources/js/pace.min.js"></script>
        
        <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&family=Roboto&display=swap" type="text/css"/>
        <link rel="stylesheet" href="resources/css/icons.css" type="text/css"/>
        <link rel="stylesheet" href="resources/css/app.css" type="text/css"/>
        <link rel="stylesheet" href="resources/css/dark-sidebar.css" type="text/css"/>
        <link rel="stylesheet" href="resources/css/dark-theme.css" type="text/css"/>
    </head>
    <body>
        <div class="wrapper">
            <header class="top-header">
                <nav class="navbar navbar-expand">
                    <div class="sidebar-header" style="border:none;">
                    	<div>
                    		<h4 class="d-none d-lg-flex logo-text">Domain Searching</h4>
                    	</div>
                    </div>
                    <div class="flex-grow-1 search-bar">
                        <form id="searchForm" method="POST" action="${pageContext.servletContext.contextPath}/search">
                        	<div class="input-group">
                        		<button class="btn btn-search-back search-arrow-back" type="submit"><i class="bx bx-arrow-back"></i></button>
                        		<input type="text" id="searchDomain" name="searchDomain" class="form-control" placeholder="search" value="${searchDomain}" required>
                        		<button class="btn btn-search" type="submit"><i class="lni lni-search-alt" style="margin:auto;"></i></button>
                        	</div>
                        </form>
                    </div>
                    <div class="right-topbar ms-auto" style="border:none;">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown dropdown-lg">
                                <a class="nav-link positive-relative" href="${pageContext.servletContext.contextPath}/history"><div class="lang d-flex"><span>History</span></div></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            
            <c:if test="${not empty domainHistory}">
            	<div class="page-wrapper">
            		<div class="page-content-wrapper">
            			<div class="page-content">
            				<div class="row">
            					<div class="col-xl-12 mx-auto">
            						<h6 class="mb-0 text-uppercase">Domain Info</h6>
            						<hr>
            						<div class="card">
            							<div class="card-body">
            								<div class="mb-3">
            									<label>Domain: <a href="${domainHistory.domain}" target="_blank">${domainHistory.domain}</a></label>
            								</div>
            								<div class="mb-3">
            									<label>Domain IP Address: ${domainHistory.domainIp}</label>
            								</div>
            								<div class="mb-3">
            									<label>Country: ${domainHistory.countryName} (${domainHistory.countryCode})</label>
            								</div>
            								<div class="mb-3">
            									<label>Region: ${domainHistory.regionName}</label>
            								</div>
            								<div class="mb-3">
            									<label>City: ${domainHistory.cityName}</label>
            								</div>
            							</div>
            						</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            </c:if>
            <c:if test="${empty domainHistory}">
            	<div class="page-wrapper">
            		<div class="page-content-wrapper">
            			<div class="page-content">
            				<div class="row">
            					<div class="col-xl-12 mx-auto text-center">
            						<h6 class="mb-0">Welcome to Domain Searching System. This system will help to identify out domain's infomations</h6>
            						<h6 class="mb-0">Click <a href="${pageContext.servletContext.contextPath}/history">here</a> to display previous searched history</h6>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            </c:if>
            
            <div class="footer">
                <p class="mb-0">This site or product includes IP2Location LITE data available from <a href="https://lite.ip2location.com">https://lite.ip2location.com</a>.</p>
            </div>
        </div>
        
        <script src="resources/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="resources/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="resources/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="resources/js/app.js"></script>
    </body>
</html>
