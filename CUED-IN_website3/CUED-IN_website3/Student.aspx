﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/custom.css"/>
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet"/>
  
    <style>
        h1 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Student Sign-Up</h3>
        
        <div>
            <asp:Label ID="lblCounselorEmail" runat="server" Text="Counselor Email"></asp:Label>
            <asp:TextBox ID="txtCounselorEmail" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblMiddleName" runat="server" Text="Middle Name"></asp:Label>
            <asp:TextBox ID="txtMiddleName" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
            <asp:TextBox ID="txtAge" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblGrade" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="txtGrade" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblResumeUpload" runat="server" Text="Resume"></asp:Label>
            <asp:TextBox ID="txtResumeBrowse" runat="server"></asp:TextBox>
            <asp:Button ID="btnBrowseResume" runat="server" Text="Browse..." />
            <br />
            <asp:Button ID="btnResumeUpload" runat="server" Text="Upload" />
            <br />
            
            <br />
            <asp:Label ID="lblTranscript" runat="server" Text="Transcript"></asp:Label>
            <asp:TextBox ID="txtTranscript" runat="server"></asp:TextBox>
            <asp:Button ID="btnTranscriptBrowse" runat="server" Text="Browse..." />
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" />
            <br />
            
            <asp:Label ID="lblEligibility" runat="server" Text="Are you legally authorized to work in the United States?"></asp:Label>
            <asp:RadioButtonList ID="radEligibility" runat="server">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <br />
        </div>
        
        <%--Info below are hidden until this button is clicked --%>
        <asp:Button ID="btnNext" runat="server" Text="Next" />
            
        <br />
        <br />
        
        <div>
            <asp:Label ID="lblOTP" runat="server" Text="Would you like to generate a one time password?"></asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <br />

            <%--Parent part only shows when student selects Yes --%>
            <asp:Label ID="lblParentFirstName" runat="server" Text="Parent First Name"></asp:Label>
            <asp:TextBox ID="txtParentFirstName" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblParentLastName" runat="server" Text="Parent Last Name"></asp:Label>
            <asp:TextBox ID="txtParentLastName" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblParentEmail" runat="server" Text="Parent Email"></asp:Label>
            <asp:TextBox ID="txtParentEmail" runat="server" class="form-control"></asp:TextBox>
            <br />
            <br />
        </div>
        
        <%--Shows when student selects No for OTP --%>
        <div>
            <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" class="form-control"></asp:TextBox>
            <br />
            <br />
        </div>
        
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
    </form>
</body>
</html>
