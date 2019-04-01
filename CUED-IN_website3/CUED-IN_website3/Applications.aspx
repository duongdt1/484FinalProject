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
                <asp:Button ID="btnReturnToJob" runat="server" OnClick="btnReturnToJob_Click" Text="Return to Job List" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Current Applications"></asp:Label>
                <br />
                <br />
                <br />
                <asp:GridView ID="grdApplicants" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanging="grdApplicants_SelectedIndexChanged" >
                    
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
            <asp:Label ID="lblRelevantFiles" runat="server" Text="Relevant Files:"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblResume" runat="server" Text="Resume:"></asp:Label>
            <asp:Button ID="btnViewResume" runat="server" OnClick="btnViewResume_Click" Text="View" />
            <asp:Button ID="btnDownloadResume" runat="server" OnClick="btnDownloadResume_Click" Text="Download" />
            <br />
            <br />
            <asp:Label ID="lblTranscript" runat="server" Text="Transcript:"></asp:Label>
            <asp:Button ID="btnViewTranscript" runat="server" OnClick="btnViewTranscript_Click" Text="View" />
            <asp:Button ID="btnDownloadTranscript" runat="server" OnClick="btnDownloadTranscript_Click" Text="Download" />
            &nbsp;<br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Please set the Application Status"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlStatus" runat="server" >
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
