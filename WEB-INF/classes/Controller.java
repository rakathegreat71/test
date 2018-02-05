import javax.servlet.*;
import javax.servlet.http.*;
import DAO.VideoInfo;
import DAO.Db;
import java.util.ArrayList;
import java.io.*;
import DAO.User;
import DAO.Gmail;


public class Controller extends HttpServlet  
{
	private User user;
	private Db db;
	private Gmail mail;
	
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		process(req,res);
	}
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		process(req,res);
	}
	
	public void process(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		//res.setContentType("text/html");
		HttpSession session=req.getSession(true);
		String userAction=req.getParameter("action");
		if(userAction.equals("register"))
		{
			sendVerificationCode(req,res,session);
		}
	
		if(userAction.equals("verify"))
		{
			register(req,res,session);
			
		}
		
		if(userAction.equals("logout"))
		{
			//System.out.println(session.getId());
			session.invalidate();
			session=req.getSession(true);
			//System.out.println(session.getId());
			session.invalidate();
			res.sendRedirect("login.jsp");
			
			return;
		}
		
		if(userAction.equals("login"))
		{
			session.invalidate();
			login(req,res);
		}
	}
	
	public void sendVerificationCode(HttpServletRequest req,HttpServletResponse res,HttpSession session)throws ServletException,IOException
	{
		db=new Db();
		String f=req.getParameter("firstName");
		String l=req.getParameter("lastName");
		String e=req.getParameter("email");
		String p=req.getParameter("password");
		String DOB=req.getParameter("DOB");
		String c=req.getParameter("country");
		String s=req.getParameter("sex");
		boolean exist=db.checkEmail(e);
		if(exist)
		{
			user=new User(f,l,p,e,DOB,c,s);
			session.setAttribute("user",user);
			int r=(int)(Math.random()*1000000000);
			String code=r+"";
			mail=new Gmail(req.getParameter("email"),code);
			session.setAttribute("verificationCode",code);
			res.sendRedirect("verification.jsp");
		}
		else
		{
			res.sendRedirect("error.jsp");
		}
		
	}
	
	public void register(HttpServletRequest req,HttpServletResponse res,HttpSession session)throws ServletException,IOException
	{
		String Ucode=req.getParameter("userCode");
		String userCode=Ucode.trim();
		
		String Vcode=(String)session.getAttribute("verificationCode");
		String verificationCode=Vcode.trim();
		if(userCode.equals(verificationCode))
		{
			//System.out.println(Ucode);
			//System.out.println(Vcode);
			db=new Db();
			user=(User)session.getAttribute("user");
			db.insertUser(user);
			session.invalidate();
			res.sendRedirect("login.jsp");
		}
		
	}
	
	public void login(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException
	{
		HttpSession session=req.getSession();
		String email=req.getParameter("userName");
		String password=req.getParameter("password");
		Db db=new Db();
		User user=db.verifyUser(email,password);
		
		if(user!=null)
		{
			//System.out.println("exist");
			session.setAttribute("UserData",user);
			RequestDispatcher rd=req.getRequestDispatcher("User_home.jsp");
			rd.forward(req,res);
		}
		else
		{
			res.sendRedirect("login.jsp");
		}
		
							
		
	}

}