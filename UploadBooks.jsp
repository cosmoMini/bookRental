                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <%-- 
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
		<title>ASAP - Upload</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
        <style> .myOwn { margin-top: 200px; margin-left: 450px; color: blue; font-size: 50px;} #searchRes {width: 500px;} #sub { margin-left: 190px;} p { color: black; margin-left: 60px;} </style>
        <script>
            function checkData() {
                var file = document.getElementById("fileupload").value;
                var nameB = document.getElementById("bookname").value;
                var nameA = document.getElementById("authorname").value;
                var price = document.getElementById("bookprice").value;
                var tag = document.getElementById("booktag").value;
                var desc = document.getElementById("description").value;
                var edition = document.getElementById("ed").value;
                var date = new Date();
                var year = date.getFullYear();
                if(!file) { alert("First upload book!"); return false;}
                if(!nameB) { alert("Enter Book name!"); return false;}
                if(!nameA) { alert("Enter Author name!"); return false;}
                if(!price) { alert("Enter Book price!"); return false;}
                if(!tag) { alert("Enter Book tag!"); return false;}
                if(tag === "E" || tag === "M") {
                    if(year-edition > 6 || year-edition < 0) {
                        document.getElementById("error").innerHTML = "* Editon not supported. You can sell books only if edition differnec is below 6 years.";
                        return false;
                    }
                }
                if(!desc) { alert("Enter Book description!"); return false;}
                else {return true;}
            }
        </script>
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
					<li><a href="MainPage.jsp">Home</a></li>
                    <li><a href="logoutservlet">Logout</a></li>
                    <li><a href="#contactus">Contact us</a></li>
				</ul>
			</nav>
                
                <section id="two" class="wrapper style3">
                    <div class="inner">
                        <form method="post" action="imageUpload" enctype="multipart/form-data" onsubmit="return checkData()">
                            <label>Upload cover photo:</label><input type="file" name="bookAdd" id="fileupload">
                            <label>Enter book name:</label><input type="text" name="title" id="bookname" >
                            <label>Enter author name:</label><input type="text" name="author" id="authorname" >
                            <label>Enter book price:</label><input type="text" name="price" id="bookprice">
                            <label>Enter edition of book:</label><input type="text" name="edition" id="ed">
                            <label>Enter book tag:</label><input type="text" name="tag" id="booktag">
                            <label>Enter book description:</label><textarea rows="4" cols="50" id="description" name="desc"></textarea>
                            <br><br><input type="submit" style="margin-left: 550px;">
                        </form>
                    </div>
                    <div id="error" style="color: white; margin-left: 40px;"></div>
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
                    