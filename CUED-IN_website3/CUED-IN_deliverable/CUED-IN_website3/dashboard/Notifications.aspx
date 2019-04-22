<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
<div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Notifications <small></small>
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
            <form id="form1">
                <div>
                      <asp:CheckBox ID="chkShowOpened" runat="server" Text="Show Viewed Notifications" Checked="True" OnCheckedChanged="chkShowOpened_CheckedChanged" AutoPostBack="true"/>
            		<asp:GridView ID="grdNotifications" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdNotifications_SelectedIndexChanged">
            		</asp:GridView>
        	</div>
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
			<footer><p></p></footer>
			</div>
             <!-- /. PAGE INNER  -->
            </div>

</asp:Content>

