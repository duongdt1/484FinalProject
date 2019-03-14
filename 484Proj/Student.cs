public class Student
{
	private int StudentID;
	string StudentFirstName;
	string StudentLastName;
	string StudentMiddleName;
	string StudentEmailAddress;
	int StudentOneTimePasscode;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public Student(string StudentFirstName, string StudentLastName, string StudentMiddleName,
	string StudentEmailAddress, int StudentOneTimePasscode, string LastUpdatedBy, string LastUpdated)
	{
		setStudentFirstName(StudentFirstName);
		setStudentLastName(StudentLastName);
		setStudentMiddleName(StudentMiddleName);
		setStudentEmailAddress(StudentEmailAddress);
		setStudentOneTimePasscode(StudentOneTimePasscode);
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated((LastUpdated);
	}
	
	//set and get StudentFirstName
	public void setStudentFirstName(string StudentFirstName)
	{
		this.StudentFirstName = StudentFirstName;
	}
	public string getStudentFirstName()
	{
		return StudentFirstName;
	}
	
	//set and get StudentLastName
	public void setStudentLastName(string StudentLastName)
	{
		this.StudentLastName = StudentLastName;
	}
	public string getStudentLastName()
	{
		return StudentLastName;
	}
	
	//set and get StudentMiddleName
	public void setStudentMiddleName(string StudentMiddleName)
	{
		this.StudentMiddleName = StudentMiddleName;
	}
	public string getStudentMiddleName()
	{
		return StudentMiddleName;
	}
	
	//set and get StudentEmailAddress
	public void setStudentEmailAddress(string StudentEmailAddress)
	{
		this.StudentEmailAddress = StudentEmailAddress;
	}
	public string getStudentEmailAddress()
	{
		return StudentEmailAddress;
	}
	
	//set and get StudentOneTimePasscode
	public void setStudentOneTimePasscode(int StudentOneTimePasscode)
	{
		this.StudentOneTimePasscode = StudentOneTimePasscode;
	}
	public int getStudentOneTimePasscode()
	{
		return StudentOneTimePasscode;
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