<%-- 
    Document   : Success
    Created on : Nov 20, 2018, 12:44:30 PM
    Author     : Akshita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/main.css" />
        <title>ASAP - Payment</title>
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
    
    <section id="two" class="wrapper style2">
        <center>
            <h1 style="color: green; font-size: 30px;">Enter details:</h1>
            <br>
            <form method="post" action="check" style="max-width: 500px;">
                <label>Enter Full Name:</label><input type="text" name="fullname" id="name" required>
                <br><label>Enter Mobile Number:</label><input type="number" name="mobile" id="mn" width="900px;" required><br>
            <br><label>Enter Address:</label><textarea rows="4" cols="50" name="address" id="add" required></textarea>
            <input type="hidden" name="getp" value="<%=request.getParameter("price")%>">
            <br><input type="image" src="makepayment.png" style="max-height: 200px; max-width: 200px;" >
            </form>
        </center>
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
