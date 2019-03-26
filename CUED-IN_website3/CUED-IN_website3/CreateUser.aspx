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
	  <nav class="navbar navbar-expand-lg navbar-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
      </li>
		<li class="nav-item">
        <a class="nav-link" href="dashboard.html">Dashboard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="listing.html">Listing</a>
      </li>
		<asp:hyperlink runat ="server" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" NavigateUrl="~/Login.aspx">Login</asp:hyperlink>
    </ul>
  </div>
</nav>
	  
	  <form runat= "server">
		  <div class="auto-style1">
    <label for="exampleInputBusOrgName1"></label>
              <asp:Label ID="lblUsername" runat="server" Text="Username"  Width="313px"></asp:Label>
              <br />
              <asp:TextBox ID="txtUserName" runat="server" Width="313px"></asp:TextBox>
  &nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:Label ID="txtDuplicate" runat="server" ForeColor="Red"></asp:Label>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>