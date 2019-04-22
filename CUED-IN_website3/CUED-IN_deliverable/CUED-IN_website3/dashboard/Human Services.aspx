<%@ Page Language="C#" MasterPageFile="CUEDINMaster.master" AutoEventWireup="true" CodeFile="Human Services.aspx.cs" Inherits="dashboard_CarClusRedirect" %>
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
                            Human Services
                            <br />
                            <br />
                            The Human Services Career Cluster prepares you for jobs that relate to families and human needs. Whether you want to be a social worker, a childcare provider or a hairdresser, you will be addressing human needs.
                            <br />
                            <br />
                            This career cluster is organized into seven career pathways:
                            <br />
                            <br />
                            <ul>
                                <li>Consumer services</li>
                                <li>Counseling </li>
                                <li>Mental health services</li>
                                <li>Early childhood development and services</li>
                                <li>Family services</li>
                                <li>Community services</li>
                                <li>Personal care services</li>
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
