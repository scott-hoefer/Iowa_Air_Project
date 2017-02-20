<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <img style="margin:0px auto; display:block" src="images/logo_v2.png"/> <br />
        <p class="lead"><em>Iowa's Number One (Fake) Airline Co.</em></p>

        <h1><asp:Label ID="SearchFlights" runat="server" Text="Search Flights"></asp:Label></h1>
        <asp:DropDownList ID="originCity" runat="server" Width="200px">
            <asp:ListItem Text="From" Value="0"></asp:ListItem>
            <asp:ListItem Text="Iowa City" Value="1"></asp:ListItem>
            <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
            <asp:ListItem Text="San Francisco" Value="3"></asp:ListItem>
            <asp:ListItem Text="Atlanta" Value="4"></asp:ListItem>
            <asp:ListItem Text="New York" Value="5"></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="destinationCity" runat="server" Width="200px">
            <asp:ListItem Text="To" Value="0"></asp:ListItem>
            <asp:ListItem Text="Iowa City" Value="1"></asp:ListItem>
            <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
            <asp:ListItem Text="San Francisco" Value="3"></asp:ListItem>
            <asp:ListItem Text="Atlanta" Value="4"></asp:ListItem>
            <asp:ListItem Text="New York" Value="5"></asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="numPassengers" placeholder="Number of Passengers" runat="server" Height="50%"></asp:TextBox><br />
        <asp:Label ID="departLbl" runat="server" AssociatedControlID="departDate" Text="Departure: " />
        <asp:TextBox type="date" ID="departDate" runat="server" Height="50%"></asp:TextBox>
        <asp:Label ID="returnLbl" runat="server" AssociatedControlID="returnDate" Text="Return: " />
        <asp:TextBox type="date" ID="returnDate" placeholder="Return Date" runat="server" Height="50%"></asp:TextBox><br />
        <asp:Button ID="searchBtn" runat="server" Text="Search" />
    </div>
    <div class="text-center">
            <h2>Cheap Flights To Five Different Cities In the US</h2>
            <p>
                Iowa City, Chicago, New York, Atlanta and San Francisco
            </p>
    </div>

</asp:Content>
