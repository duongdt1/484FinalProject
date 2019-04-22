<%@ Page Language="C#"MasterPageFile="CUEDINMaster.master" AutoEventWireup="true" CodeFile="Health Science.aspx.cs" Inherits="dashboard_Health_Science" %>
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
                            Health Science
                            <br />
                            <br />
                            Healthcare is the largest and fastest-growing industry in the United States. In the Health Science Career Cluster you can prepare for a career that promotes health, wellness and diagnosis, and treats injuries and diseases.
                            <br />
                            <br />
                            Some careers involve working directly with people, while others involve research into diseases or collecting and formatting data and information. You could work in hospitals, medical or dental offices, laboratories, communities, medivac units, sports arenas or cruise ships.
                            <br />
                            <br />
                            This career cluster is organized into five career pathways:
                            <ul>
                                <li>Biotechnology research and development</li>
                                <li>Diagnostic services</li>
                                <li>Health informatics</li>
                                <li>Support services</li>
                                <li>Therapeutic services</li>
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