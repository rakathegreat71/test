package DAO;
public class User 
{
	private String Id,firstName,lastName,password,email,dob,country,sex;
	
	public User(String f,String l,String p,String e,String d,String c,String s)
	{
		//Id=id;
		firstName=f;
		lastName=l;
		password=p;
		email=e;
		dob=d;
		country=c;
		sex=s;
	}
	
	public void setId(String id)
	{
		Id=id;
	}
	
	public String getId()
	{
		return Id;
	}
	
	public String getFirstName()
	{
		return firstName;
	}
	
	public String getLastName()
	{
		return lastName;
	}
	public String getPassword()
	{
		return password;
	}
	public String getEmail()
	{
		return email;
	}
	public String getDOB()
	{
		return dob;
	}
	public String getCountry()
	{
		return country ;
	}
	
	public String getSex()
	{
		return sex;
	}
}