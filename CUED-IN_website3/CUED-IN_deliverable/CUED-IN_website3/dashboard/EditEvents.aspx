<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard/CUEDINMaster.master" AutoEventWireup="true" CodeFile="EditEvents.aspx.cs" Inherits="EditEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="page-wrapper" >
            <div id="page-inner">
			 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            Edit Events <small></small>
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
            
 <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                        <asp:BoundField DataField="SchoolID" HeaderText="SchoolID" SortExpression="SchoolID" />
                        <asp:BoundField DataField="EventType" HeaderText="EventType" SortExpression="EventType" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:connection %>" DeleteCommand="DELETE FROM [Event] WHERE [EventID] = @original_EventID AND [SchoolID] = @original_SchoolID AND [EventType] = @original_EventType AND [Date] = @original_Date" InsertCommand="INSERT INTO [Event] ([SchoolID], [EventType], [Date]) VALUES (@SchoolID, @EventType, @Date)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [EventID], [SchoolID], [EventType], [Date] FROM [Event]" UpdateCommand="UPDATE [Event] SET [SchoolID] = @SchoolID, [EventType] = @EventType, [Date] = @Date WHERE [EventID] = @original_EventID AND [SchoolID] = @original_SchoolID AND [EventType] = @original_EventType AND [Date] = @original_Date">
                    <DeleteParameters>
                        <asp:Parameter Name="original_EventID" Type="Int32" />
                        <asp:Parameter Name="original_SchoolID" Type="Int32" />
                        <asp:Parameter Name="original_EventType" Type="String" />
                        <asp:Parameter Name="original_Date" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SchoolID" Type="Int32" />
                        <asp:Parameter Name="EventType" Type="String" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SchoolID" Type="Int32" />
                        <asp:Parameter Name="EventType" Type="String" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="original_EventID" Type="Int32" />
                        <asp:Parameter Name="original_SchoolID" Type="Int32" />
                        <asp:Parameter Name="original_EventType" Type="String" />
                        <asp:Parameter Name="original_Date" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
           
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

