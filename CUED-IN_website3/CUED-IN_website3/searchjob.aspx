<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchjob.aspx.cs" Inherits="searchjob" %>
<!dOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
            <br />
            <asp:GridView ID="GridViewSearch" runat="server" AutoGenerateColumns="False" OnRowEditing="searchEdit" OnRowCancelingEdit="cancelEdit" OnRowUpdating ="searchUpdate" OnRowDeleting ="deleteRow"  DataKeyNames="JobID" Width="898px">
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
            </asp:GridView>
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
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
