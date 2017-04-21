<%@ Page Title="Administrative Options" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="WebApplication1.Admin.AdminPage1" %>
<asp:Content ID="AdminPage" ContentPlaceHolderID="MainContent" runat="server">



        <h1>Administrative Options.</h1>
    
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    
    
    <div class="form-horizontal">
        <hr />
        <h4>Add New Employee</h4>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EmployeeEmail" CssClass="col-md-2 control-label">Employee Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="EmployeeEmail" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="EmployeeEmail"
                    CssClass="text-danger" ErrorMessage="The email field is required." ValidationGroup="email"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Label ID="emailSentConfirmation" runat="server" Text="Employee Registration Email Sent" ForeColor="Red" Visible="false"></asp:Label>
                <br />
                <asp:Button runat="server" ID="newEmpBtn" OnClick="SendEmployeeLink_Click" Text="Send Employee Registration Link" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
    <br />
    <hr />
    <div class="form-horizontal">
        <div class="form-group">
            <h4>Add a New Aircraft To the Fleet</h4>
            <asp:Label ID="noSelection" runat="server" Text="Must Select an Aircraft from the Drop Down List" ForeColor="Red" Visible="false"></asp:Label>
            <asp:Label runat="server" AssociatedControlID="addAircraft" CssClass="col-md-2 control-label">Select Aircraft Type</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="addAircraft" runat="server" Width="200px" CssClass="form-control">
                <asp:ListItem Text="" Value="0"></asp:ListItem>
                <asp:ListItem Text="Boeing 777 - 200 v3" Value="1" ></asp:ListItem>
                <asp:ListItem Text="Boeing 767 - 300 v1" Value="2"></asp:ListItem>
                <asp:ListItem Text="Airbus 380 - 800 2Class" Value="3"></asp:ListItem>
                <asp:ListItem Text="Boeing 747 - 400" Value="4"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Label ID="addSuccessful" runat="server" AssociatedControlId="addAircraftBtn" Text="Aircraft Successfully Added To Fleet" ForeColor="Red" Visible="false"></asp:Label><br />
                <asp:Button ID="addAircraftBtn" runat="server" Text="Add Aircraft" OnClick="addAircraft_Click" CausesValidation="false" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
    <br />
    <hr />

    <div class="form-horizontal">
        <div class="form-group">
            <h4>Remove an Aircraft from the Fleet</h4>
            <asp:Label ID="noSelectionDel" runat="server" Text="Must Select an Aircraft from the Drop Down List" ForeColor="Red" Visible="false"></asp:Label>
            <asp:Label runat="server" AssociatedControlID="delAircraft" CssClass="col-md-2 control-label">Select Idol Aircraft to Delete</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="delAircraft" runat="server" Width="200px" CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Label ID="delSuccessful" runat="server" AssociatedControlId="delAircraftBtn" Text="Aircraft Successfully Deleted from Fleet" ForeColor="Red" Visible="false"></asp:Label><br />
                <asp:Button ID="delAircraftBtn" runat="server" Text="Delete Aircraft" OnClick="delAircraft_Click" CausesValidation="false" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
    <br />
    <hr />

    <div class="form-horizontal">
        <div class="form-group">
            <h4>Add a Route</h4>
            <asp:Label runat="server" AssociatedControlID="originCity" CssClass="col-md-2 control-label">Route Origin</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="originCity" runat="server" Width="200px" CssClass="form-control">
                <asp:ListItem Text="" Value="0"></asp:ListItem>
                <asp:ListItem Text="Iowa City" Value="1" ></asp:ListItem>
                <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
                <asp:ListItem Text="Atlanta" Value="3"></asp:ListItem>
                <asp:ListItem Text="San Francisco" Value="4"></asp:ListItem>
                <asp:ListItem Text="New York" Value="5"></asp:ListItem>
                </asp:DropDownList><br />
            </div>

            <asp:Label runat="server" AssociatedControlID="layoverCity" CssClass="col-md-2 control-label">Optional Layover City</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="layoverCity" runat="server" Width="200px" CssClass="form-control">
                <asp:ListItem Text="" Value="0"></asp:ListItem>
                <asp:ListItem Text="Iowa City" Value="1" ></asp:ListItem>
                <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
                <asp:ListItem Text="Atlanta" Value="3"></asp:ListItem>
                <asp:ListItem Text="San Francisco" Value="4"></asp:ListItem>
                <asp:ListItem Text="New York" Value="5"></asp:ListItem>
                </asp:DropDownList><br />
            </div>

            <asp:Label runat="server" AssociatedControlID="destinationCity" CssClass="col-md-2 control-label">Final Destination</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="destinationCity" runat="server" Width="200px" CssClass="form-control">
                <asp:ListItem Text="" Value="0"></asp:ListItem>
                <asp:ListItem Text="Iowa City" Value="1" ></asp:ListItem>
                <asp:ListItem Text="Chicago" Value="2"></asp:ListItem>
                <asp:ListItem Text="Atlanta" Value="3"></asp:ListItem>
                <asp:ListItem Text="San Francisco" Value="4"></asp:ListItem>
                <asp:ListItem Text="New York" Value="5"></asp:ListItem>
                </asp:DropDownList><br />
            </div>

            <asp:Label runat="server" AssociatedControlID="routeAircraft" CssClass="col-md-2 control-label">Select Idol Aircraft</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="routeAircraft" runat="server" Width="200px" CssClass="form-control">
                </asp:DropDownList><br />
            </div>

            <asp:Label runat="server" AssociatedControlID="frequency" CssClass="col-md-2 control-label">Frequency: Every</asp:Label>
            <div class="col-md-10">
                <asp:CheckBoxList ID="frequency" runat="server" CssClass="form-control" Width="200px" Height="200px" RepeatLayout="Flow">
                    <asp:ListItem Text="Monday" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Tuesday" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Wednesday" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Thursday" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Friday" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Saturday" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Sunday" Value="6"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="priceFCTxtBox" CssClass="col-md-2 control-label">Price First Class</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="priceFCTxtBox" CssClass="form-control" Width="200px" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="priceEconTxtBox" CssClass="col-md-2 control-label">Price Economy</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="priceEconTxtBox" CssClass="form-control" Width="200px" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="departTimeTxtBox" CssClass="col-md-2 control-label">Departure Time</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="departTimeTxtBox" CssClass="form-control" Width="200px" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="layoverTimeTxtBox" CssClass="col-md-2 control-label">Layover Time: Arrive & Depart</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="layoverTimeTxtBox" CssClass="form-control" Width="200px" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="arrivalTimeTxtBox" CssClass="col-md-2 control-label">Arrival Time</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="arrivalTimeTxtBox" CssClass="form-control" Width="200px" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Label ID="routeSuccessful" runat="server" AssociatedControlId="addRouteBtn" Text="Route Successfully" ForeColor="Red" Visible="false"></asp:Label><br />
                <asp:Button ID="addRouteBtn" runat="server" Text="Add Route" OnClick="addRoute_Click" CausesValidation="false" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
    <br />
    <hr />

    <div class="form-horizontal">
        <div class="form-group">
            <h4>Update Routes</h4>
        </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IowaAirDB %>" DeleteCommand="DELETE FROM [Routes] WHERE [FlightId] = @FlightId" InsertCommand="INSERT INTO [Routes] ([AircraftId], [Origin], [Layover], [Destination], [M], [T], [W], [TH], [F], [SA], [SU], [PriceFC], [PriceEcon], [DepartTime], [LayoverTime], [ArrivalTime], [SeatsTakenFC], [SeatsTakenEcon]) VALUES (@AircraftId, @Origin, @Layover, @Destination, @M, @T, @W, @TH, @F, @SA, @SU, @PriceFC, @PriceEcon, @DepartTime, @LayoverTime, @ArrivalTime, @SeatsTakenFC, @SeatsTakenEcon)" SelectCommand="SELECT * FROM [Routes]" UpdateCommand="UPDATE [Routes] SET [Origin] = @Origin, [Layover] = @Layover, [Destination] = @Destination, [M] = @M, [T] = @T, [W] = @W, [TH] = @TH, [F] = @F, [SA] = @SA, [SU] = @SU, [PriceFC] = @PriceFC, [PriceEcon] = @PriceEcon  [DepartTime] = @DepartTime, [LayoverTime] = @LayoverTime, [ArrivalTime] = @ArrivalTime, [SeatsTakenFC] = @SeatsTakenFC, [SeatsTakenEcon] = @SeatsTakenEcon WHERE [FlightId] = @FlightId">
                <DeleteParameters>
                    <asp:Parameter Name="FlightId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AircraftId" Type="Int32" />
                    <asp:Parameter Name="Origin" Type="String" />
                    <asp:Parameter Name="Layover" Type="String" />
                    <asp:Parameter Name="Destination" Type="String" />
                    <asp:Parameter Name="M" Type="Boolean" />
                    <asp:Parameter Name="T" Type="Boolean" />
                    <asp:Parameter Name="W" Type="Boolean" />
                    <asp:Parameter Name="TH" Type="Boolean" />
                    <asp:Parameter Name="F" Type="Boolean" />
                    <asp:Parameter Name="SA" Type="Boolean" />
                    <asp:Parameter Name="SU" Type="Boolean" />
                    <asp:Parameter Name="PriceFC" Type="Int32" />
                    <asp:Parameter Name="PriceEcon" Type="Int32" />
                    <asp:Parameter Name="DepartTime" Type="String" />
                    <asp:Parameter Name="LayoverTime" Type="String" />
                    <asp:Parameter Name="ArrivalTime" Type="String" />
                    <asp:Parameter Name="SeatsTakenFC" Type="Int32" />
                    <asp:Parameter Name="SeatsTakenEcon" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AircraftId" Type="Int32" />
                    <asp:Parameter Name="Origin" Type="String" />
                    <asp:Parameter Name="Layover" Type="String" />
                    <asp:Parameter Name="Destination" Type="String" />
                    <asp:Parameter Name="M" Type="Boolean" />
                    <asp:Parameter Name="T" Type="Boolean" />
                    <asp:Parameter Name="W" Type="Boolean" />
                    <asp:Parameter Name="TH" Type="Boolean" />
                    <asp:Parameter Name="F" Type="Boolean" />
                    <asp:Parameter Name="SA" Type="Boolean" />
                    <asp:Parameter Name="SU" Type="Boolean" />
                    <asp:Parameter Name="PriceFC" Type="Int32" />
                    <asp:Parameter Name="PriceEcon" Type="Int32" />
                    <asp:Parameter Name="DepartTime" Type="String" />
                    <asp:Parameter Name="LayoverTime" Type="String" />
                    <asp:Parameter Name="ArrivalTime" Type="String" />
                    <asp:Parameter Name="SeatsTakenFC" Type="Int32" />
                    <asp:Parameter Name="SeatsTakenEcon" Type="Int32" />
                    <asp:Parameter Name="FlightId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="routesGridView" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="OnPaging" AutoGenerateEditButton="True" DataKeyNames="FlightId" DataSourceID="SqlDataSource1" CssClass="GridView" AutoGenerateDeleteButton="True">
            <Columns>
                <asp:BoundField ItemStyle-Width="150px" DataField="FlightId" HeaderText="FlightId" InsertVisible="False" ReadOnly="True" SortExpression="FlightId" />
                <asp:BoundField ItemStyle-Width="150px" DataField="AircraftId" HeaderText="AircraftId" InsertVisible="false" ReadOnly="true" SortExpression="AircraftId" />
                <asp:BoundField ItemStyle-Width="150px" DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
                <asp:BoundField ItemStyle-Width="150px" DataField="Layover" HeaderText="Layover" SortExpression="Layover" />
                <asp:BoundField ItemStyle-Width="150px" DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                <asp:CheckBoxField DataField="M" HeaderText="M" SortExpression="M" />
                <asp:CheckBoxField DataField="T" HeaderText="T" SortExpression="T" />
                <asp:CheckBoxField DataField="W" HeaderText="W" SortExpression="W" />
                <asp:CheckBoxField DataField="TH" HeaderText="TH" SortExpression="TH" />
                <asp:CheckBoxField DataField="F" HeaderText="F" SortExpression="F" />
                <asp:CheckBoxField DataField="SA" HeaderText="SA" SortExpression="SA" />
                <asp:CheckBoxField DataField="SU" HeaderText="SU" SortExpression="SU" />
                <asp:BoundField ItemStyle-Width="150px" DataField="PriceFC" HeaderText="Price First Class" SortExpression="PriceFC" />
                <asp:BoundField ItemStyle-Width="150px" DataField="PriceEcon" HeaderText="Price Economy" SortExpression="PriceEcon" />
                <asp:BoundField ItemStyle-Width="150px" DataField="DepartTime" HeaderText="DepartTime" SortExpression="DepartTime" />
                <asp:BoundField ItemStyle-Width="150px" DataField="LayoverTime" HeaderText="LayoverTime" SortExpression="LayoverTime" />
                <asp:BoundField ItemStyle-Width="150px" DataField="ArrivalTime" HeaderText="ArrivalTime" SortExpression="ArrivalTime" />
                <asp:BoundField ItemStyle-Width="150px" DataField="SeatsTakenFC" HeaderText="SeatsTakenFC" SortExpression="SeatsTakenFC" />
                <asp:BoundField ItemStyle-Width="150px" DataField="SeatsTakenEcon" HeaderText="SeatsTakenEcon" SortExpression="SeatsTakenEcon" />
            </Columns>
            </asp:GridView>
    <br />
    <hr />
    </div>
</asp:Content>
