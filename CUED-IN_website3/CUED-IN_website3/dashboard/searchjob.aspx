<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="searchjob.aspx.cs" Inherits="searchjob" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

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
                   <!-- <div class="panel panel-default"> -->
                        <div class="panel-heading">
                           Enter Job Title
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                
               <form id="form1">
                    
            <asp:TextBox class="form-group" Width="313px" ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" class="btn btn-dark" runat="server" OnClick="Button1_Click" Text="Search" />
            <br />

                                            <div style="overflow-x:auto;width:1300px">

            <asp:GridView class="table table-striped table-bordered table-hover"  ID="GridViewSearch" runat="server" AutoGenerateColumns="False" OnRowEditing="searchEdit" OnRowCancelingEdit="cancelEdit" OnRowUpdating ="searchUpdate" OnRowDeleting ="deleteRow"  DataKeyNames="JobID" Width="898px">

                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:TemplateField HeaderText="Job ID" InsertVisible="False" SortExpression="JobID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("JobID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("JobID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Job Title" SortExpression="JobTitle">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtjobtitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pay" SortExpression="Pay">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpay" runat="server" Text='<%# Bind("Pay") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Pay") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pay Type" SortExpression="PayType">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("PayType") %>'>
                                <asp:ListItem>Per Hour</asp:ListItem>
                                <asp:ListItem>Annually</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("PayType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Minimum Age" SortExpression="MinimumAge">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtage" runat="server" Text='<%# Bind("MinimumAge") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("MinimumAge") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Job Type" SortExpression="JobType">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged ="DropDownList2_SelectedIndexChanged" autopostback = "true" SelectedValue='<%# Bind("JobType") %>'>
                                <asp:ListItem>Part-Time</asp:ListItem>
                                <asp:ListItem>Full-Time</asp:ListItem>
                                <asp:ListItem>Internship</asp:ListItem>
                                <asp:ListItem>Volunteer</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("JobType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Job Description" SortExpression="JobDescription">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdesc" runat="server" Text='<%# Bind("JobDescription") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("JobDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Deadline" SortExpression="Deadline">
                        <EditItemTemplate>
                            <asp:TextBox ID="dead" runat="server" Text='<%# Bind("Deadline") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Deadline") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Career Cluster" SortExpression="careercluster">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1" DataTextField="CareerCluster" DataValueField="CareerCluster" SelectedValue='<%# Bind("careercluster") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CuedInDBConnectionString4 %>" SelectCommand="SELECT [CareerCluster] FROM [CareerCluster]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("careercluster") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
                                                <br />
                                                <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Visible="False"></asp:Label>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CuedInDBConnectionString %>" DeleteCommand="DELETE FROM [Job] WHERE [JobID] = @JobID" InsertCommand="INSERT INTO [Job] ([JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [careercluster]) VALUES (@JobTitle, @Pay, @PayType, @MinimumAge, @JobType, @JobDescription, @Deadline, @careercluster)" SelectCommand="SELECT [JobID], [JobTitle], [Pay], [PayType], [MinimumAge], [JobType], [JobDescription], [Deadline], [careercluster] FROM [Job]" UpdateCommand="UPDATE [Job] SET [JobTitle] = @JobTitle, [Pay] = @Pay, [PayType] = @PayType, [MinimumAge] = @MinimumAge, [JobType] = @JobType, [JobDescription] = @JobDescription, [Deadline] = @Deadline, [careercluster] = @careercluster WHERE [JobID] = @JobID">
                <DeleteParameters>
                    <asp:Parameter Name="JobID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="JobTitle" Type="String" />
                    <asp:Parameter Name="Pay" Type="Decimal" />
                    <asp:Parameter Name="PayType" Type="String" />
                    <asp:Parameter Name="MinimumAge" Type="Int32" />
                    <asp:Parameter Name="JobType" Type="String" />
                    <asp:Parameter Name="JobDescription" Type="String" />
                    <asp:Parameter Name="Deadline" Type="DateTime" />
                    <asp:Parameter Name="careercluster" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="JobTitle" Type="String" />
                    <asp:Parameter Name="Pay" Type="Decimal" />
                    <asp:Parameter Name="PayType" Type="String" />
                    <asp:Parameter Name="MinimumAge" Type="Int32" />
                    <asp:Parameter Name="JobType" Type="String" />
                    <asp:Parameter Name="JobDescription" Type="String" />
                    <asp:Parameter Name="Deadline" Type="DateTime" />
                    <asp:Parameter Name="careercluster" Type="String" />
                    <asp:Parameter Name="JobID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
</asp:Content>


