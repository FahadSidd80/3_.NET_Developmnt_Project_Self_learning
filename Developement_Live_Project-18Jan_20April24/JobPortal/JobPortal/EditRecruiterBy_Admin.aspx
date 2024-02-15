<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="EditRecruiterBy_Admin.aspx.cs" Inherits="JobPortal.EditRecruiterBy_Admin" %>
<%@ Register TagName="EditrecruiterAdmin_1" TagPrefix="uc1" Src="~/Content/Admin/EditRecruiter_Admin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:EditrecruiterAdmin_1 runat="server"></uc1:EditrecruiterAdmin_1>
</asp:Content>
