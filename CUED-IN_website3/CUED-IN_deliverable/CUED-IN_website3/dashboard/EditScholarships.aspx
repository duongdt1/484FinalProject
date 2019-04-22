<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="EditScholarships.aspx.cs" Inherits="EditScholarships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Edit Scholarships<small></small>
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
            
        <div>
            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ScholarshipID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ScholarshipID" HeaderText="ScholarshipID" InsertVisible="False" ReadOnly="True" SortExpression="ScholarshipID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Sponsor" HeaderText="Sponsor" SortExpression="Sponsor" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:#.00}" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Deadline" HeaderText="Deadline" SortExpression="Deadline" DataFormatString='{0:d}' />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connection %>" DeleteCommand="DELETE FROM [Scholarship] WHERE [ScholarshipID] = @original_ScholarshipID AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([Sponsor] = @original_Sponsor) OR ([Sponsor] IS NULL AND @original_Sponsor IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Amount] = @original_Amount AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Deadline] = @original_Deadline) OR ([Deadline] IS NULL AND @original_Deadline IS NULL))" InsertCommand="INSERT INTO [Scholarship] ([Title], [Sponsor], [Description], [Amount], [Email], [Deadline]) VALUES (@Title, @Sponsor, @Description, @Amount, @Email, @Deadline)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ScholarshipID], [Title], [Sponsor], [Description], [Amount], [Email], [Deadline] FROM [Scholarship]" UpdateCommand="UPDATE [Scholarship] SET [Title] = @Title, [Sponsor] = @Sponsor, [Description] = @Description, [Amount] = @Amount, [Email] = @Email, [Deadline] = @Deadline WHERE [ScholarshipID] = @original_ScholarshipID AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([Sponsor] = @original_Sponsor) OR ([Sponsor] IS NULL AND @original_Sponsor IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND [Amount] = @original_Amount AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Deadline] = @original_Deadline) OR ([Deadline] IS NULL AND @original_Deadline IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ScholarshipID" Type="Int32" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_Sponsor" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                        <asp:Parameter Name="original_Amount" Type="Decimal" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Deadline" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Sponsor" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Amount" Type="Decimal" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Sponsor" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Amount" Type="Decimal" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Deadline" Type="DateTime" />
                        <asp:Parameter Name="original_ScholarshipID" Type="Int32" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_Sponsor" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                        <asp:Parameter Name="original_Amount" Type="Decimal" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_Deadline" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            

            <br />
            <br />
            


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
			<footer><p>
                
                </p></footer>
			</div>
             <!-- /. PAGE INNER  -->
            </div>

</asp:Content>

