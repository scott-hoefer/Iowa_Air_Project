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

    <div id="ic_to_chi" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d1523651.148189223!2d-90.70113390491301!3d41.76622021808357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2siowa+city+iowa!3m2!1d41.6611277!2d-91.5301683!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2schicago+il!3m2!1d41.8781136!2d-87.6297982!5e0!3m2!1sen!2sus!4v1493671441783" width="600" height="450"style="border:0"></iframe>
    </div>
    <div id="ic_to_ny" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6156729.526917654!2d-87.25830386017546!3d41.107982449517735!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2siowa+city+iowa!3m2!1d41.6611277!2d-91.5301683!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!5e0!3m2!1sen!2sus!4v1493671992722" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="ic_to_atl" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6471431.444520077!2d-92.4505515937918!3d37.62854251103375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2siowa+city+iowa!3m2!1d41.6611277!2d-91.5301683!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!5e0!3m2!1sen!2sus!4v1493672153862" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="ic_to_sf" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d12630586.712926136!2d-115.96925368600792!3d39.38703963847965!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2siowa+city+iowa!3m2!1d41.6611277!2d-91.5301683!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!5e0!3m2!1sen!2sus!4v1493672214501" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="chi_to_ic" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d1523651.148189223!2d-90.701133904913!3d41.76622021808357!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2sIowa+City%2C+IA!3m2!1d41.6611277!2d-91.5301683!5e0!3m2!1sen!2sus!4v1493672447608" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="chi_to_ny" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6146550.892939043!2d-85.30807975433903!3d41.21641905340766!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!5e0!3m2!1sen!2sus!4v1493672595025" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="chi_to_sf" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d12610974.466057293!2d-114.01881056904459!3d39.49527472979033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!5e0!3m2!1sen!2sus!4v1493672667876" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="chi_to_atl" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6461981.551700824!2d-90.50032914363358!3d37.73694023261672!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!5e0!3m2!1sen!2sus!4v1493672745770" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="ny_to_ic" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6156729.526917654!2d-87.25830386017547!3d41.107982449517735!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2sIowa+City%2C+IA!3m2!1d41.6611277!2d-91.5301683!5e0!3m2!1sen!2sus!4v1493672861733" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="ny_to_sf" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d25800361.59997731!2d-116.24307811959726!3d37.87296580628804!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!5e0!3m2!1sen!2sus!4v1493672941690" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="ny_to_chi" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6146550.892939043!2d-85.30807975433899!3d41.21641905340766!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!5e0!3m2!1sen!2sus!4v1493673021136" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="ny_to_atl" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6512459.018419986!2d-83.68860086081011!3d37.154800715772055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!5e0!3m2!1sen!2sus!4v1493673082717" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="sf_to_ic" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d12630586.712926136!2d-115.96925368600797!3d39.38703963847965!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2sIowa+City%2C+IA!3m2!1d41.6611277!2d-91.5301683!5e0!3m2!1sen!2sus!4v1493673191754" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="sf_to_ny" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d25800361.59997731!2d-116.24307811959729!3d37.87296580628804!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!5e0!3m2!1sen!2sus!4v1493673279028" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="sf_to_chi" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d12610974.466057293!2d-114.01881056904459!3d39.49527472979033!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!5e0!3m2!1sen!2sus!4v1493673334863" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="sf_to_atl" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d13313829.43636117!2d-112.40736878958857!3d35.44373551653716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+California!3m2!1d37.7749295!2d-122.4194155!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!5e0!3m2!1sen!2sus!4v1493673397427" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="atl_to_ic" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6471431.444520077!2d-92.45055159379183!3d37.62854251103375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!4m5!1s0x87e441c16a208817%3A0x6d711867870582b0!2sIowa+City%2C+IA!3m2!1d41.6611277!2d-91.5301683!5e0!3m2!1sen!2sus!4v1493673479164" width="600" height="450" style="border:0" ></iframe>
    </div>
    <div id="atl_to_ny" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6512459.018419986!2d-83.68860086081014!3d37.154800715772055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!4m5!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!3m2!1d40.712783699999996!2d-74.0059413!5e0!3m2!1sen!2sus!4v1493673538377" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="atl_to_chi" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d6461981.551700824!2d-90.50032914363355!3d37.73694023261672!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!4m5!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C+IL!3m2!1d41.8781136!2d-87.6297982!5e0!3m2!1sen!2sus!4v1493673679739" width="600" height="450" style="border:0"></iframe>
    </div>
    <div id="atl_to_sf" runat="server" visible="false">
        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d13313829.43636117!2d-112.40736878958857!3d35.44373551653716!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e4!4m5!1s0x88f5045d6993098d%3A0x66fede2f990b630b!2sAtlanta%2C+GA!3m2!1d33.7489954!2d-84.3879824!4m5!1s0x80859a6d00690021%3A0x4a501367f076adff!2sSan+Francisco%2C+CA!3m2!1d37.7749295!2d-122.4194155!5e0!3m2!1sen!2sus!4v1493673779024" width="600" height="450" style="border:0"></iframe>
    </div>


    <div class="text-center" style="padding-bottom:50px">
            <h2>Cheap Flights To Five Different Cities In the US</h2>
            <p>
                Iowa City, Chicago, New York, Atlanta and San Francisco
            </p>
    </div>
    
</asp:Content>
