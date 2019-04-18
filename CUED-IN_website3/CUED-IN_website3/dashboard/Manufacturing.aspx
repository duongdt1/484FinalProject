<%@ Page Language="C#" MasterPageFile="CUEDINMaster.master" AutoEventWireup="true" CodeFile="Manufacturing.aspx.cs" Inherits="dashboard_Manufacturing" %>
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
                            Manufacturing
                            <br />
                            <br />
                            Are you interested in how products and machines come together? Do you care about the quality of materials and of workmanship? Then you should explore the Manufacturing career cluster, which covers how industry and technology work together to make or package the things that we use or consume every day like cars, computers and food.
                            <br />
                            <br />
                            Careers in advanced manufacturing offer exciting opportunities in designing and improving products, operating high-tech tools and machinery, analyzing problems and coming up with creative solutions, and working with both your hands and your mind.
                            <br />
                            <br />
                            This career cluster is organized into eight career pathways:
                            <ul>
                                <li>Production</li>
                                <li>Manufacturing production process development</li>
                                <li>Maintenance</li>
                                <li>Installation and repair</li>
                                <li>Quality assurance</li>
                                <li>Logistics and inventory control</li>
                                <li>Health</li>
                                <li>Safety and environmental assurance</li>
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
