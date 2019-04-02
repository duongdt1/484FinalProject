<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JobListing.aspx.cs" Inherits="JobListing" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bootstrap Admin Theme : Master</title>
	<!-- Bootstrap Styles-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FontAwesome Styles-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
    <link href="assets/css/custom-styles.css" rel="stylesheet" />
     <!-- Google Fonts-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>

<body>
    <!-- NAV top begin -->
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Dashboard.aspx"><i class="fa fa-gear"></i> <strong>CUED-IN</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Doe</strong>
                                    <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since the...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">28% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
                                            <span class="sr-only">28% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">85% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                            <span class="sr-only">85% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!-- NAV top end -->
        
        <!-- NAV side begin -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-sitemap"></i>Jobs<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            
                    <li>
                        <a href="JobListing.aspx">Job Listings<span class="fa arrow"></span></a>
                    </li>
                        </ul>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- NAV side end -->

        <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Job Listings <small></small>
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
            <form id="form1" runat="server">
                <asp:Panel ID="Panel1" runat="server">
            <p>
                <asp:Label ID="Label1" runat="server" Text="What is the title of your job?"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="txtJobTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldTitle" runat="server" ErrorMessage="* Required Field" ControlToValidate="txtJobTitle"></asp:RequiredFieldValidator>
            </p>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <p>
                <asp:Label ID="Label2" runat="server" Text="Write a short description for your job"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldDesc" runat="server" ErrorMessage="* Required Field" ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
            </p>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server">
            <p>
                <asp:Label ID="Label3" runat="server" Text="What sort of job are you posting?"></asp:Label>
            </p>
            <asp:RadioButtonList ID="radJobType" runat="server">
                <asp:ListItem>Full-Time</asp:ListItem>
                <asp:ListItem>Part-Time</asp:ListItem>
                <asp:ListItem>Internship</asp:ListItem>
                <asp:ListItem>Volunteer</asp:ListItem>
            </asp:RadioButtonList>
        </asp:Panel>
        <asp:Panel ID="Panel5" runat="server">
            <asp:Panel ID="Panel9" runat="server">
                <asp:Label ID="Label13" runat="server" Text="Would you like to specify a minimum age for your applicants?"></asp:Label>
                <br />
                <asp:CheckBox ID="chkAge" runat="server" OnCheckedChanged="chkAge_CheckedChanged" AutoPostBack ="true"/>
                <br />
                <asp:TextBox ID="txtMinimumAge" runat="server" Visible="False"></asp:TextBox>
            </asp:Panel>
            <asp:Label ID="Label4" runat="server" Text="Does your job have a deadline?"></asp:Label>
            <br />
            <asp:CheckBox ID="chkDeadline" runat="server" OnCheckedChanged="chkDeadline_CheckedChanged" AutoPostBack ="true"/>
            <br />
            <asp:Label ID="Label5" runat="server" Text="When will you stop accepting applications?" Visible="False"></asp:Label>
            <br />
            <asp:Calendar ID="cldrDueDate" runat="server" Visible="False"></asp:Calendar>
        </asp:Panel>
        <asp:Panel ID="Panel6" runat="server">
            <asp:Label ID="Label6" runat="server" Text="How much will this position pay?"></asp:Label>
            <br />
            <asp:TextBox ID="txtPay" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlPayType" runat="server">
                <asp:ListItem>Per Hour</asp:ListItem>
                <asp:ListItem>Annually</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:CheckBox ID="chkUnpaid" runat="server" OnCheckedChanged="chkUnpaid_CheckedChanged" Text="Is this an unpaid position?" AutoPostBack ="true"/>
        </asp:Panel>
        <asp:Panel ID="Panel7" runat="server">
            <asp:Label ID="Label7" runat="server" Text="Add a career cluster to target the students you're interested in"></asp:Label>
            <br />
            <asp:ListBox ID="lstCareerCluster" runat="server"></asp:ListBox>
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel8" runat="server">
            <asp:Label ID="Label9" runat="server" Text="Quick Apply: allow your applicants to apply with one click"></asp:Label>
            <br />
            <asp:Label ID="Label10" runat="server" Text="External URL: Have applicants apply on your website"></asp:Label>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack ="True">
                <asp:ListItem>Quick Apply</asp:ListItem>
                <asp:ListItem>External URL</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label11" runat="server" Text="What information do you need from each applicant?" Visible="False"></asp:Label>
            <br />
            <asp:ListBox ID="lstStudentFields" runat="server" SelectionMode="Multiple" Visible="False">
            </asp:ListBox>
            <br />
            <asp:Label ID="Label12" runat="server" Text="Enter the URL:" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtURL" runat="server" Visible="False"></asp:TextBox>
        </asp:Panel>
        <p>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </p>
        </form>
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
			<footer><p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p></footer>
			</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- Metis Menu Js -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script>
    
   
</body>
</html>
