<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <style>
        body {
	margin-left: 5%;
    margin-top: 2%;
	}
    </style>
    <form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <asp:TextBox runat="server" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" Width="313px"></asp:TextBox>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <asp:TextBox runat="server" class="form-control" id="exampleInputPassword1" placeholder="Password" Width="313px"></asp:TextBox>
  </div>
  <asp:HyperLink runat="server" class="btn btn-primary"  role="button" NavigateUrl="~/Jobs.aspx">Login</asp:HyperLink>
	<a class="btn btn-secondary" href="createaccount.html" role="button">Create An Account</a>
</form>
</asp:Content>

