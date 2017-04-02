<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <style type="text/css">
            body
            {
                background-image: url(images/cornAndSky.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </div>
    <style type="text/css">
        body 
        {
            padding: 30px;
            margin-bottom: 30px;
            margin-top: 75px;
            font-size: 21px;
            font-weight: 200;
            line-height: normal;
            text-align: center;
        }
    </style>
    <div>
        
        <p class="lead" style="color:whitesmoke"><em>Iowa's Number One (Fake) Airline Co.</em></p>

        <h1><asp:Label ID="SearchFlights" runat="server" Text="<u>Your Destination Awaits</u>" ForeColor="#000000"></asp:Label></h1><br />
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
        <asp:TextBox ID="numPassengers" placeholder="Number of Passengers" runat="server" Height="50%"></asp:TextBox><br /><br />
        <asp:Label ID="departLbl" runat="server" AssociatedControlID="departDate" Text="Departure: " />
        <asp:TextBox type="date" ID="departDate" runat="server" Height="50%"></asp:TextBox>
        <asp:Label ID="returnLbl" runat="server" AssociatedControlID="returnDate" Text="Return: " />
        <asp:TextBox type="date" ID="returnDate" placeholder="Return Date" runat="server" Height="50%"></asp:TextBox><br /><br />
        <asp:Button ID="searchBtn" runat="server" Text="Search Flights" />
    </div>
    <br />
    <br />
    <div class="text-center">
            <h2>Cheap Flights To Five Different Cities In the US</h2>
            <p>
                Iowa City, Chicago, New York, Atlanta and San Francisco
            </p>
    </div>
    
</asp:Content>
