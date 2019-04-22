<%@ Page Title="" Language="C#" MasterPageFile="CUEDINMaster.master" AutoEventWireup="true" CodeFile="Job.aspx.cs" Inherits="Job" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>--%>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
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
                    <%--<div class="panel panel-default">--%>
                        <div class="panel-heading">
                          <h2>Current Job Listings</h2>

                            
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
         
       <!-- Form with ASP tags start here -->
        <div class="row">
                <div class="col-lg-12">
                   <!-- <div class="panel panel-default"> -->
                        <div class="panel-heading">
                           
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                
               
                    <div>
                    <asp:Button class="btn btn-dark" ID="btnEditJobPosting" runat="server" PostBackUrl="~/dashboard/searchjob.aspx" Text="Edit a Job Posting" />
                    <br />
                    <br />
                    <asp:Button class="btn btn-dark" ID="btnViewApplicants" runat="server" OnClick="btnViewApplicants_Click" Text="View All Applicants" />
                    <br />
                    <br />
                    <asp:GridView class="table table-striped table-bordered table-hover" ID="grdJobs" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdJobs_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />  
			</asp:GridView>
                    </div>
                
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
</asp:Content>


