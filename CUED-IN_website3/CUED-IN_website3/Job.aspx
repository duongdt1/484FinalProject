<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Job.aspx.cs" Inherits="Job" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Current Job Postings"></asp:Label>
            <asp:Button ID="btnNewListing" runat="server" OnClick="btnNewListing_Click" Text="Add a New Listing" />
            <asp:Button ID="btnEditJobPosting" runat="server" Text="Edit a Job Posting" />
            <br />
            <asp:Button ID="btnViewApplicants" runat="server" OnClick="btnViewApplicants_Click" Text="View All Applicants" />
            <br />
            <asp:GridView ID="grdJobs" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdJobs_SelectedIndexChanged">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
