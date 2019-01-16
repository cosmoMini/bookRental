<%-- 
    Document   : MainPage
    Created on : Nov 12, 2018, 11:50:33 AM
    Author     : Akshita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>ASAP - Main</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
        <style> .myOwn { margin-top: 200px; margin-left: 450px; color: blue; font-size: 50px;} #searchRes {width: 500px;} #sub { margin-left: 190px;} p { color: black; margin-left: 60px;} </style>
	</head>
        <%
             if(null!=request.getAttribute("errorMessage")) {
                out.println(request.getAttribute("errorMessage"));
             }
        
        %>
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
				<div class="logo"><a href="index.html">ASAP Books</a></div>
                                <a title="Welcome user">Hello <%=userName %></a>
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
		<!-- Search -->
	<section class="style2 wrapper" style=" background-color: white; margin-top: 0px;">
            <h3 style=" color: red; margin-left: 30px;"><%= ((request.getAttribute("Message")==null)?"":request.getAttribute("Message")) %></h3>
            <h1 style="color: blue; margin-left:400px; font-size: 30px;">Search books here....</h1><br>
                <form method="post" action="searchBook" style="margin-left: 400px;">
                    <input type="search" placeholder="Enter book or author name" name="searchIt" id="searchRes" style="height: 50px;"><br><br><br>
                    <label style="color: blue; font-size: 15px; ">Select category of the book: </label>
                    <select name="select" style="width: 150px; margin-left: 200px;">
                        <option value="E"> Engineering </option>
                        <option value="M"> Medical </option>
                        <option value="AC"> Arts/Commerce </option>
                        <option value="N"> Novel </option>
                    </select>
                    <br><br><br>
                    <input type="submit" name="Serach" value="Search Book" id="sub" style="margin-left: 205px;">
                </form>
            </section>
		<!-- Two/Mentors -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<header class="align-center">
						<p class="special">Book Renting</p>
						<h2>Select any category to search for books with related category...</h2>
					</header>
					<div class="gallery">
						<div>
							<div class="image fit" style="max-height: 500px; max-width: 250px;">
								<a href="eng.jsp"><img src="images/eng.jpg" height="320px" alt="" /></a>
							</div>
                            <div>
                                <p>Engineering Books</p>
                            </div>
						</div>
						<div>
							<div class="image fit" style="max-height: 500px; max-width: 250px;">
								<a href="med.jsp"><img src="images/med.jpg" alt="" /></a>
							</div>
                            <div>
                                <p>Medical Books</p>
                            </div>
						</div>
						<div>
							<div class="image fit" style="max-height: 500px; max-width: 250px;">
								<a href="ac.jsp"><img src="images/law.jpg" alt="" /></a>
							</div>
                            <div>
                                <p class="ac">Arts/Commerce books</p>
                            </div>
						</div>
						<div>
							<div class="image fit" style="max-height: 500px; max-width: 250px;">
								<a href="novel.jsp"><img src="images/novel.jpg" alt="" /></a>
							</div>
                            <div>
                                <p class="ac">Novels</p>
                            </div>
						</div>
					</div>
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