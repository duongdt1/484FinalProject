public class Scholarship
{
	private int ScholarshipID;
	int ScholarshipAmount;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public Scholarship(int ScholarshipAmount, string LastUpdatedBy, string LastUpdated)
	{
		setScholarshipAmount
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated(LastUpdated);
	}
	
	//set and get ScholarshipAmount
	public void setScholarshipAmount(int ScholarshipAmount)
    {
        this.ScholarshipAmount = ScholarshipAmount;
    }
    public int getScholarshipAmount()
    {
        return ScholarshipAmount;
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