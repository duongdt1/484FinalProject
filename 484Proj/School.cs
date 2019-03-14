public class School
{
	private int SchoolID;
	string SchoolName;
	string SchoolEmailAddress;
	string SchoolPhoneNumber;
	string LastUpdatedBy;
	DateTime LastUpdated;

	public School(string SchoolName, string SchoolEmailAddress, string SchoolPhoneNumber,
	string LastUpdatedBy, string LastUpdated)
	{
		setSchoolName(SchoolName);
		setSchoolEmailAddress(SchoolEmailAddress);
		setSchoolPhoneNumber(SchoolPhoneNumber);
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated((LastUpdated);
	}
	
	//set and get SchoolName
	public void setSchoolName(string SchoolName)
	{
		this.SchoolName = SchoolName;
	}
	public string getSchoolName()
	{
		return SchoolName;
	}
	
	//set and get SchoolEmail
	public void setSchoolEmailAddress(string SchoolEmailAddress)
	{
		this.SchoolEmailAddress = SchoolEmailAddress;
	}
	public string getSchoolEmailAddress()
	{
		return SchoolEmailAddress;
	}
	
	//set and get SchoolPhoneNumber
	public void setSchoolPhoneNumber(string SchoolPhoneNumber)
	{
		this.SchoolPhoneNumber = SchoolPhoneNumber;
	}
	public string getSchoolPhoneNumber()
	{
		return SchoolPhoneNumber;
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

