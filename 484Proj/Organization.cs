public class Organization
{
	private int OrganizationID;
	string OrganizationFirstName;
	string OrganizationLastName;
	string OrganizationName;
	string OrganizationEmailAddress;
	string OrganizationPassword;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public Organization(string OrganizationFirstName, string OrganizationLastName, string OrganizationName,
	string OrganizationEmailAddress, string OrganizationPassword, string LastUpdatedBy, string LastUpdated)
	{
		setOrganizationFirstName(OrganizationFirstName);
		setOrganizationLastName(OrganizationLastName);
		setOrganizationName(OrganizationLastName);
		setOrganizationEmailAddress(OrganizationEmailAddress);
		setOrganizationPassword(OrganizationPassword);
		string LastUpdatedBy;
		DateTime LastUpdated;
	}
	
	//set and get OrganizationFirstName
	public void setOrganizationFirstName(string OrganizationFirstName)
	{
		this.OrganizationFirstName = OrganizationFirstName;
	}
	public string getOrganizationFirstName(string OrganizationFirstName)
	{
		return OrganizationFirstName;
	}
	
	//set and get OrganizationLastName
	public void setOrganizationLastName(string OrganizationLastName)
	{
		this.OrganizationLastName = OrganizationLastName;
	}
	public string getOrganizationLastName(string OrganizationLastName)
	{
		return OrganizationLastName;
	}
	
	//set and get OrganizationName
	public void setOrganizationName(string OrganizationName)
	{
		this.OrganizationName = OrganizationName;
	}
	public string getOrganizationName(string OrganizationName)
	{
		return OrganizationName;
	}
	
	//set and get OrganizationEmailAddress
	public void setOrganizationEmailAddress(string OrganizationEmailAddress)
	{
		this.OrganizationEmailAddress = OrganizationEmailAddress;
	}
	public string getOrganizationEmailAddress(string OrganizationEmailAddress)
	{
		return OrganizationEmailAddress;
	}
	
	//set and get OrganizationPassword
	public void setOrganizationPassword(string OrganizationPassword)
	{
		this.OrganizationPassword = OrganizationPasswords;
	}
	public string getOrganizationPassword(string OrganizationPassword)
	{
		return OrganizationPassword;
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

