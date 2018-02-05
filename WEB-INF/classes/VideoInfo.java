package DAO;
public class VideoInfo
{
	private String videoName;
	private String videoId;
	private String uploaderId;
	private String imageName;
	private String title;
	private String uploadingDate;
	
	public VideoInfo(String n,String u,String i,String t)
	{
		videoName=n;
		uploaderId=u;
		imageName=i;
		title=t;
	}
	
	public void setVideoId(String id)
	{
		videoId=id;
	}
	
	public void setUploadingDate(String date)
	{
		uploadingDate=date;
	}
	
	public String getImageName()
	{
		return imageName;
	}
	
	public String getVideoName()
	{
		return videoName;
	}
	
	public String getUploaderId()
	{
		return uploaderId;
	}
	
	public String getVideoId()
	{
		return videoId;
	}
	
	public String getTitle()
	{
		return title;
	}
	
	public String getUploadingDate()
	{
		return uploadingDate;
	}
}
 