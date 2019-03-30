<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Applications.aspx.cs" Inherits="Applications" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlGridView" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Current Applications"></asp:Label>
                <br />
                <br />
                <br />
                <asp:GridView ID="grdApplicants" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdApplicants_SelectedIndexChanged">
                </asp:GridView>
                <br />
                <asp:LinkButton ID="linkTest" runat="server" OnClick="linkTest_Click">Export to Excel</asp:LinkButton>
            </asp:Panel>
        </div>
        <asp:Literal ID="ltEmbed" runat="server" />
        <asp:Panel ID="pnlResults" runat="server" Visible="False">
            <asp:Label ID="Label2" runat="server" Text="Application"></asp:Label>
            <br />
            <asp:Table ID="tblInfo" runat="server" Width="124px">
            </asp:Table>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Relevant Files:"></asp:Label>
            <br />
            <asp:GridView ID="grdFiles" runat="server" OnSelectedIndexChanging="btnView_Click" OnRowEditing="btnDownload_Click">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="View"/>
                    <asp:CommandField ShowEditButton="True" EditText="Download"/>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Please set the Application Status"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlStatus" runat="server">
                <asp:ListItem>Reviewed</asp:ListItem>
                <asp:ListItem>Declined</asp:ListItem>
                <asp:ListItem>Approved</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" />
        </asp:Panel>
    </form>
</body>
</html>
