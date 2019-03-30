<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
	  <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">

    <title>CUED-In</title>
      <style type="text/css">
          .auto-style1 {
              width: 914px;
              margin-bottom: 1rem;
          }
      </style>
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
            <asp:Label ID="txtDuplicate" runat="server" ForeColor="Red"></asp:Label>
        </div>

        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <asp:TextBox runat="server" class="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Enter email" Width="313px"></asp:TextBox>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>

        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <asp:TextBox runat="server" class="form-control" id="txtPassword" placeholder="Password" Width="313px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
        </div>
		  
        <div class="form-group">
            <label for="exampleInputReenterPassword1">Re-enter Your Password</label>
            <asp:TextBox runat="server" class="form-control" id="txtReenter" placeholder="Password" Width="313px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
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