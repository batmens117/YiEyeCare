<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmedBooking.aspx.cs" Inherits="ConfirmedBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    
        Booking confirmed! Check your email!<br />
        <br />
        <asp:Button ID="DoneButton" class="btn btn-default" runat="server" OnClick="DoneButton_Click" Text="Done" />
    
    </div>
    </form>
</body>
</html>
