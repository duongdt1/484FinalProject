<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
      <meta http-equiv="PRAGMA" content="NO-CACHE"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
	  <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">

    <title>CUED-In</title>
      </head>
  
    <body>  
	   <!--Nav starts here-->
        <ul>
            <li><a class="active" href="Index.aspx">Home</a></li>
            <li><a class="active" href="Login.aspx">Login</a></li>
        </ul>
    <!--Nav ends here-->

    <!--Form starts here-->
	  
	<form runat= "server">
        <div class="form-group">
            <label for="exampleInputBusOrgName1">Username</label>
            <br />
            <asp:TextBox class="form-control" ID="txtUserName" runat="server" placeholder="Username" Width="313px"></asp:TextBox>
            <asp:Label ID="lblDuplicate" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <asp:TextBox runat="server" class="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Enter email" Width="313px" TextMode="Email"></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>

        


            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />

        


            <asp:Label ID="Label1" runat="server" Text="Organization"></asp:Label>
            <br />
            <asp:RadioButton ID="rbNew" runat="server" GroupName="choose" Text="Create New Organization" AutoPostBack="True" OnCheckedChanged="rbNew_CheckedChanged" />
            <br />
            <asp:RadioButton ID="rbExisting" runat="server" GroupName="choose" Text="Choose Existing Organization" AutoPostBack="True" OnCheckedChanged="rbExisting_CheckedChanged" />



        <div class="form-group">

            <asp:DropDownList ID="ddlOrg" runat="server" DataSourceID="SqlDataSource1" DataTextField="OrganizationName" DataValueField="OrganizationID" Visible="False">
                <asp:ListItem Value="-1">Select Organization</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connection %>" SelectCommand="SELECT [OrganizationID], [OrganizationName] FROM [Organization]"></asp:SqlDataSource>

            <asp:Label ID="Label2" runat="server" ForeColor="Red" Visible="False"></asp:Label>

            </div>


        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <asp:TextBox runat="server" class="form-control" id="txtPassword" placeholder="Password" Width="313px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ForeColor="Red" runat="server" ControlToValidate="txtPassword" ValidationExpression="(?=.{8,})[a-zA-Z]+[^a-zA-Z]+|[^a-zA-Z]+[a-zA-Z]+" Display="Dynamic" ErrorMessage="Password must be 8 characters and have both letters and numbers." />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red"></asp:RequiredFieldValidator>
            
        </div>
		  
        <div class="form-group">
            <label for="exampleInputReenterPassword1">Re-enter Your Password</label>
            <asp:TextBox runat="server" class="form-control" id="txtReenter" placeholder="Password" Width="313px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtReenter" Display="Dynamic" ErrorMessage="Field Required" ForeColor="Red"></asp:RequiredFieldValidator>
            
            <br />
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />
              
    </form>
    <!--Form ends here-->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
    </body>
</html>