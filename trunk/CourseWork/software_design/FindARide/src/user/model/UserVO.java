package user.model;

public class UserVO
{
	private Long userID;
	private String name;
	private String email;
	private String phoneNumber;
	private String sex;
	private String userName;
	private String password;

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPhoneNumber()
	{
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumber;
	}

	public String getSex()
	{
		return sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	public Long getUserID()
	{
		return userID;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	@Override
	public String toString()
	{
		StringBuffer sb = new StringBuffer();

		sb.append("-------------");
		sb.append("\nname :" + name);
		sb.append("\nemail :" + email);
		sb.append("\nphoneNumber :" + phoneNumber);
		sb.append("\nsex :" + sex);
		sb.append("\nuserID: " + userID);
		sb.append("\nuserName :" + userName);
		sb.append("\npassword :" + password);

		return sb.toString();
	}

	public void setUserID(Long userID)
	{
		this.userID = userID;
	}

}
