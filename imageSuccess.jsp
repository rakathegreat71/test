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
<body><%
	if(session.getAttribute("UserData")!=null){
	User user=(User)session.getAttribute("UserData");
	String userName=user.getFirstName()+"  "+user.getLastName();

%>
<div id="menu-wrapper">


	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="User_home.jsp">Homepage</a></li>
			<li><a href="controller?action=logout">logout</a></li>
			<li><a href="userUpload.jsp">upload</a></li>
		</ul>
	</div>
	<!-- end #menu --> 
</div>
<div id="header-wrapper">
	<div id="header">
		<form action="userShowResult.jsp" method="post" id="logo">
        <input style=" font:Arial, Helvetica, sans-serif; font-size:16px; font-size-adjust:inherit; width:900px; height:30pt" type="text" name="search"  placeholder="search videos......"/>
        <input type="submit" value="search" style="height:35pt"/>
			<h1>MUE tUBE </h1>
			<p>SHARE AND PLAY  </p>
			<p>Welcome <%=userName%></p>
			<p>your video is successfully uplaoded with thumbnail</p>
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
								<li><a href="user_user_linkButton.jsp">Music</a></li>
								<li><a href="user_linkButton.jsp">Tv Shows</a></li>
								<li><a href="user_linkButton.jsp">Sport</a></li>
								<li><a href="user_linkButton.jsp">News</a></li>
								<li><a href="user_linkButton.jsp">Movies</a></li>
								<li><a href="user_linkButton.jsp">Gaming</a></li>
							</ul>
						</li>
						<li>
							<h2> English shows</h2>
							<ul>
								<li><a href="user_linkButton.jsp">HIMYM</a></li>
								<li><a href="user_linkButton.jsp">Supernatural</a></li>
								<li><a href="user_linkButton.jsp">Arrow</a></li>
								<li><a href="user_linkButton.jsp">2 and half man</a></li>
								<li><a href="user_linkButton.jsp">dexter</a></li>
								<li><a href="user_linkButton.jsp">game of throne </a></li>
							</ul>
						</li>
						<li>						</li>
				  </ul>
			  </div>
				<!-- end #sidebar -->
				<div id="content">
				  <div class="post">
				 <form action="playVideo.jsp" method="post"> 
				
						<%
						
		Db db=new Db();
		ArrayList videoList=db.selectData();
		VideoInfo video=null;
		for(int i=0;i<videoList.size();i++)
		{
			video=(VideoInfo)videoList.get(i);
	%>
		<input name="video" width="200px" height="200px" type="image" value="<%=video.getVideoId()%>" src="data/<%=video.getImageName()%>" />
		<br/><br/><br/><br/>
		
	<%}%>
					</form></div>
				  <div style="clear: both;">&nbsp;</div>
				</div>
				<!-- end #content -->
				
			  <div id="sidebar2">
					<div>
                     <h1><img src="images/img04.jpg" width="230" height="100" alt="" /></h1>
                    </div>
                    <div>
                     <h1><img src="images/img04.jpg" width="230" height="100" alt="" /></h1>
                    </div>
                    <div><img src="images/img04.jpg" width="230" height="100" alt="" /></div>
                <div>
                     <h1><img src="images/img04.jpg" width="230" height="100" alt="" /></h1>
                  </div>
				</div>
				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>
	</div>
	<!-- end #page --> 
</div>
<div id="footer">
	<p>&copy; 2013 Sitename.com. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
	

	</div><%}%>
<!-- end #footer -->
</body>
</html>
