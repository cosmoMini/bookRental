<%-- 
    Document   : ShowBook
    Created on : Nov 19, 2018, 7:51:23 PM
    Author     : Akshita
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ASAP - Engineering</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
                <style></style>
        <title>JSP Page</title>
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
                
                
                     <%
                    Connection connection = null;
                    //login is the name of the database
                    String connectionURL = "jdbc:mysql://localhost:3309/ldata";

                    ResultSet rs = null;

                    PreparedStatement psmnt = null;

                    InputStream sImage;
                    try
                    {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(connectionURL, "root", "root");
                    //Student is the table name
                    String query = "select b.img_price as Price, b.img_edition as edi, b.img_desc as Description from uploadedbooks b where b.img_id = "+request.getParameter("idB");
                    System.out.println(request.getParameter("idB"));
                    psmnt = connection.prepareStatement(query);
                    //In id "6" i have the image.
                    rs = psmnt.executeQuery();
                    System.out.println(rs);
                    String descrip, price1, edition;
                    if(rs.next()) {
                        descrip = rs.getString("Description");
                        price1 = rs.getString("Price");
                        edition = rs.getString("edi");
                        request.setAttribute("DESCR", descrip);
                        request.setAttribute("PRIC", price1);
                        request.setAttribute("edi", edition);
                    }
                    }
                    catch(Exception ex)
                    {
                    out.println(ex);
                    }


                    psmnt.close();
                    connection.close();
                %>
			<header id="header">
				<div class="logo"><a href="index.html">ASAP Books</a></div>
                                <a title="Welcome user">Hello <%=userName %></a>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="MainPage.jsp">Home</a></li>
                                        <li><a href="UploadBooks.jsp">Upload Books</a></li>
                    <li><a href="logoutservlet">Logout</a></li>
                    <li><a href="#contactus">Contact us</a></li>
				</ul>
			</nav>
		<!-- Search -->
        
                <section id="two" class="wrapper style2" style="background-color: white;">
					<header class="align-center">
						<p class="special">Book Renting</p>
						<h2>Click on buy button to buy the book...</h2>
					</header>
                                <div>
                                    <!-- class="image fit"  -->
                                    <div style=" max-height: 1200px; max-width:100%; margin-left: 50px;">
                                    <div  style="max-height: 50px; max-width: 250px;">
                                        <a href="#"><img src="E/<%=request.getParameter("bname")%>.jpg" height="320px" width="250px;"/></a>                            
                                        <p style="color: black; font-size: 20px; margin-left: 45px;"><%=request.getParameter("bname") %></p>
                                    </div>
                                    <div style="max-height: 850px; max-width: 850px; margin-left: 400px;">
                                        <p style="color: blue; font-size: 30px;">Description:</p>
                                        <div>
                                        <p style="color: black; margin-left: 50px;"><%=request.getAttribute("DESCR") %></p>
                                        </div>  
                                    </div>
                                        <div style="margin-left: 400px;">
                                            <p style="color: blue; font-size: 30px;">Price:</p>
                                            <p style="color: green; font-size: 20px; margin-left: 50px;">Rs. <%=request.getAttribute("PRIC") %></p>
                                        </div>
                                        <div style="margin-left: 400px;">
                                            <p style="color: blue; font-size: 30px;">Edition:</p>
                                            <p style="color: green; font-size: 20px; margin-left: 50px;"><%=request.getAttribute("edi") %></p>
                                        </div>
                            </div>
                                        <div>
                                            <a href="Success.jsp?price=<%=request.getAttribute("PRIC")%>"><img src="buynow.png" style="max-width: 200px; max-height: 200px; margin-left: 600px;"></a>
                                        </div>
                                        </div>
                                
        </section>
                                        
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
