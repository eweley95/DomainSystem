# IP2Location Programming Contest
Get domain IP, country, region and city of the server located at by searching the domain

# Demo
<a href="https://ds.asiabet.asia/" target="_blank">IP2Location Programming Contest - Domain Searching System (Demo)</a>

# Introduction
<ul>
<li>A website system to get the domain IP address, country, region and city of the server located at.</li>
<li>Java, JSP, CSS, Javascript are used in this system.</li>
<li>All return datas such as country code, country name, region name, city name rerieved by using <a href="https://github.com/ip2location/ip2location-java" target="_blank">IP2Location™ IP Geolocation Java Component</a>.</li>
<li>On the database `ip2location`, table `domain_history` used to record the searched history.</li>
<li>IP2LOCATION-LITE-DB3.BIN can be found at <a href="https://github.com/eweley95/DomainSystem/blob/main/WebContent/resources/IP2LOCATION-LITE-DB3.BIN">/WebContent/resources/IP2LOCATION-LITE-DB3.BIN</a></li>
</ul>

# Database
Below are the columns for table `domain_history`.
<table>
<thead>
<tr>
<th>Column</th>
</tr>
<thead>
<tbody>
<tr><td>id</td></tr>
<tr><td>domain</td></tr>
<tr><td>domain_ip</td></tr>
<tr><td>country_code</td></tr>
<tr><td>country_name</td></tr>
<tr><td>region_name</td></tr>
<tr><td>city_name</td></tr>
<tr><td>last_searched_date</td></tr>
<tbody>
</table>
