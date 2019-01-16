<%-- 
    Document   : MainPage
    Created on : Nov 12, 2018, 11:50:33 AM
    Author     : Akshita
--%>

<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Book Renting - Home</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
        <style> .myOwn { margin-top: 200px; margin-left: 450px; color: blue; font-size: 50px;} #searchRes {width: 500px;} #sub { margin-left: 190px;} p { color: black; margin-left: 60px;} </style>
	</head>
	<body>
            <%
                    String userName = null;
                    Cookie[] cookies = request.getCookies();
                    if(cookies !=null){
                        for(Cookie cookie : cookies){
                                if(cookie.getName().equals("user"))
                                    userName = cookie.getValue();
                        }
                    }
                    if(userName == null)
                        response.sendRedirect("login.html");
            %>
		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="index.html">Second Hand Book Renting</a></div>
                                <a href="profile.html">Hello <%=userName %></a>
				<a href="#menu">Menu</a>
			</header>
		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
                                        <li><a href="UploadBooks.jsp">Upload Books</a></li>
                                        <li><a href="logoutservlet">Logout</a></li>
                                        <li><a href="#contactus">Contact us</a></li>
				</ul>
			</nav>
		<!-- Display -->
			<section id="two" class="wrapper style2">
				<div class="inner">
                                    <% 
                                        
                                        Connection connection = DriverManager.getConnection(
                                            "jdbc:mysql://localhost:3306/ldata", "root", "root");
                                        Statement statement = connection.createStatement() ;
                                        String quer = "select * from logindata where uname = '?'";
                                        PreparedStatement stmt;
                                        stmt = connection.prepareStatement(quer);
                                        %>
                                        <% stmt.setString(1, %> <%= userName %>);
                                        <%ResultSet resultset = statement.executeQuery(quer) ; 
                                    %>
                                    
                                     <TABLE BORDER="1">
                                        <TR>
                                            <TH>Phone Number</TH>
                                            <TH>Address</TH>
                                        </TR>
                                        <% while(resultset.next()){ %>
                                        <TR>
                                            <TD> <%= resultset.getString(4) %></td>
                                            <TD> <%= resultset.getString(3) %></TD>
                                        </TR>
                                        <% } %>
                                    </TABLE>
                                    
				</div>
			</section>

		
        <!-- Four -->
        <section id="contactus" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p class="special">Book Renting</p>
                        <h2>Contact Us</h2>
					</header>
                    <div class="grid-style align-center">
                        <div>
                            <i class="fa fa-phone-square fa-3x mb-3 sr-contact"></i>
                            <p style="color: white;">+91 87642 80822</p>
                        </div>
                        <div>
                            <i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i><br>
                            <a href="mailto:bookrenting@gmail.com?Subject=Hello%20again" target="_top">bookrenting@gmail.com</a>
                        </div>
                    </div>
                </div>
			</section>


		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="https://twitter.com/Jaipur_Manipal" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="https://www.facebook.com/jaipur.manipal.edu/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="https://twitter.com/Jaipur_Manipal" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
					</ul>
				</div>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>