<%@page import="DAO.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Splendorous
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130517

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>home page</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="menu-wrapper">
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="home.jsp">Homepage</a></li>
			<li><a href="login.jsp">login</a></li>
			<li><a href="upload1.jsp">upload</a></li>
			<li><a href="registration.jsp">Register</a></li>
			
		</ul>
	</div>
	<!-- end #menu --> 
</div>
<div id="header-wrapper">
	<div id="header">
		<form action="showResult.jsp" method="post" id="logo">
        <input style=" font:Arial, Helvetica, sans-serif; font-size:16px; font-size-adjust:inherit; width:900px; height:30pt" type="text" name="search"  placeholder="search videos......"/>
        <input type="submit" value="search" style="height:35pt"/>
			<h1>MUE tUBE </h1>
			<p>SHARE AND PLAY  </p>
		</form>
	</div>
</div>
<div id="wrapper"> 
	<!-- end #header -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				<div id="sidebar">
					<ul>
						<li>
							<h2>Mue Tube </h2>
							<p><img src="images/1.jpg" width="230" height="100" alt="" /></p>
						</li>
					  <li>
							<h2>Categories</h2>
							<ul>
								<li><a href="linkbutton.jsp">Music</a></li>
								<li><a href="linkbutton.jsp">Tv Shows</a></li>
								<li><a href="linkbutton.jsp">Sport</a></li>
								<li><a href="linkbutton.jsp">News</a></li>
								<li><a href="linkbutton.jsp">Movies</a></li>
								<li><a href="linkbutton.jsp">Gaming</a></li>
							</ul>
						</li>
						<li>
							<h2> English shows</h2>
							<ul>
								<li><a href="linkbutton.jsp">HIMYM</a></li>
								<li><a href="linkbutton.jsp">Supernatural</a></li>
								<li><a href="linkbutton.jsp">Arrow</a></li>
								<li><a href="linkbutton.jsp">2 and half man</a></li>
								<li><a href="linkbutton.jsp">dexter</a></li>
								<li><a href="linkbutton.jsp">game of throne </a></li>
							</ul>
						</li>
						<li>						</li>
				  </ul>
			  </div>
				<!-- end #sidebar -->
				<div id="content">
				  <div class="post">
						<h2><%=request.getAttribute("error")%></h2>
</div>
				  <div style="clear: both;">&nbsp;</div>
				</div>
				<!-- end #content -->
				
			  <div id="sidebar2">
					
				</div>
				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>
	</div>
	<!-- end #page --> 
</div>
<div id="footer">
	<p>&copy; 2013 Sitename.com. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
</div>
<!-- end #footer -->
</body>
</html>
<html>
<Body>
<h1><%=request.getAttribute("error")%></h1>
</body>
</html>