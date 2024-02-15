<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditRecruiter_Admin.ascx.cs" Inherits="JobPortal.Content.Admin.EditRecruiter_Admin" %>
<table>
    <tr>
        <td><h1>Edit recruiter Details</h1></td>
    </tr>
</table>
<table>
    <tr>
        <td>Company Name:</td>
        <td><asp:TextBox ID="txtcompanyname" runat="server"></asp:TextBox> </td>
    </tr>
     <tr>
        <td>Company URL :</td>
        <td><asp:TextBox ID="txtcompanyurl" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>Company Address:</td>
        <td><asp:TextBox ID="txtcomapnyaddress" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>Country:</td>
        <td><asp:DropDownList ID="ddlcompanycountry" runat="server"></asp:DropDownList></td>
    </tr>
     <tr>
        <td>State :</td>
        <td><asp:DropDownList ID="ddlcompanystate" runat="server"></asp:DropDownList></td>
    </tr>
     <tr>
        <td>City :</td>
        <td><asp:DropDownList ID="ddlcompanycity" runat="server"></asp:DropDownList></td>
    </tr>
     <tr>
        <td>Contact Person:</td>
        <td><asp:TextBox ID="txtcompanycontactperson" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>Email ID:</td>
        <td><asp:TextBox ID="txtcompanyhremailid" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>Contact Number:</td>
        <td><asp:TextBox ID="txtcompanyhrmobileno" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td></td>
        <td><asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" /></td>
    </tr>

</table>