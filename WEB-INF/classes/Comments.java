package DAO;
public class Comments 
{
	private String comment;
	private String userId;
	private String videoId;
	private String dateOfComment;
	
	public Comments(String c,String u,String v,String d)
	{
		comment=c;
		userId=u;
		videoId=v;
		dateOfComment=d;
	}
	
	public String getComment()
	{
		return comment;
	}
	
	public String getUserId()
	{
		return userId;
	}
	
	public String getVideoId()
	{
		return videoId;
	}
	
	public String getDateOfComment()
	{
		return dateOfComment;
	}
}