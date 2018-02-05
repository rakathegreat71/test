package DAO;
import java.sql.*;
import java.util.ArrayList;
import DAO.User;
import DAO.VideoInfo;
import DAO.Comments;


public class Db
{
	Connection con=null;
	PreparedStatement stmt=null;
	VideoInfo video;
	ArrayList videoList;
	User user;
	
	public void getConnection() throws Exception
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String URL="jdbc:odbc:rakesh";
		con=DriverManager.getConnection(URL);
		//stmt=con.createStatement();
	}
	
	public User getUser(String userId)
	{
		try
		{
			getConnection();
			String sql="select * from userData where id=?";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,userId);
			//stmt.setString(2,password);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				user =new User(rs.getString("firstName"),rs.getString("lastName"),rs.getString("password"),rs.getString("email"),rs.getString("DOB"),rs.getString("country"),rs.getString("sex"));
				user.setId(rs.getString("id"));
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return user;
	}
	
	public ArrayList selectData()
	{	
		videoList=new ArrayList();
		try
		{
			getConnection();
			String sql="select *from videoinfo";
			stmt=con.prepareStatement(sql);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				String videoName=rs.getString("Videoname");
				String img=rs.getString("imageName");
				String uploader=rs.getString("uploaderId");
				String videoId=rs.getString("Id");
				String title=rs.getString("title");
				String  date=rs.getString("uploadingDate");
				video=new VideoInfo(videoName,uploader,img,title);
				video.setVideoId(videoId);
				video.setUploadingDate(date);
				videoList.add(video);
				//System.out.println(name);
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return videoList;
		
	}
	
	public ArrayList getComment(String vId)
	{	
		ArrayList comments =new ArrayList();
		//System.out.println("its working");
		try
		{
			getConnection();
			//System.out.println("its working");
			String sql="select *from comments where videoId='"+vId+"'";
			stmt=con.prepareStatement(sql);
			ResultSet rs=stmt.executeQuery();
			//if(rs.next()!=true)System.out.println("not null");
			while(rs.next())
			{
				String comment=rs.getString("comment");
				String date=rs.getString("date");
				String userid=rs.getString("userid");
				String videoId=rs.getString("videoId");
				//System.out.println(comment);
				Comments comment1=new Comments(comment,userid,videoId,date);
				comments.add(comment1);
				//System.out.println(name);
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return comments;
		
	}
	
	public void addComment(String cmt,String date,String userId,String videoId)
	{
		try
		{
			getConnection();
			String sql="insert into comments values(?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,cmt);
			stmt.setString(2,userId);
			stmt.setString(4,videoId);
			stmt.setString(3,date);
			
			int count=stmt.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	public boolean checkEmail(String email)
	{	
		videoList=new ArrayList();
		boolean check =true ;
		try
		{
			
			getConnection();
			String sql="select email from userData ";
			stmt=con.prepareStatement(sql);
			//stmt.setString(1,email);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				if(email.trim().equals(rs.getString("email").trim()))
					{
						check=false;
						//System.out.println(check);
					}
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		//System.out.println(check);
		return check;
		//return videoList;
		
	}
	public void addVideo(VideoInfo u)
	{
		try
		{
			getConnection();
			String sql="insert into videoinfo(videoName,imageName,uploaderId,title,uploadingDate) values(?,?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,u.getVideoName());
			stmt.setString(2,u.getImageName());
			stmt.setString(3,u.getUploaderId());
			stmt.setString(4,u.getTitle());
			stmt.setString(5,u.getUploadingDate());
			int count=stmt.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	public void insertUser(User u)
	{
		try
		{
			getConnection();
			String sql="insert into userData(firstName,lastName,password,email,dob,country,sex) values(?,?,?,?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,u.getFirstName());
			stmt.setString(2,u.getLastName());
			stmt.setString(3,u.getPassword());
			stmt.setString(4,u.getEmail());
			stmt.setString(5,u.getDOB());
			stmt.setString(6,u.getCountry());
			stmt.setString(7,u.getSex());
			int count=stmt.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	
	public User verifyUser(String email,String password)
	{
		try
		{
			getConnection();
			String sql="select * from userData where email=? and password=?";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,email);
			stmt.setString(2,password);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				user =new User(rs.getString("firstName"),rs.getString("lastName"),rs.getString("password"),rs.getString("email"),rs.getString("DOB"),rs.getString("country"),rs.getString("sex"));
				user.setId(rs.getString("id"));
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return user;
	}
	
	public ArrayList searchData(String videoName1)
	{	
		videoList=new ArrayList();
		try
		{
			getConnection();
			String sql="select *from videoinfo where videoName like'%"+videoName1+"%'";
			stmt=con.prepareStatement(sql);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				String videoName=rs.getString("Videoname");
				String  date=rs.getString("uploadingDate");
				String img=rs.getString("imageName");
				String uploader=rs.getString("uploaderId");
				String videoId=rs.getString("Id");
				String title=rs.getString("title");
				video=new VideoInfo(videoName,uploader,img,title);
				video.setVideoId(videoId);
				video.setUploadingDate(date);
				videoList.add(video);
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return videoList;
		
	}
	
	
	public ArrayList myVideos(String videoName1)
	{	
		videoList=new ArrayList();
		try
		{
			getConnection();
			String sql="select *from videoinfo where uploaderid like'%"+videoName1+"%'";
			stmt=con.prepareStatement(sql);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				String videoName=rs.getString("Videoname");
				String  date=rs.getString("uploadingDate");
				String img=rs.getString("imageName");
				String uploader=rs.getString("uploaderId");
				String videoId=rs.getString("Id");
				String title=rs.getString("title");
				video=new VideoInfo(videoName,uploader,img,title);
				video.setVideoId(videoId);
				video.setUploadingDate(date);
				videoList.add(video);
				
			}
			
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return videoList;
		
	}
	
	
	
	
	
	
}
	
	
	
	
