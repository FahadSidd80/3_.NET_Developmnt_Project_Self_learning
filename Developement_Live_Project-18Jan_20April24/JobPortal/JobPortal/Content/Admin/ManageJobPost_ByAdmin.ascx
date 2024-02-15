<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageJobPost_ByAdmin.ascx.cs" Inherits="JobPortal.Content.Admin.ManageJobPost_ByAdmin" %>

<table>
    <tr>
        <td>
            <h1> Manage Job Post -- javascript validation left and search pe salary me issue hai </h1>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td>Job Title:</td>
        <td><asp:DropDownList ID="ddljobtitle" runat="server"></asp:DropDownList></td>
         <td>Company Name:</td>
        <td><asp:DropDownList ID="ddlcompanyname" runat="server"></asp:DropDownList></td>
         <td>Enter Salary:</td>
        <td><asp:TextBox ID="txtusersalary" runat="server"></asp:TextBox></td>
        <td><asp:Button ID="btnsearch" runat="server" ForeColor="Black" BackColor="LightGray" Text="Search" OnClick="btnsearch_Click" /></td>
        <td><asp:Button ID="btnrefresh" runat="server"  ForeColor="Black" BackColor="LightGray" Text="Refresh" OnClick="btnrefresh_Click" /></td>
    </tr>
</table>
<asp:Label ID="lblmessageJobpostadmin" runat="server"></asp:Label>
<table>
    <tr>
        <td>
            <asp:GridView ID="grdjobpostadmin" OnRowCommand="gridjobpostadmin_RowCommand" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Sr. No.">
                        <ItemTemplate>
                            <%#Eval("SerialNumber") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Job Title">
                        <ItemTemplate>
                            <%#Eval("jobprofilename") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Company Name">
                        <ItemTemplate>
                            <%#Eval("name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Req. Experience">
                        <ItemTemplate>
                            <%#Eval("minexperience") %>
                        <Text>year</Text>
                        <Text>-</Text>
                        <%#Eval("maxexperience") %>
                        <Text>year</Text>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Offered Salary">
                        <ItemTemplate>
                            <%#Eval("minsalary")%>
                            <Text>-</Text>
                            <Text>Rs.</Text>
                            <%#Eval("maxsalary") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="No Of Positions">
                        <ItemTemplate>
                            <%#Eval("vacancies") %>
                             <Text>positions.</Text>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Comments">
                        <ItemTemplate>
                            <%#Eval("comment") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="Date Posted">
                        <ItemTemplate>
                            <%#Eval("registerdate") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                           <asp:Button id="btndelete" runat="server" Text="Delete" ForeColor="Black" BackColor="LightGray" CommandName="Del" CommandArgument='<%#Eval("jobid") %>' OnClientClick="return confirm('are you sure ... you want to delete...??')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                     <asp:Button ID="btnedit" runat="server" Text="Edit" ForeColor="Black" BackColor="LightGray" CommandName="Edt" CommandArgument='<%#Eval("jobid")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </td>
    </tr>
</table>