<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="ManageRecruiter.aspx.cs" Inherits="JobPortal.ManageRecruiter" %>
    <%@ Register TagName="ManageRecruiter_Admin" TagPrefix="uh1" Src="~/Content/Admin/ManageRecruiter_Admin.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
		<tr>
			<td>
                    <uh1:ManageRecruiter_Admin ID="ManageRecruiter_Admin_1" runat="server" />
            </td>
		</tr>
    </table>>
</asp:Content>
