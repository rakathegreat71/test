import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Scanner;
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


public class Upload extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
	{
        HttpSession session=request.getSession(true);
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
		{
            String fileName=request.getParameter("photoname");
			int index=fileName.lastIndexOf(".")+1;
			int len=fileName.length();
			String format=fileName.substring(index,len);
			index--;
			String onlyFileName=fileName.substring(0,index);
			//System.out.println(onlyFileName);
			
			String title=request.getParameter("title");
			//System.out.println(title);
			session.setAttribute("fileName",onlyFileName);
			session.setAttribute("title",title);
			//System.out.println("done");
			if(format.equals("mp4")||format.equals("ogg")||format.equals("swf")||format.equals("webm"))
			{
				Part p1 = request.getPart("file");
				InputStream is = p1.getInputStream();
				String outputfile =getServletContext().getInitParameter("location")+fileName;  // get path on the server
				FileOutputStream os = new FileOutputStream (outputfile);
				
				int ch = is.read();
				while (ch != -1) {
					 os.write(ch);
					 ch = is.read();
				}
				os.close();
				
				response.sendRedirect("uploadImage.jsp");
				
			}
			else
			{
				request.setAttribute("error","wrong format\nfile format should be:ogg,mp4,webm,swf");
				RequestDispatcher rd=request.getRequestDispatcher("error.jsp");
				rd.forward(request,response);
			}
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