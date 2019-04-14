<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Events" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Events <small></small>
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
            New Event

            <br />
            <br />
            Date<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>


            <br />
            Event Type&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Associated School&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>


            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Save" />


            &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />


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


