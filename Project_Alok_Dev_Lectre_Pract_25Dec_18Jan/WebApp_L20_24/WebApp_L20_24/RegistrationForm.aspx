<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="WebApp_L20_24.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name: </td>
                    <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>Country :</td>
                    <td><asp:DropDownList ID="ddlcountry" runat="server" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><asp:DropDownList ID="ddlstate" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClick="btnsave_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <columns>
                            <asp:TemplateField HeaderText="Emp Name">
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Emp Age">
                                <ItemTemplate>
                                    <%#Eval("age") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Emp Gender">
                                <ItemTemplate>
                                    <%#Eval("gender").ToString()=="1" ? "Male" : Eval("gender").ToString()== "2" ? "Female" : "Other" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Emp Country">
                                <ItemTemplate>
                                    <%#Eval("cname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Emp State">
                                <ItemTemplate>
                                    <%#Eval("sname") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Del" CommandArgument='<%#Eval("empid") %>' OnClientClick="return confirm('are you sure you want to delete ??')" ></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                     <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="Edt" CommandArgument='<%#Eval("empid")%>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
