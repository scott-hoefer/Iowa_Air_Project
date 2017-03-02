<%@ Page Title="Employee Portal" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeePage.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1><%: Title %>.</h1>
    <h3>This will be our employee portal, only accessible by users with Employee or Admin privileges</h3>
    
</asp:Content>
