<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Scholarship.aspx.cs" Inherits="Scholarship" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Scholarship Title"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Organization Sponsor"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtSponsor" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Contact Email"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Deadline"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDeadline" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Award Amount"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        </div>
    </form>
</body>
</html>
