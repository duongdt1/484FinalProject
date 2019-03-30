using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrganizationUser
/// </summary>
public class OrganizationUser
{
    String userName;
    String password;
    String email;
    int organizationID;
   
    DateTime lastUpdated;
    String lastUpdatedBy;

    public OrganizationUser(String userName, String password, String email)
    {
        setUserName(userName);
        setEmail(email);
        setPassword(password);
       
        setLastUpdatedBy();
        setLastUpdated();
        
    }
    public OrganizationUser(String userName, String password, String email, int organizationID)
    {
        setUserName(userName);
        setEmail(email);
        setPassword(password);

        setLastUpdatedBy();
        setLastUpdated();
        this.organizationID = organizationID;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }
   
    public void setPassword(String password)
    {
        this.password = password;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
   
    public void setLastUpdated()
    {
        this.lastUpdated = DateTime.Today;
    }
    public void setLastUpdatedBy()
    {
        this.lastUpdatedBy = "Blueberry";
    }
   
    public String getEmail()
    {
        return email;
    }
    public DateTime getLastUpdated()
    {
        return lastUpdated;
    }
    public String getLastUpdatedBy()
    {
        return lastUpdatedBy;
    }
    public String getUserName()
    {
        return userName;
    }
    public String getPassword()
    {
        return password;
    }
    public int getOrgID()
    {
        return this.organizationID;
    }
}
