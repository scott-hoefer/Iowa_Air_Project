<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingInfo.aspx.cs" Inherits="WebApplication1.BookingInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Enter Passenger Names</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>Please Enter The Names Of Each Passenger</h2>
    <div>
    <button id="confirmBtn" runat="server" onclick="confirm_Click()">Confirm Names</button>
    </div>
    </form>
</body>
</html>
