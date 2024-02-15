<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="JobPortal.ManageUser" %>
<%@ Register TagName="ManageUser_Admin" TagPrefix="uc1" Src="~/Content/Admin/ManageUser_Admin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ManageUser_Admin id="ManageUser_Admin1" runat="server"></uc1:ManageUser_Admin>
</asp:Content>
