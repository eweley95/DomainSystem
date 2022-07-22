<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <title>Welcome to Domain Searching System</title>
        
        <link rel="icon" href="resources/images/favicon-32x32.png" type="image/png"/>
        <link rel="stylesheet" href="resources/plugins/simplebar/css/simplebar.css" type="text/css"/>
        <link rel="stylesheet" href="resources/plugins/datatable/css/dataTables.bootstrap4.min.css" type="text/css"/>
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
                    <div class="sidebar-header" style="border:none;"></div>
                    <div class="flex-grow-1 search-bar">
                        <div class="lang d-flex"><span>Domain Searching System</span></div> 
                    </div>
                    <div class="right-topbar ms-auto" style="border:none;">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown dropdown-lg">
                                <a class="nav-link position-relative" href="${pageContext.servletContext.contextPath}/"><div class="lang d-flex"><span>Search domain</span></div></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            
            <div class="page-wrapper">
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Domain</th>
                                                <th>Domain IP Address</th>
                                                <th>Country</th>
                                                <th>Region</th>
                                                <th>City</th>
                                                <th>Last Searched Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${domainList.size() gt 0}">
                                                <c:forEach var="domain" items="${domainList}">
                                                    <tr>
                                                        <td>${domain.domain}</td>
                                                        <td>${domain.domainIp}</td>
                                                        <td>${domain.countryName} (${domain.countryCode})</td>
                                                        <td>${domain.regionName}</td>
                                                        <td>${domain.cityName}</td>
                                                        <td>${domain.lastSearchedDateStr}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="footer">
                <p class="mb-0">This site or product includes IP2Location LITE data available from <a href="https://lite.ip2location.com">https://lite.ip2location.com</a>.</p>
            </div>
        </div>
        
        <script src="resources/js/bootstrap.bundle.min.js"></script>
        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="resources/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="resources/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="resources/plugins/datatable/js/jquery.dataTables.min.js"></script>
        <script>
            $(function() {
                $('#example').DataTable({
                    lengthChange : false,
                    pageLength : 50,
                    searching : false,
                    ordering : false
                });
            });
        </script>
        <script src="resources/js/app.js"></script>
    </body>
</html>
