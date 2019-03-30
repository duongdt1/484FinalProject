﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateBusiness.aspx.cs" Inherits="CreateBusiness" %>

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
                <label for="exampleInputBusOrgName1">Business/Organization Name</label>
                <asp:TextBox runat="server" class="form-control" id="txtOrgName" placeholder="Business/Organization Name" Width="313px" AutoCompleteType="Company"></asp:TextBox>
            </div>
          
            <div class="form-group">  
                <label for="exampleInputType">Business/Organization Type</label>
                <asp:RadioButtonList ID="radOrgType" runat="server">
                    <asp:ListItem class="form-check-label">Profit</asp:ListItem>
                    <asp:ListItem class="form-check-label">Non-Profit</asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div class="form-group">
                <label for="exampleInputIndustry">Industry Type</label>
                <br />
                <asp:DropDownList class="form-control" ID="lstCareerCluster" runat="server">
                </asp:DropDownList>
                <br />
            </div>

          <!--<div class="form-group">
    <label>Organization Type</label>
    <br />
    <asp:DropDownList ID="ddlOrgType" runat="server">
        <asp:ListItem>Business</asp:ListItem>
        <asp:ListItem>Non-Profit</asp:ListItem>
    </asp:DropDownList>
    </div>-->
          
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <asp:TextBox runat="server" class="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Enter email" Width="313px"></asp:TextBox>
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>

            <div class="form-group">
                <label>Phone Number</label>
                <asp:TextBox runat="server" class="form-control" id="txtPhone" aria-describedby="emailHelp" placeholder="Phone Number" Width="313px"></asp:TextBox>
            </div>

          
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />
              
        </form>
    
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