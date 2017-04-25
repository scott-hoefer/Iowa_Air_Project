﻿<%@ Page Title="Enter Your Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnterBookingInfo.aspx.cs" Inherits="WebApplication1.EnterBookingInfo" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <div class="form-horizontal">
    <h2>Please Enter Each Passengers Information</h2>

    <div class="form-group">
        <div class="col-md-10">
            <asp:Label runat="server"  ID="lbl1" AssociatedControlID="textbox1" CssClass="col-md-2 control-label" Visible="false">Enter Passenger 1's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox1" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox2" CssClass="col-md-2 control-label" ID="lbl2" Visible="false">Enter Passenger 2's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox2" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox3" CssClass="col-md-2 control-label" ID="lbl3" Visible="false">Enter Passenger 3's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox3" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox4" CssClass="col-md-2 control-label" ID="lbl4" Visible="false">Enter Passenger 4's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox4" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox5" CssClass="col-md-2 control-label" ID="lbl5" Visible="false">Enter Passenger 5's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox5" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox6" CssClass="col-md-2 control-label" ID="lbl6" Visible="false">Enter Passenger 6's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox6" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox7" CssClass="col-md-2 control-label" ID="lbl7" Visible="false">Enter Passenger 7's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox7" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox1\8" CssClass="col-md-2 control-label" ID="lbl8" Visible="false">Enter Passenger 8's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox8" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox9" CssClass="col-md-2 control-label" ID="lbl9" Visible="false">Enter Passenger 9's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox9" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox10" CssClass="col-md-2 control-label" ID="lbl10" Visible="false">Enter Passenger 10's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox10" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox11" CssClass="col-md-2 control-label" ID="lbl11" Visible="false">Enter Passenger 11's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox11" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox12" CssClass="col-md-2 control-label" ID="lbl12" Visible="false">Enter Passenger 12's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox12" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox13" CssClass="col-md-2 control-label" ID="lbl13" Visible="false">Enter Passenger 13's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox13" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox14" CssClass="col-md-2 control-label" ID="lbl14" Visible="false">Enter Passenger 14's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox14" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox15" CssClass="col-md-2 control-label" ID="lbl15" Visible="false">Enter Passenger 15's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox15" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox16" CssClass="col-md-2 control-label" ID="lbl16" Visible="false">Enter Passenger 16's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox16" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox17" CssClass="col-md-2 control-label" ID="lbl17" Visible="false">Enter Passenger 17's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox17" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox18" CssClass="col-md-2 control-label" ID="lbl18" Visible="false">Enter Passenger 18's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox18" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox19" CssClass="col-md-2 control-label" ID="lbl19" Visible="false">Enter Passenger 19's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox19" CssClass="form-control" Visible="false"/><br />
            <asp:Label runat="server" AssociatedControlID="textbox20" CssClass="col-md-2 control-label" ID="lbl20" Visible="false">Enter Passenger20's Name</asp:Label>
            <asp:TextBox runat="server" ID="textbox20" CssClass="form-control" Visible="false"/><br />
        </div>
        <div class="col-md-offset-2 col-md-10">
            <asp:Button runat="server" ID="confirmBtn" OnClick="confirmBtn_Click" Text="Confirm Names" CssClass="btn btn-default" />
    </div>
    </div>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    </form>
</body>
</html>--%>
</asp:Content>
