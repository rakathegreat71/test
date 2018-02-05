<%@page import="DAO.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.*" %>

<%
	String comment1=request.getParameter("comment");
	String uid=request.getParameter("uid");
	String vid=request.getParameter("vid");
	Db db=new Db();
	User user=null;
	Date d=new Date();
	String dateOfComment=d.toString();
	db.addComment(comment1,dateOfComment,uid,vid);
%>

<%
	ArrayList comments=null;
	Comments comment=null;
	comments=db.getComment(vid);
%>

<%
		int size=comments.size()-1;
		for(int i=size;i>=0;i--){
			comment=(Comments)comments.get(i);
			user=db.getUser(comment.getUserId());
			String name=user.getFirstName()+" "+user.getLastName();
			String time=comment.getDateOfComment();
			String cmt=comment.getComment();
%>
	
	<div  style="font:Arial, Helvetica, sans-serif; font-size:16px; font-size-adjust:inherit;">
	<h3 style="background-color:#CCF"">
	<a href="uploader.jsp?userid=<%=user.getId()%>">Commented By:&nbsp&nbsp<%=name%></a></h3>
	<h4 style="background-color: #CCF " >Comment:&nbsp<%=cmt%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br/> dated:<%=time%></h4>
	</div><br/><br/><br/>

		
	
<%
		}
%>


