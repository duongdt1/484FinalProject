<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="Scholarship.aspx.cs" Inherits="Scholarship" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Scholarships <small></small>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
              <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
         
       <!-- Form with ASP tags start here -->

    <div class="row">
                <div class="col-lg-12">
                  <div class="panel panel-default">
                        <div class="panel-heading">
                           Enter Scholarship Information Below
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
    
     <form id="form1">
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Scholarship Title"></asp:Label>
            <asp:TextBox class="form-control" ID="txtTitle" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field Required" ControlToValidate="txtTitle" BackColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Organization Sponsor"></asp:Label>
            <asp:TextBox class="form-control" ID="txtSponsor" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field Required" ControlToValidate="txtSponsor" Display="Dynamic" BackColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Contact Email"></asp:Label>
            <asp:TextBox class="form-control" ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field Required" ControlToValidate="txtEmail" Display="Dynamic" BackColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regexScholarshipEmail" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
            <asp:TextBox class="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field Required" ControlToValidate="txtDescription" Display="Dynamic" BackColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Deadline"></asp:Label>
            <asp:TextBox class="form-control" ID="txtDeadline" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Award Amount"></asp:Label>
            <asp:TextBox class="form-control" ID="txtAmount" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Field Required" ControlToValidate="txtAmount" Display="Dynamic" BackColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" ForeColor ="red" runat="server" ErrorMessage="Must enter a number" ControlToValidate="txtAmount" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
            <br />
            <asp:Button class="btn btn-dark" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </div>
    </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>

        <!-- Form with ASP tags end here -->

                                    </div>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
			<footer><p></p></footer>
			</div>
             <!-- /. PAGE INNER  -->
            </div>
</asp:Content>



