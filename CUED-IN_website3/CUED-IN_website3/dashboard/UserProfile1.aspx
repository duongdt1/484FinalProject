<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="UserProfile1.aspx.cs" Inherits="dashboard_UserProfile1" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            User Profile <small></small>
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
                          
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
    
     <form id="form1" >
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Profile" Width="150px"></asp:Label>
                <asp:LinkButton ID="btnEditOrg" runat="server" OnClick="btnEditOrg_Click">Edit</asp:LinkButton>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Organization Name"></asp:Label>
                <br />
                <asp:Label ID="lblOrgName" runat="server" Text="Label"></asp:Label>
                <asp:TextBox class="form-control" ID="txtOrgName" runat="server" Visible="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Organization Type"></asp:Label>
                <br />
                <asp:Label ID="lblOrgType" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="radOrgType" runat="server" Visible="False">
                    <asp:ListItem>Profit</asp:ListItem>
                    <asp:ListItem>Non-Profit</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Primary Career Cluster"></asp:Label>
                <br />
                <asp:Label ID="lblCareerCluster" runat="server" Text="lblCareerCluster"></asp:Label>
                <asp:ListBox ID="lstCareerCluster" runat="server" Visible="False"></asp:ListBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Phone Number"></asp:Label>
                <br />
                <asp:Label ID="lblOrgPhoneNumber" runat="server" Text="lblOrgPhoneNumber"></asp:Label>
                <br />
                <asp:TextBox class="form-control" ID="txtOrgPhone" runat="server" Visible="False"></asp:TextBox>
                <br />
            </asp:Panel>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Label ID="Label8" runat="server" Text="User Information" Width="150px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:LinkButton ID="btnEditPassword" runat="server" OnClick="btnEditPassword_Click">Change Password</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblPass" runat="server" Text="Enter Password" Visible="False"></asp:Label>
            <br />
            <asp:TextBox class="form-control" ID="txtPass" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassConfirm" runat="server" Text="Re-enter Password" Visible="False"></asp:Label>
            <br />
            <asp:TextBox class="form-control" ID="txtPassConfirm" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtPassConfirm" ErrorMessage="Passwords do not match"></asp:CompareValidator>
            <br />
            <asp:Button class="btn btn-dark" ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Visible="False" />
            <asp:Button class="btn btn-dark" ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" Visible="False" />
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Notifications"></asp:Label>
            <br />
            <asp:RadioButtonList ID="radNotifications" runat="server" OnSelectedIndexChanged="radNotifications_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem>Enabled</asp:ListItem>
                <asp:ListItem>Disabled</asp:ListItem>
            </asp:RadioButtonList>
        </asp:Panel>
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

