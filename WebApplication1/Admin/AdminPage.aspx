<%@ Page Title="Administrative Options" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="WebApplication1.Admin.AdminPage1" %>
<asp:Content ID="AdminPage" ContentPlaceHolderID="MainContent" runat="server">
        <h1><%: Title %>.</h1>
    
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
                    CssClass="text-danger" ErrorMessage="The email field is required." />
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
                <asp:Label ID="addSuccessful" runat="server" AssociatedControlId="addAircraftBtn" Text="Aircraft Successfully Added To Fleet" ForeColor="Red" Visible="false"></asp:Label>
                <asp:Button ID="addAircraftBtn" runat="server" Text="Add Aircraft" OnClick="addAircraft_Click" CausesValidation="false" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
</asp:Content>
