<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
	  <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">

    <title>CUED-IN</title>
</head>

<body>
    <!--Nav starts here-->
    <ul>
        <li><a class="active" href="Index.aspx">Home</a></li>
        <li><a class="active" href="Login.aspx">Login</a></li>
    </ul>
    <!--Nav ends here-->
    
    <!--Form starts here-->
    <form id="form1" runat="server">
        <h3>Student Sign-Up</h3>
        
        <div>
            <asp:Label ID="lblCounselorEmail0" runat="server" Text="Select Your School"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlSchool" class="form-control" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblCounselorEmail" runat="server" Text="Counselor Email"></asp:Label>
            <asp:TextBox ID="txtCounselorEmail" runat="server" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqCounselorEmail" runat="server" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="txtCounselorEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexCounselor" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCounselorEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqFN" runat="server" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqLN" runat="server" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblMiddleName" runat="server" Text="Middle Name"></asp:Label>
            <asp:TextBox ID="txtMiddleName" runat="server" class="form-control"></asp:TextBox>
            <br />
            <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
            <asp:TextBox ID="txtAge" runat="server" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqAge" runat="server" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="txtAge"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="InvalidAge" runat="server" ControlToValidate="txtAge" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Invalid Age" ForeColor="Red"/>
            <br />
            <asp:Label ID="lblGrade" runat="server" Text="Grade"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlGradeLevel" runat="server">
                <asp:ListItem Value="5"></asp:ListItem>
                <asp:ListItem Value="6"></asp:ListItem>
                <asp:ListItem Value="7"></asp:ListItem>
                <asp:ListItem Value="8"></asp:ListItem>
                <asp:ListItem Value="9"></asp:ListItem>
                <asp:ListItem Value="10"></asp:ListItem>
                <asp:ListItem Value="11"></asp:ListItem>
                <asp:ListItem Value="12"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ReqEmail" runat="server" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexEmail" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblResumeUpload" runat="server" Text="Resume"></asp:Label>
            <br />
            <asp:FileUpload ID="fuResume" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblTranscript" runat="server" Text="Transcript"></asp:Label>
            <br />
            <asp:FileUpload ID="fuTranscript" runat="server" />
            <br />
            <br />
            
            <asp:Label ID="lblEligibility" runat="server" Text="Are you legally authorized to work in the United States?"></asp:Label>
            <asp:RadioButtonList ID="radEligibility" runat="server">
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:ListBox ID="lstCareerCluster" runat="server" SelectionMode="Multiple"></asp:ListBox>
            <br />
            <br />
        </div>
        
        <%--Info below are hidden until this button is clicked --%>
        
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </form>
    <!--Form ends here-->

    <br />
	    <img src="logo.png" alt="Cued-In Logo" height="150" width="150" class="center">
	<br />
        <h3>Career Focused. Community Driven.</h3>
	  
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
