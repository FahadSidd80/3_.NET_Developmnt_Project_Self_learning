<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ManageJobPost.aspx.cs" Inherits="JobPortal.ManageJobPost" %>
<%@ Register TagName="ManageJobPost_ByAdmin" TagPrefix="uh1" src="~/Content/Admin/ManageJobPost_ByAdmin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <uh1:ManageJobPost_ByAdmin id="ManageJobPost_ByAdmin" runat="server"></uh1:ManageJobPost_ByAdmin>
            </td>
        </tr>
    </table>
</asp:Content>
