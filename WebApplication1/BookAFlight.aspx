<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookAFlight.aspx.cs" Inherits="WebApplication1.BookAFlight" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
<div style="display: block; text-align: center; font-size:xx-large; padding-top:30px" >Book Your Next Adventure Now </div>
<div>
    <asp:Label ID="bookingLbl" runat="server" Visible="false" AssociatedControlID="bookFlightGrd" >Book Flight</asp:Label>
    <asp:GridView ID="bookFlightGrd" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" Visible="true" HorizontalAlign="Center">
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

    <asp:Label ID="returnFlightGrdLbl" runat="server" Visible="false" AssociatedControlID="returnFlightGrd" >Selected Return Flight</asp:Label>
    <div style="display: block; text-align: center; font-size:larger; padding-top:10px" >Selected Return Flight</div>
    <asp:GridView ID="returnFlightGrd" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" Visible="true" HorizontalAlign="Center">
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


        
    <asp:Button ID="bookBtn" runat="server" Text="Book Flight" CssClass="btn btn-default" OnClick="bookBtn_Click" />
    </div>
</asp:Content>
