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
							Students in Each Career Cluster
						</div>
						<div class="panel-body">
							
<div class='tableauPlaceholder' id='viz1554345575002' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Bo&#47;Book1_15543450476750&#47;Sheet1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='Book1_15543450476750&#47;Sheet1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Bo&#47;Book1_15543450476750&#47;Sheet1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1554345575002');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
						</div>
					</div>   
              <div class="col-md-5">
					<div class="panel panel-default">
						<div class="panel-heading">
							Applicants Per Job
						</div>
						<div class="panel-body">
							<div class='tableauPlaceholder' id='viz1554348382869' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Bo&#47;Book2_15543483511140&#47;Sheet1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='Book2_15543483511140&#47;Sheet1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Bo&#47;Book2_15543483511140&#47;Sheet1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1554348382869');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>
						</div>
					</div>  
					</div>
					
				</div> 
		
		
				<footer><p></p>
				
        
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
</asp:Content>


