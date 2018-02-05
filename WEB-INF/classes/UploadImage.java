import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import DAO.Db;
import DAO.User;
import DAO.VideoInfo;


@WebServlet(name="UploadServlet", urlPatterns={"/upload"})     // specify urlPattern for servlet
@MultipartConfig                                               // specifies servlet takes multipart/form-data
public class UploadImage extends HttpServlet {
   
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
	{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
		{
            String fileName=request.getParameter("photoname");
			int index=fileName.lastIndexOf(".")+1;
			int len=fileName.length();
			String format=fileName.substring(index,len);
			HttpSession session=request.getSession(true);
			String fileName1=(String)session.getAttribute("fileName")+"."+format;//image name with format
			String title=(String)session.getAttribute("title");//title of the video 
			User user=(User)session.getAttribute("UserData");
			//System.out.println("imageName:"+fileName1+"\n"+"title:"+title+"\nuploaderId:"+user.getId());
			//saving videoInfo into Database
			
			Db db=new Db();
			Date date=new Date();
			VideoInfo videoInfo=new VideoInfo((String)session.getAttribute("fileName"),user.getId(),fileName1,title);
			String d=date.toString();
			videoInfo.setUploadingDate(d);
			db.addVideo(videoInfo);
			
			//saving vidoeimage on the server system;
			
				Part p1 = request.getPart("file");
				InputStream is = p1.getInputStream();
				String outputfile =getServletContext().getInitParameter("location")+fileName1;  // get path on the server
				FileOutputStream os = new FileOutputStream (outputfile);
				
				int ch = is.read();
				while (ch != -1) {
					 os.write(ch);
					 ch = is.read();
				}
				os.close();
				
				
				//adding data into the database 
				/*db=new Db();
				user=(User)session.getAttribute("userData");
				videoInfo =new VideoInfo(fileName,user.getId(),fileName1,title);
				db.addVideo(videoInfo);*/
			
				
				
				response.sendRedirect("imageSuccess.jsp");
			
			
		}
		catch(Exception ex) 
		{
		   out.println("Exception -->" + ex.getMessage());
		}
		finally
		{ 
			out.close();
		}
    } // end of doPost()
 } // end of UploadServlet