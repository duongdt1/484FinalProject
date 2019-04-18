<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Profile" Width="150px"></asp:Label>
                <asp:LinkButton ID="btnEditOrg" runat="server" OnClick="btnEditOrg_Click">Edit</asp:LinkButton>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Organization Name"></asp:Label>
                <br />
                <asp:Label ID="lblOrgName" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="txtOrgName" runat="server" Visible="False"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Organization Type"></asp:Label>
                <br />
                <asp:Label ID="lblOrgType" runat="server" Text="Label"></asp:Label>
                <asp:RadioButtonList ID="radOrgType" runat="server" Visible="False">
                    <asp:ListItem>Profit</asp:ListItem>
                    <asp:ListItem>Non-Profit</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Primary Career Cluster"></asp:Label>
                <br />
                <asp:Label ID="lblCareerCluster" runat="server" Text="lblCareerCluster"></asp:Label>
                <asp:ListBox ID="lstCareerCluster" runat="server" Visible="False"></asp:ListBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Phone Number"></asp:Label>
                <br />
                <asp:Label ID="lblOrgPhoneNumber" runat="server" Text="lblOrgPhoneNumber"></asp:Label>
                <br />
                <asp:TextBox ID="txtOrgPhone" runat="server" Visible="False"></asp:TextBox>
            </asp:Panel>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Label ID="Label8" runat="server" Text="User Information" Width="150px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:LinkButton ID="btnEditPassword" runat="server" OnClick="btnEditPassword_Click">Change Password</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblPass" runat="server" Text="Enter Password" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtPass" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="lblPassConfirm" runat="server" Text="Re-enter Password" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtPassConfirm" runat="server" Visible="False"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label10" runat="server" Text="Notifications"></asp:Label>
            <br />
            <asp:RadioButtonList ID="radNotifications" runat="server">
                <asp:ListItem>Enabled</asp:ListItem>
                <asp:ListItem>Disabled</asp:ListItem>
            </asp:RadioButtonList>
        </asp:Panel>
    </form>
</body>
</html>
