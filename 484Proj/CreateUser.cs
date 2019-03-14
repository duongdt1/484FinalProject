public class CreateUser
{
	private int UserID;
	string UserFirstName;
	string UserLastName;
	string UserCompanyName;
	string UserEmailAddress;
	string UserPassword;
	string UserPasswordConfirm;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public User(string UserFirstName, string UserLastName, string UserCompanyName, 
	string UserEmailAddress, string UserPassword, string UserPasswordConfirm, string LastUpdatedBy,
	DateTime LastUpdated)
	{
		setUserFirstName(UserFirstName);
		setUserLastName(UserLastName);
		setUserCompanyName(UserCompanyName);
		setUserEmailAddress(UserEmailAddress);
		setUserPassword(UserPassword);
		setUserPasswordConfirm(UserPasswordConfirm);
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated((LastUpdated);
	}
	
	//set and get UserFirstName
	public void setUserFirstName(string UserFirstName)
	{
		this.UserFirstName = UserFirstName;
	}
	public string getUserFirstName(string UserFirstName)
	{
		return UserFirstName;
	}
	
	//set and get UserLastName
	public void setUserLastName(string UserLastName)
	{
		this.UserLastName = UserLastName;
	}
	public string getUserLastName(string UserLastName)
	{
		return UserLastName;
	}
	
	//set and get UserCompanyName
	public void setUserCompanyName(string UserCompanyName)
	{
		this.UserCompanyName = UserCompanyName;
	}
	public string getUserCompanyName(string UserCompanyName)
	{
		return UserCompanyName;
	}
	
	//set and get UserEmailAddress
	public void setUserEmailAddress(string UserEmailAddress)
	{
		this.UserEmailAddress = UserEmailAddress;
	}
	public string getUserEmailAddress(string UserEmailAddress)
	{
		return UserEmailAddress;
	}
	
	
	//set and get UserPassword
	public void setUserPassword(string UserPassword)
	{
		this.UserPassword = UserPassword;
	}
	public string getUserPassword(string UserPassword)
	{
		return UserPassword;
	}
	
	//set and get UserPasswordConfirm
	public void setUserPasswordConfirm(string UserPasswordConfirm)
	{
		this.UserPasswordConfirm = UserPasswordConfirm;
	}
	public string getUserPasswordConfirm(string UserPasswordConfirm)
	{
		return UserPasswordConfirm;
	}
	
	//set and get LastUpdatedBy
	public void setLastUpdatedBy(string LastUpdatedBy)
    {
        this.LastUpdatedBy = LastUpdatedBy;
    }
    public string getLastUpdatedBy()
    {
        return LastUpdatedBy;
    }
	
	//set and get LastUpdated
    public void setLastUpdated(DateTime LastUpdated)
    {
        this.LastUpdated = LastUpdated;
    }
    public DateTime getLastUpdated()
    {
        return LastUpdated;
    }
	
}