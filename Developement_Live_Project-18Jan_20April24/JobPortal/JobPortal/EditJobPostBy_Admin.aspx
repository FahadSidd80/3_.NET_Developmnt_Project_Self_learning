<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="EditJobPostBy_Admin.aspx.cs" Inherits="JobPortal.EditJobPostBy_Admin" %>
<%@ Register TagName="EditRecruiterJobpostByAdmin" TagPrefix="uc1" Src="~/Content/Admin/Admin_Edit_RecruiterJobPost.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:EditRecruiterJobpostByAdmin id="EditRecruiterJobpostByAdmin_id" runat="server"></uc1:EditRecruiterJobpostByAdmin>
</asp:Content>
