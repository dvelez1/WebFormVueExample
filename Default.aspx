<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormVueExample._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 

    <div class="jumbotron">
        <h1>VUE Examples for ASP.NET</h1>
        <p class="lead">In this presentation we will provide multiple practical examples of how to complement an ASP.NET development with Vue 3. 
        </p>
        <p><a href="https://vuejs.org/" class="btn btn-primary btn-lg">Learn more about Vue &raquo;</a></p>
        <asp:Button ID="Success" runat="server" OnClick="Success_Click" Text="Success!" />
        <asp:Button ID="Warning" runat="server" OnClick="Warning_Click"  Text="Warning!" />
        <asp:Button ID="Error" runat="server" OnClick="Error_Click"  Text="Error!" />
        <asp:Button ID="Info" runat="server" OnClick="Info_Click" Text="Info!" />
    </div>

  
</asp:Content>
