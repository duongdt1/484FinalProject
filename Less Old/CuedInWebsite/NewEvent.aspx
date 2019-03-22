<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewEvent.aspx.cs" Inherits="NewEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Event</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            New Event

            <br />
            <br />
            Date<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>


            <br />
            Event Type&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Associated School&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>


            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Save" />


            &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancel" />


        </div>
    </form>
</body>
</html>
