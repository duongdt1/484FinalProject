public class Job
{
	private int JobID;
	string JobPay;
	string JobType;
	string JobDescription;
	string LastUpdatedBy;
	DateTime LastUpdated;
	
	public Job(string JobPay, string JobType, string JobDescription, string LastUpdatedBy, string LastUpdated)
	{
		setJobPay(JobPay);
		setJobType(JobType);
		setJobDescription(JobDescription);
		setLastUpdatedBy(LastUpdatedBy);
		setLastUpdated(LastUpdated);
	}
	
	//set and get JobPay
	public void setJobPay(string JobPay)
    {
        this.JobPay = JobPay;
    }
    public string getJobPay()
    {
        return JobPay;
    }
	
	//set and get JobType
	public void setJobType(string JobType)
    {
        this.JobType = JobType;
    }
    public string getJobType()
    {
        return JobType;
    }
	
	//set and get JobDescription
	public void setJobDescription(string JobDescription)
    {
        this.JobDescription = JobDescription;
    }
    public string getJobDescription()
    {
        return JobDescription;
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