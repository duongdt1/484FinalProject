<%@ Page Language="C#" MasterPageFile="CUEDINMaster.master"  AutoEventWireup="true"  CodeFile="Finance.aspx.cs" Inherits="dashboard_Finance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">

        <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                             <small></small>
                        </h1>
                    </div>
                </div> 
                 <!-- /. ROW  -->
              <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Finance
                            <br />
                            <br />
                            The finance industry is a critical sector that employs millions of people. The Finance Career Cluster prepares students for careers in financial and investment planning, banking, insurance and business financial management. Finance career opportunities are available in every sector of the economy and require skill in organization, time management, customer service and communication.
                            <br />
                            <br />
                            This career cluster is organized into four career pathways:
                            <ul>
                                <li>Banking and related services</li>
                                <li>Business financial management</li>
                                <li>Financial and investment planning</li>
                                <li>Insurance services</li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="form-group">
         <br />
                                                <p># of jobs with this Career Cluster</p><br/>
       <!-- Form with ASP tags start here -->
                                            <asp:TextBox ID="TextBox1" runat="server" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
                                                <br />
                                           <p> # of Students with this Career Cluster</p>
                                                <br />
                                                <asp:TextBox ID="TextBox2" runat="server" BackColor="#CCCCCC" ReadOnly="True"></asp:TextBox>
       <!-- Form with ASP tags start here -->
            <form id="form1">
        <div>

            <br />
            <br />
            <br />
            
            <br />
            <br />
          
            <br />
            <br />


            &nbsp;</div>
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