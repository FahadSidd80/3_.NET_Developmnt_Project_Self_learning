<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Admin_Edit_RecruiterJobPost.ascx.cs" Inherits="JobPortal.Content.Admin.Admin_Edit_RecruiterJobPost" %>
<table>
    <tr>
        <td><h1>Edit Posted Jobs</h1></td>
    </tr>
</table>
<table>
    <tr>
        <td>Job Title :</td>
        <td><asp:DropDownList ID="ddljobtitle" runat="server"></asp:DropDownList></td>
    </tr>
     <tr>
        <td>Company Name :</td>
        <td><asp:DropDownList ID="ddlcompanyname" runat="server"></asp:DropDownList></td>
    </tr>
    <tr>
        <td>Min Experience :</td>
        <td><asp:TextBox ID="txtminexperience" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Max Experience :</td>
        <td><asp:TextBox ID="txtmaxexperience" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
        <td>Min Salary:</td>
        <td><asp:TextBox ID="txtminsalary" runat="server"></asp:TextBox></td>
    </tr>
      <tr>
        <td>Max Salary:</td>
        <td><asp:TextBox ID="txtmaxsalary" runat="server"></asp:TextBox></td>
    </tr>
      <tr>
        <td>No Of Positions:</td>
        <td><asp:TextBox ID="txtvacancies" runat="server"></asp:TextBox></td>
    </tr>
      <tr>
        <td>Comments:</td>
        <td><asp:TextBox ID="txtcomments" TextMode="MultiLine" runat="server"></asp:TextBox></td>
    </tr>
      <tr>
        <td></td>
        <td><asp:Button ID="btnupdate" runat="server" Text="Update" ForeColor="Black" BackColor="LightGray" OnClick="btnupdate_Click" /></td>
    </tr>
</table>