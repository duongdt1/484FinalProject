<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="Applications.aspx.cs" Inherits="Applications" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
     <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Current Applicants <small></small>
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
                
               <form id="form1">
                    <div>
            <asp:Panel ID="pnlGridView" runat="server">
                
                <asp:GridView class="table table-striped table-bordered table-hover" ID="grdApplicants" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdApplicants_SelectedIndexChanged" >
                    
                </asp:GridView>
                                <br />
                <asp:LinkButton ID="linkTest" runat="server" OnClick="linkTest_Click">Export to Excel</asp:LinkButton>
            </asp:Panel>
            </div>
            <asp:Literal ID="ltEmbed" runat="server" />
            <asp:Panel ID="pnlResults" runat="server" Visible="False">
            <asp:Label ID="Label2" runat="server" Text="Application"></asp:Label>
            <br />
            <asp:Table class="table table-striped table-bordered table-hover" ID="tblInfo" runat="server" Width="124px">
            </asp:Table>
            <br />
            <asp:Label ID="lblRelevantFiles" runat="server" Text="Relevant Files:"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblResume" runat="server" Text="Resume:"></asp:Label>
            <asp:Button class="btn btn-dark" ID="btnViewResume" runat="server" OnClick="btnViewResume_Click" Text="View" />
            <asp:Button class="btn btn-dark" ID="btnDownloadResume" runat="server" OnClick="btnDownloadResume_Click" Text="Download" />
            <br />
            <br />
            <asp:Label ID="lblTranscript" runat="server" Text="Transcript:"></asp:Label>
            <asp:Button class="btn btn-dark" ID="btnViewTranscript" runat="server" OnClick="btnViewTranscript_Click" Text="View" />
            <asp:Button class="btn btn-dark" ID="btnDownloadTranscript" runat="server" OnClick="btnDownloadTranscript_Click" Text="Download" />
            &nbsp;<br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Please set the Application Status"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlStatus" runat="server" >
                <asp:ListItem>Reviewed</asp:ListItem>
                <asp:ListItem>Declined</asp:ListItem>
                <asp:ListItem>Approved</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button class="btn btn-light" ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" />
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

