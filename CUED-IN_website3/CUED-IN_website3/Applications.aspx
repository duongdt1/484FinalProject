<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Applications.aspx.cs" Inherits="Applications" %>

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
                <asp:GridView ID="grdApplicants" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdApplicants_SelectedIndexChanged">
                </asp:GridView>
            </asp:Panel>
        </div>
        <asp:Panel ID="pnlResults" runat="server">
            <asp:Label ID="Label2" runat="server" Text="Application"></asp:Label>
            <br />
            <asp:Table ID="tblInfo" runat="server" Width="124px">
            </asp:Table>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </asp:Panel>
    </form>
</body>
</html>
