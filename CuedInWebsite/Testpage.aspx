<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Testpage.aspx.cs" Inherits="Testpage" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MultiSelect DropDownList with CheckBoxes in ASP.Net</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="h2">Bootstrap Muli-Select Drop-Down List With The Checkbox Using JQuery</h1>
            <br>
            <asp:ListBox ID="lstStudents" CssClass="dropdown dropdown-menu" runat="server" SelectionMode="Multiple">
                <asp:ListItem Text="Nikunj Satasiya" Value="1" />
                <asp:ListItem Text="Ronak Rabadiya" Value="2" />
                <asp:ListItem Text="Hiren Dobariya" Value="3" />
                <asp:ListItem Text="Vivek Ghadiya" Value="4" />
                <asp:ListItem Text="Pratik Pansuriya" Value="5" />
                <asp:ListItem Text="Kishan Patel" Value="6" />
            </asp:ListBox>
            <div>
                <br>
                <asp:Button Text="Submit Students" CssClass="btn btn-default btn-success" runat="server" OnClick="Submit" />
            </div>
            <br>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $('[id*=lstStudents]').multiselect
            ({
                includeSelectAllOption: true,
                nonSelectedText: 'Select Students' // Here you can change with your desired text as per your requirement.
            });
        });
    </script>
</body>
</html>