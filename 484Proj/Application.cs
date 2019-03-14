public class Application
{
	private int ApplicationID;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public Application(string LastUpdatedBy, string LastUpdated)
	{
		
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated(LastUpdated);
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