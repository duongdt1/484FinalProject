<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="03NewJob.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <!doctype html>

  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>CUED-In</title>
  </head>
  <body>
 <form id="form1" runat="server">
       
     
        <div class="form-group">
            <h1>Job Postings</h1>
    <label for="exampleFormControlInput1">Job Title</label>
    <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" Width="595px"></asp:TextBox>

    </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Job Description</label>
    <asp:TextBox ID="txtJobDescription" runat="server" class="form-control" Width="595px"></asp:TextBox>
  </div>
  <fieldset class="form-group">
    <div class="row">
      </div>
      <legend class="col-form-label col-sm-2 pt-0">Job Type</legeJob Type</legend>
      <div class="col-sm-10">
          <asp:RadioButtonList ID="radJobType" runat="server">
              <asp:ListItem>Full-Time</asp:ListItem>
              <asp:ListItem>Part-Time</asp:ListItem>
              <asp:ListItem>Internship</asp:ListItem>
              <asp:ListItem>Volunteer</asp:ListItem>
          </asp:RadioButtonList>
      </div>
    </div>
  </fieldset>
  <div class="form-group">
    <label for="exampleFormDueDate">Deadline</label>
        <asp:TextBox ID="txtDueDate" runat="server" class="form-control" Width="595px" TextMode="Date"></asp:TextBox>
  </div>
  <div class="form-group">
    <label for="exampleFormPay">Pay</label>
      <asp:TextBox ID="txtJobPay" runat="server" class="form-control" Width="595px"></asp:TextBox>
      <br />
      <asp:Label ID="Label1" runat="server" Text="Organization Type"></asp:Label>
      <asp:TextBox ID="txtOrgType" runat="server" class="form-control" Width="595px"></asp:TextBox>
      <asp:Label ID="Label2" runat="server" Text="Career Cluster"></asp:Label>
      <asp:TextBox ID="txtCluster" runat="server" class="form-control" Width="595px"></asp:TextBox>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
         <asp:Button ID="Button1" runat="server" OnClick="btnSubmit_Click" Text="Submit" class="btn btn-primary" />
    </div>
  </div>

    </form> </body>
</asp:Content>
