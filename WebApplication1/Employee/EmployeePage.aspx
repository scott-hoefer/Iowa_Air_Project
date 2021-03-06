﻿<%@ Page Title="Employee Portal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeePage.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %>.</h1>
    <h3>Passenger Check In</h3>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="searchPassTxt" CssClass="col-md-2 control-label">Search for Passenger</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="searchPassTxt" CssClass="form-control" Width="200px" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="searchPassBtn" runat="server" Text="Find Passenger" CausesValidation="false" CssClass="btn btn-default" OnClick="searchPassBtn_Click"/>
            </div>
        </div>
        <div>
            <asp:Label runat="server" ID="warningLbl3" Font-Size="Larger" Visible="false" ForeColor="Red">Reservation Not Found</asp:Label><br />
            <asp:Label ID="searchPassGrdLbl" runat="server" Visible="false" AssociatedControlID="searchPassGrd" >Passengers Booked Flights</asp:Label>
            <asp:GridView ID="searchPassGrd" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" Visible="False" HorizontalAlign="Center" AutoGenerateSelectButton="True" OnSelectedIndexChanged="searchPassGrd_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"  HorizontalAlign="Center"/>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB"/>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        </div>
        <hr />
        <div class="form-group">
            <div class="col-md-10">
                <asp:Label runat="server" ID="warningLbl" Font-Size="Larger" Visible="false" ForeColor="Red">Must Fill Out Each Textbox</asp:Label><br />

                <asp:Label runat="server" ID="flightIdTxtLbl" AssociatedControlID="flightIdTxt" CssClass="col-md-2 control-label" Visible="false">Enter Flight Number</asp:Label>
                <asp:TextBox runat="server" ID="flightIdTxt" CssClass="form-control" Width="100px" Visible="false"/><br />
                <asp:Label runat="server" ID="checkedLbl" AssociatedControlID="checkedTxtbox" CssClass="col-md-2 control-label" Visible="false">Number Of Checked Bags</asp:Label>
                <asp:TextBox runat="server" ID="checkedTxtbox" CssClass="form-control" Width="100px" Visible="false"/><br />
                <asp:Label runat="server" ID="carryOnLbl" AssociatedControlID="carryOnTxtbox" CssClass="col-md-2 control-label" Visible="false">Number Of Carry On Items</asp:Label>
                <asp:TextBox runat="server" ID="carryOnTxtbox" CssClass="form-control" Width="100px" Visible="false"/><br />
                <asp:Label runat="server" ID="seatLbl" AssociatedControlID="seatTxtbox" CssClass="col-md-2 control-label" Visible="false">Assign Seat Number</asp:Label>
                <asp:TextBox runat="server" ID="seatTxtbox" CssClass="form-control" Width="100px" Visible="false"/><br />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="checkInBtn" runat="server" Text="Get Boarding Pass" CausesValidation="false" CssClass="btn btn-default" OnClick="checkInBtn_Click" Visible="false"/>
            </div>
        </div>
    <hr />
    <h3>Cancel A Flight</h3>
    <asp:Label runat="server" ID="warningLbl2" Font-Size="Larger" Visible="false" ForeColor="Red">Invalid Flight ID</asp:Label><br />
    <div class="form-group">
        <div class="col-md-10">
            <asp:Label runat="server" ID="cancelLbl" AssociatedControlID="cancelTxt" CssClass="col-md-2 control-label" Visible="false">Enter Reservation Number</asp:Label>
            <asp:TextBox runat="server" ID="cancelTxt" CssClass="form-control" Width="100px" Visible="false"/><br />
        </div>
        <div class="col-md-offset-2 col-md-10">
            <asp:Button ID="cancelBtn" runat="server" Text="Cancel Reservation" CausesValidation="false" CssClass="btn btn-default" OnClick="cancelBtn_Click" Visible="false"/>
        </div>
    </div>

    </div>
    
</asp:Content>
