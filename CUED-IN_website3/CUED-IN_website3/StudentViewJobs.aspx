<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentViewJobs.aspx.cs" Inherits="StudentViewJobs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Current Job Listings"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="grdJobList" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="" >
                        <ItemTemplate>
                        <asp:Button ID="Btn1" runat="server" 
                            Text="Quick Apply" CommandArgument="Button1"
                            OnClick="grdJobList_SelectedIndexChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
