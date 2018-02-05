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

<title>home page</title>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Archivo+Narrow:400,700" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
function ajaxFunction(comment,vId,uId)
{
var xmlHttp;
var URL="helper.jsp?comment="+comment+"&vid="+vId+"&uid="+uId;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {
    if(xmlHttp.readyState==4)
      {
      document.commentForm.innerHTML=xmlHttp.responseText;
      }
    }
  xmlHttp.open("GET",URL,true);
  xmlHttp.send(null);
  }
</script>
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
			<p>Welcome </p>
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
								<li><a href="#">Music</a></li>
								<li><a href="#">Tv Shows</a></li>
								<li><a href="#">Sport</a></li>
								<li><a href="#">News</a></li>
								<li><a href="#">Movies</a></li>
								<li><a href="#">Gaming</a></li>
							</ul>
						</li>
						<li>
							<h2> English shows</h2>
							<ul>
								<li><a href="#">HIMYM</a></li>
								<li><a href="#">Supernatural</a></li>
								<li><a href="#">Arrow</a></li>
								<li><a href="#">2 and half man</a></li>
								<li><a href="#">dexter</a></li>
								<li><a href="#">game of throne </a></li>
							</ul>
						</li>
						<li>						</li>
				  </ul>
			  </div>
				<!-- end #sidebar -->
				<div id="content">
				  <div class="post">
				  
				
						<%
						
		Db db=new Db();
		ArrayList videoList=db.selectData();
		VideoInfo video=null;
		for(int i=0;i<videoList.size();i++)
		{
			video=(VideoInfo)videoList.get(i);
			User user=db.getUser(video.getUploaderId());
			if(request.getParameter("video").equals(video.getVideoId()))
			{
	%>
		<video  width="500" height="250" controls  >
			<source src="data/<%=video.getVideoName()%>.ogg" type="video/ogg">
			<source src="data/<%=video.getVideoName()%>.mp4" type="video/mp4">
			<source src="data/<%=video.getVideoName()%>.webm" type="video/webm">
			<object data="data/<%=video.getVideoName()%>.mp4" width="320" height="240">
			<embed width="320" height="240" src="data/<%=video.getVideoName()%>.mp4">
			</object>
		</video>
		<br/><br/>
		<h2><%=video.getVideoName()%></h2>
		<a href="uploader.jsp?userid=<%=user.getId()%>">
		<h4>Uploaded by:&nbsp &nbsp
		<%=user.getFirstName()+"  "+user.getLastName()%><br/>
		Uploading Date:&nbsp &nbsp <%=video.getUploadingDate()%>
		</h4></a>
		<br/><br/>
		
	<%}}%>
					</div>
	<form name="commentForm">
	<input type="text" name="commentBox"/>
	<br/>
	<input value="submit" type="button" name="submit" onclick="ajaxFunction(commentBox.value,<%=video.getVideoId()%>,534534534)"/>
	
	</form>
					
				  <div style="clear: both;">&nbsp;</div>
				</div>
				<!-- end #content -->
				
			  <div 
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
