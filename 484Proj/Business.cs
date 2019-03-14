public class Business
{
	private int BusinessID;
	string BusinessIndustryType;
	string BusinessFirstName;
	string BusinessLastName;
	string BusinessCompanyName;
	string BusinessEmailAddress;
	int BusinessPhoneNumber;
	string BusinessPassword;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public Business(string BusinessIndustryType, string BusinessFirstName, string BusinessLastName,
	string BusinessCompanyName, string BusinessEmailAddress, int BusinessPhoneNumber, string BusinessPassword,
	string LastUpdatedBy, string LastUpdated)
	{
		setBusinessIndustryType(BusinessIndustryType);
		setBusinessFirstName(BusinessFirstName);
		setBusinessLastName(BusinessLastName);
		setBusinessCompanyName(BusinessCompanyName);
		setBusinessEmailAddress(BusinessEmailAddress);
		setBusinessPhoneNumber(BusinessPhoneNumber);
		setBusinessPassword(BusinessPassword);
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated((LastUpdated);
	}
	
	//set and get BusinessIndustryType
	public void setBusinessIndustryType(string BusinessIndustryType)
	{
		this.BusinessIndustryType = BusinessIndustryType;
	}
	public string getBusinessIndustryType(string BusinessIndustryType)
	{
		return BusinessIndustryType;
	}
	
	//set and get BusinessFirstName
	public void setBusinessFirstName(string BusinessFirstName)
	{
		this.BusinessFirstName = BusinessFirstName;
	}
	public string getBusinessFirstName(string BusinessFirstName)
	{
		return BusinessFirstName;
	}
	
	//set and get BusinessLastName
	public void setBusinessLastName(string BusinessLastName)
	{
		this.BusinessLastName = BusinessLastName;
	}
	public string getBusinessLastName(string BusinessLastName)
	{
		return BusinessLastName;
	}
	
	//set and get BusinessCompanyName
	public void setBusinessCompanyName(string BusinessCompanyName)
	{
		this.BusinessCompanyName = BusinessCompanyName;
	}
	public string getBusinessCompanyName(string BusinessCompanyName)
	{
		return BusinessCompanyName;
	}
	
	//set and get BusinessEmailAddress
	public void setBusinessEmailAddress(string BusinessEmailAddress)
	{
		this.BusinessEmailAddress = BusinessEmailAddress;
	}
	public string getBusinessEmailAddress(string BusinessEmailAddress)
	{
		return BusinessEmailAddress;
	}
	
	//set and get BusinessPhoneNumber
	public void setBusinessPhoneNumber(int BusinessPhoneNumber)
	{
		this.BusinessPhoneNumber = BusinessPhoneNumber;
	}
	public int getBusinessPhoneNumber(int BusinessPhoneNumber)
	{
		return BusinessPhoneNumber;
	}
	
	//set and get BusinessPassword
	public void setBusinessPassword(string BusinessPassword)
	{
		this.BusinessPassword = BusinessPassword;
	}
	public string getBusinessPasscode(string BusinessPassword)
	{
		return BusinessPassword;
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