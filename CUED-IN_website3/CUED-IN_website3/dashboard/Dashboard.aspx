<%@ Page Title="" Language="C#" MasterPageFile="CUEDINMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
     <div id="page-wrapper">
            <div id="page-inner">


                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Welcome <small><asp:Label ID="companyName" runat="server" Text="test"></asp:Label></small> <!-- company name? -->
                        </h1>
						<!--
                        <ol class="breadcrumb">
  <li><a href="#">Home</a></li>
  <li><a href="#">Library</a></li>
  <li class="active">Data</li>
</ol>
                        -->
                    </div>
                </div>
				
				
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-green green">
                            <div class="panel-left pull-left green">
                                <i class="fa fa-briefcase fa-5x"></i>
                                
                            </div>
                            <div class="panel-right">
								<h3><asp:Label ID="jobPostingCount" runat="server" Text="99"></asp:Label></h3>
                               <strong> Posted Jobs</strong>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                              <div class="panel-left pull-left blue">
                                <i class="fa fa-file-text fa-5x"></i>
								</div>
                                
                            <div class="panel-right">
							<h3><asp:Label ID="applicationReceivedCount" runat="server" Text=""></asp:Label></h3>
                               <strong> Applications Received</strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-brown">
                            <div class="panel-left pull-left brown">
                                <i class="fa fa fa-users fa-5x"></i>
                               
                            </div>
                            <div class="panel-right">
							 <h3><asp:Label ID="studentClusterCount" runat="server" Text=""></asp:Label></h3>
                               <strong> Students In Your Cluster </strong>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel panel-primary text-center no-boder bg-color-red">
                            <div class="panel-left pull-left red">
                                <i class="fa fa-exclamation fa-5x"></i>
                                
                            </div>
                            <div class="panel-right">
							<h3><asp:Label ID="unreadNotifs" runat="server" Text=""></asp:Label></h3>
                             <strong>Unread Notifications</strong>

                            </div>
                        </div>
                    </div>
                </div>
				
				<div class="row"> 
                    						<div class="panel panel-default">
						<div class="panel-heading">
							Jobs in Each Career Cluster
						</div>
						<div class="panel-body">
<!--NOTLIVE--><!--<script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 1920px; height: 799px;'><object class='tableauViz' width='1500' height='799' style='display:none;'><param name='host_url' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;finalcuedin' /><param name='name' value='expUSE4&#47;Sheet1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>-->	
<!--LIVE--><script type='text/javascript' src='https://us-east-1.online.tableau.com/javascripts/api/viz_v1.js'></script><div class='tableauPlaceholder' style='width: 1920px; height: 799px;'><object class='tableauViz' width='1500' height='799' style='display:none;'><param name='host_url&:refresh=yes' value='https%3A%2F%2Fus-east-1.online.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='&#47;t&#47;finalcuedin' /><param name='name' value='liveUSE&#47;Sheet1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='showAppBanner' value='false' /><param name='filter' value='iframeSizedToWindow=true' /></object></div>						
						</div>
					</div>   
              >
					
				</div> 
		
		
				<footer><p></p>
				
        
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
</asp:Content>


