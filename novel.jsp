<%-- 
    Document   : MainPage
    Created on : Nov 12, 2018, 11:50:33 AM
    Author     : Akshita
--%>

<%@page import="javax.script.ScriptEngine"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<!DOCTYPE html>
<!DOCTYPE HTML>
<!--
	Hielo by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>ASAP - Novel</title>
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
            <!-- Now connect -->
            
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
                    String query = "select b.img_title as Title, b.img_id as ID, b.img_author as Author, b.img_price as Price, b1.img_data as Pic from uploadedbooks b "+
                                    "inner join N b1 on b.img_id= b1.img_id";
                    psmnt = connection.prepareStatement(query);
                    //In id "6" i have the image.
                    rs = psmnt.executeQuery();
                    rs.afterLast();
                    PrintWriter pw = response.getWriter();
                    String nameB=null, nameA=null, price=null;
                    int id1=0;
                    pw.println("<center style=\"margin-top: 100px;\">");
                    pw.println("<table style=\"color: black; border: 1px solid black;\">");
                    pw.println("<tr><th>Book Name</th><th>Author name</th><th>Price</th></tr>");
                        while(rs.previous()) {
                            nameB = rs.getString("Title");
                            nameA = rs.getString("Author");
                            price = rs.getString("Price");
                            id1 = rs.getInt("ID");
                            request.setAttribute("bookName", nameB);
                            request.setAttribute("pp", price);
                            pw.println("<tr>");
                            pw.println("<td><a href=\"showN.jsp?bname="+nameB+"&idB="+id1+"\" style=\"padding: 2px;\">"+nameB+"</a></td>");
                            pw.println("<td><p style=\"padding: 2px;\">"+nameA+"</p></td>");
                            pw.println("<td><p style=\"padding: 2px;\">"+price+"</p></td>");
                            pw.println("</tr>");
                        }
                    pw.println("</table>");
                    pw.println("</center>");
                    }
                    catch(Exception ex)
                    {
                    out.println(ex);
                    }


                    psmnt.close();
                    connection.close();
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
                                        <li><a href="UploadBooks.jsp">Upload Books</a></li>
                                        <li><a href="logoutservlet">Logout</a></li>
                                        <li><a href="#contactus">Contact us</a></li>
				</ul>
			</nav>
                
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
                    