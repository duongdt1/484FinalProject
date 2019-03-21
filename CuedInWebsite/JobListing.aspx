<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobListing.aspx.cs" Inherits="JobListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


h1, .h1 {
  font-size: 2.5rem;
}

h1, h2, h3, h4, h5, h6,
.h1, .h2, .h3, .h4, .h5, .h6 {
  margin-bottom: 0.5rem;
  font-weight: 500;
  line-height: 1.2;
}

h1, h2, h3, h4, h5, h6 {
  margin-top: 0;
  margin-bottom: 0.5rem;
}

  *,
  *::before,
  *::after {
    text-shadow: none !important;
    box-shadow: none !important;
  }
  
*,
*::before,
*::after {
  box-sizing: border-box;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Job Postings</h1>
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <p>
                <asp:Label ID="Label1" runat="server" Text="What is the title of your job?"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="txtJobTitle" runat="server"></asp:TextBox>
            </p>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <p>
                <asp:Label ID="Label2" runat="server" Text="Write a short description for your job"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </p>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <p>
                <asp:Label ID="Label3" runat="server" Text="What sort of job are you posting?"></asp:Label>
            </p>
            <asp:RadioButtonList ID="radJobType" runat="server">
                <asp:ListItem>Full-Time</asp:ListItem>
                <asp:ListItem>Part-Time</asp:ListItem>
                <asp:ListItem>Internship</asp:ListItem>
                <asp:ListItem>Volunteer</asp:ListItem>
            </asp:RadioButtonList>
        </asp:Panel>
        <asp:Panel ID="Panel5" runat="server">
            <asp:Label ID="Label4" runat="server" Text="Does your job have a deadline?"></asp:Label>
            <br />
            <asp:CheckBox ID="chkDeadline" runat="server" OnCheckedChanged="chkDeadline_CheckedChanged" AutoPostBack ="true"/>
            <br />
            <asp:Label ID="Label5" runat="server" Text="When will you stop accepting applications?" Visible="False"></asp:Label>
            <br />
            <asp:Calendar ID="cldrDueDate" runat="server" Visible="False"></asp:Calendar>
        </asp:Panel>
        <asp:Panel ID="Panel6" runat="server">
            <asp:Label ID="Label6" runat="server" Text="How much will this position pay?"></asp:Label>
            <br />
            <asp:TextBox ID="txtPay" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlPayType" runat="server">
                <asp:ListItem>Per Hour</asp:ListItem>
                <asp:ListItem>Annually</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:CheckBox ID="chkUnpaid" runat="server" OnCheckedChanged="chkUnpaid_CheckedChanged" Text="Is this an unpaid position?" AutoPostBack ="true"/>
        </asp:Panel>
        <asp:Panel ID="Panel7" runat="server">
            <asp:Label ID="Label7" runat="server" Text="Add a career cluster to target the students you're interested in"></asp:Label>
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel8" runat="server">
            <asp:Label ID="Label9" runat="server" Text="Quick Apply: allow your applicants to apply with one click"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="External URL: Have applicants apply on your website"></asp:Label>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack ="True">
                <asp:ListItem>Quick Apply</asp:ListItem>
                <asp:ListItem>External URL</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label11" runat="server" Text="What information do you need from each applicant?" Visible="False"></asp:Label>
            <br />
            <asp:ListBox ID="lstStudentFields" runat="server" Visible="False"></asp:ListBox>
            <br />
            <asp:Label ID="Label12" runat="server" Text="Enter the URL:" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtURL" runat="server" Visible="False"></asp:TextBox>
        </asp:Panel>
        <p>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </p>
    </form>
</body>
</html>
