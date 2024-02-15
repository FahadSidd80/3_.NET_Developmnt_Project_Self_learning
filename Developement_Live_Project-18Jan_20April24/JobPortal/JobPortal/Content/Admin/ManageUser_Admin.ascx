<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageUser_Admin.ascx.cs" Inherits="JobPortal.Content.Admin.ManageUser_Admin" %>

<table>
    <tr>
        <td><h1>Manage User <asp:Label ID="lblrecruitermsg" runat="server"></asp:Label>  </h1>  </td>
    </tr>
</table>
<table>
    <tr>
        <td></td>
        <td><asp:GridView ID="grduseradmin" OnRowCommand="grduseradmin_RowCommand" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="Sr. No.">
                    <ItemTemplate>
                        <%#Eval("SerialNumber") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%#Eval("name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <%#Eval("address")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <%#Eval("countryname")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <%#Eval("statename")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <%#Eval("cityname")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Mobile No">
                    <ItemTemplate>
                        <%#Eval("mobileno")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <%#Eval("gender").ToString() == "1" ? "Male" : Eval("gender").ToString() == "2" ? "Female" : "Others" %>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Qualification">
                    <ItemTemplate>
                        <%#Eval("qualificationname")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Stream">
                    <ItemTemplate>
                        <%#Eval("streamname")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Jobprofile">
                    <ItemTemplate>
                        <%#Eval("jobprofilename")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Skills">
                    <ItemTemplate>
                        <%#Eval("skill")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Resume">
                    <ItemTemplate>
                        <%#Eval("empresume")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <%#Eval("empimage")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Email Id">
                    <ItemTemplate>
                        <%#Eval("emailid")%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Registration Date">
                    <ItemTemplate>
                        <%#Eval("registerdate")%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <AlternatingRowStyle BackColor="White" />
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

            </asp:GridView></td>
    </tr>
</table>