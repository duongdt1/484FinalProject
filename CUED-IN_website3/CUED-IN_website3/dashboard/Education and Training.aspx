<%@ Page Language="C#" MasterPageFile="CUEDINMaster.master" AutoEventWireup="true" CodeFile="Education and Training.aspx.cs" Inherits="dashboard_Education_and_Training" %>
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
                            Education and Training
                            <br />
                            <br />
                            If you want to have a lifelong impact on others, then you will want to take a close look at the Education and Training Career Cluster. This family of classes and practical experiences develops the art of teaching, planning and administration in schools, colleges, technical institutes and businesses. Education is one of the basic rights of children in America, and states always need qualified teachers.
                            <br />
                            <br />
                            This career cluster is organized into three career pathways:
                            <ul>
                                <li>Administration and administrative support</li>
                                <li>Professional support services</li>
                                <li>Teaching and training</li>
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