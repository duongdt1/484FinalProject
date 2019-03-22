<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Jobs.aspx.cs" Inherits="Jobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
	 <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
  
    <style>
        h1 {
            text-align: left;
        }
    </style>

    
    
    <body>
    <form id="form1">
       
        <h3>Add a Listing</h3>
     
    <div class="form-group">   
    <label for="exampleFormControlInput1">Job Title</label>
    <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" Width="595px"></asp:TextBox>
    </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Job Description</label>
    <asp:TextBox ID="txtJobDescription" runat="server" class="form-control" Width="595px" Height="100px" TextMode="MultiLine"></asp:TextBox>
  </div>
  <fieldset class="form-group">
    <div class="row">
      </div>
      <legend class="col-form-label col-sm-2 pt-0">Job Type</legend>
      <div class="col-sm-10">
          <asp:RadioButtonList ID="radJobType" runat="server">
              <asp:ListItem>Full-Time</asp:ListItem>
              <asp:ListItem>Part-Time</asp:ListItem>
              <asp:ListItem>Internship</asp:ListItem>
              <asp:ListItem>Volunteer</asp:ListItem>
          </asp:RadioButtonList>
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
      <br />
      <asp:Label ID="Label2" runat="server" Text="Career Cluster"></asp:Label>
      <asp:TextBox ID="txtCluster" runat="server" class="form-control" Width="595px"></asp:TextBox>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
         <asp:Button ID="Button1" runat="server" OnClick="btnSubmit_Click" Text="Submit" class="btn btn-primary" />
    </div>
  </div>

    </form>
</body>
</asp:Content>



