<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="JobListing.aspx.cs" Inherits="JobListing" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            New Job Listing <small></small>
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
                           Enter Job Information Below
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">

      
            <p>
                <asp:Label ID="Label1" runat="server" Text="What is the title of your job?"></asp:Label>
                <asp:TextBox class="form-control" ID="txtJobTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldTitle" runat="server" ErrorMessage="Required Field" ControlToValidate="txtJobTitle"></asp:RequiredFieldValidator>
            </p>

            <p>
                <asp:Label ID="Label2" runat="server" Text="Write a short description for your job"></asp:Label>
                <asp:TextBox class="form-control" ID="txtDescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldDesc" runat="server" ErrorMessage="Required Field" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
            </p>
                
            <p>
                <asp:Label ID="Label3" runat="server" Text="What sort of job are you posting?"></asp:Label>
              <br />
                <asp:RadioButtonList ID="radJobType" runat="server">
                <asp:ListItem Selected="True">Full-Time</asp:ListItem>
                <asp:ListItem>Part-Time</asp:ListItem>
                <asp:ListItem>Internship</asp:ListItem>
                <asp:ListItem>Volunteer</asp:ListItem>
                </asp:RadioButtonList>
            </p>
                
            <p>
                <asp:Label ID="Label13" runat="server" Text="Would you like to specify a minimum age for your applicants?"></asp:Label>
                <br />
                <asp:CheckBox text="Yes" ID="chkAge" runat="server" OnCheckedChanged="chkAge_CheckedChanged" AutoPostBack ="true"/>
                <br />
                <asp:TextBox class="form-control" ID="txtMinimumAge" runat="server" Visible="False"></asp:TextBox>
                <asp:CompareValidator ID="InvalidAge" runat="server" ControlToValidate="txtMinimumAge" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Invalid Age" ForeColor="Red"/>
            </p>

            <p>
                <asp:Label ID="Label4" runat="server" Text="Does your job have a deadline?"></asp:Label>
                <br />
                <asp:CheckBox text="Yes" ID="chkDeadline" runat="server" OnCheckedChanged="chkDeadline_CheckedChanged" AutoPostBack ="true"/>
                <br />
                <asp:Label ID="Label5" runat="server" Text="When will you stop accepting applications?" Visible="False"></asp:Label>
                <br />
                <asp:Calendar ID="cldrDueDate" runat="server" Visible="False"></asp:Calendar>
            </p>
        
            <p>
                <asp:Label ID="Label6" runat="server" Text="How much will this position pay?"></asp:Label>
                <br />
                <asp:TextBox class="form-control" ID="txtPay" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" ForeColor ="red" runat="server" ErrorMessage="Must enter a number" ControlToValidate="txtPay" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                <br />
                <asp:DropDownList ID="ddlPayType" runat="server">
                <asp:ListItem>Per Hour</asp:ListItem>
                <asp:ListItem>Annually</asp:ListItem>
                </asp:DropDownList>
                <br />
                
                <asp:Label ID="Label9" runat="server" Text="Is this an unpaid position?"></asp:Label>
                <br />
                <asp:CheckBox text="Yes" ID="chkUnpaid" runat="server" OnCheckedChanged="chkUnpaid_CheckedChanged" AutoPostBack ="true"/>
            </p>  
        
            <p>
                <asp:Label ID="Label7" runat="server" Text="Add a career cluster to target the students you're interested in:"></asp:Label>
                <br />
                <asp:ListBox ID="lstCareerCluster" runat="server"></asp:ListBox>
                <br />
            </p>

            <p>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack ="True">
                    <asp:ListItem Selected="True">&nbsp;Quick Apply</asp:ListItem>
                    <asp:ListItem>&nbsp;External URL</asp:ListItem>
                </asp:RadioButtonList>
            <asp:Label ID="Label8" runat="server" Text="Quick Apply: allow your applicants to apply with one click"></asp:Label>
            
            <asp:Label ID="Label14" runat="server" Text="External URL: Have applicants apply on your website"></asp:Label>
            <br />
            </p>

            <asp:Label ID="Label11" runat="server" Text="What information do you need from each applicant?" Visible="False"></asp:Label>
            <br />
            <asp:ListBox ID="lstStudentFields" runat="server" SelectionMode="Multiple" Visible="False">
            </asp:ListBox>
            <asp:Label ID="Label12" runat="server" Text="Enter the URL:" Visible="False"></asp:Label>
            <asp:TextBox class="form-control" ID="txtURL" runat="server" Visible="False"></asp:TextBox>
        
        <p>
            <asp:Button class="btn btn-dark" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </p>
        
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
			<footer><p></a></p></footer>
			</div>
             <!-- /. PAGE INNER  -->
            </div>
</asp:Content>



