<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required meta tags -->
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

     <form runat ="server">
  <div class="form-group">
    <label for="exampleInputEmail1">Username</label>
    <asp:TextBox runat="server" class="form-control" id="txtUsername" aria-describedby="emailHelp" placeholder="Enter email" Width="313px"></asp:TextBox>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <asp:TextBox runat="server" class="form-control" id="txtPassword" placeholder="Password" Width="313px" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
  </div>
	
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click1" Text="Sign In" />
        
       
        
        
        
        
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/CreateUser.aspx" Text="Create Account" />
        
       
        
        
        
        
</form>





</body>
</html>
