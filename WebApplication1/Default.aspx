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
            font-weight: 200;
            line-height: normal;
            text-align: center;
        }
    </style>
    <div>
        
        <p class="lead" style="color:whitesmoke"><em>Iowa's Number One (Fake) Airline Co.</em></p>

        <div>
             <asp:Label ID="searchResultsLbl" runat="server" Visible="false" AssociatedControlID="searchResultsGrd" >Search Results</asp:Label>
                 <asp:GridView ID="searchResultsGrd" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" Visible="false" HorizontalAlign="Center" AutoGenerateSelectButton="True" OnSelectedIndexChanged="searchResultsGrd_SelectedIndexChanged">
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
        <br />
        <div>
        <asp:Label ID="returnFlightGrdLbl" runat="server" Visible="false" AssociatedControlID="returnFlightGrd" >Return Flights</asp:Label>
            <asp:GridView ID="returnFlightGrd" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" Visible="false" HorizontalAlign="Center" AutoGenerateSelectButton="True" OnSelectedIndexChanged="returnFlightGrd_SelectedIndexChanged">
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

        <h1><asp:Label ID="SearchFlights" runat="server" Text="<u>Your Destination Awaits</u>" ForeColor="#000000"></asp:Label></h1><br />
        <asp:Label ID="warningLbl" runat="server" Text="<u>Origin City must be Different than Destination</u>" ForeColor="Red" Visible="false"></asp:Label><br />
        <asp:Label ID="noDepartDateLbl" runat="server" Text="<u>Must Select a Departure Date</u>" ForeColor="Red" Visible="false"></asp:Label><br />
        <asp:DropDownList ID="originCity" runat="server" Width="200px" Height="30px">
            <asp:ListItem Text="From" Value="0"></asp:ListItem>
            <asp:ListItem Text="Iowa City" Value="1"></asp:ListItem>
            <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
            <asp:ListItem Text="San Francisco" Value="3"></asp:ListItem>
            <asp:ListItem Text="Atlanta" Value="4"></asp:ListItem>
            <asp:ListItem Text="New York" Value="5"></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="destinationCity" runat="server" Width="200px" Height="30px">
            <asp:ListItem Text="To" Value="0"></asp:ListItem>
            <asp:ListItem Text="Iowa City" Value="1"></asp:ListItem>
            <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
            <asp:ListItem Text="San Francisco" Value="3"></asp:ListItem>
            <asp:ListItem Text="Atlanta" Value="4"></asp:ListItem>
            <asp:ListItem Text="New York" Value="5"></asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="numPassengers" placeholder="Number of Passengers" runat="server" Height="30px"></asp:TextBox><br /><br />
        <asp:Label ID="Label1" runat="server" Text="<u>Leave Return Date Empty for One Way Flights</u>" ForeColor="Black" Font-Size="Medium"></asp:Label><br /><br />
        <asp:Label ID="departLbl" runat="server" AssociatedControlID="departDate" Text="Departure: " />
        <asp:TextBox type="date" ID="departDate" runat="server" Height="30px"></asp:TextBox>
        <asp:Label ID="returnLbl" runat="server" AssociatedControlID="returnDate" Text="Return: " />
        <asp:TextBox type="date" ID="returnDate" placeholder="Return Date" runat="server" Height="30px"></asp:TextBox><br /><br />
        <asp:Button ID="searchBtn" runat="server" Text="Search Flights" CssClass="btn btn-default" OnClick="searchBtn_Click"/>
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
