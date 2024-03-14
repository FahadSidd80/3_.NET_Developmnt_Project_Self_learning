<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="StudentForm.aspx.cs" Inherits="WebAppl_23_MasterPage.StudentForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validation() {
             var msg = "";
             msg = checkName();
             msg += checkage();
             //msg += checksalary();
             //msg += checkmobileno();
             //msg += checkPassword();
             //msg += checkcPassword();

            if (msg == "") {
                return true;
            }
            else {
                alert(msg);
                return false;
            }

        }
        
        function checkName() {
            //var Tb = document.getElementById('ContentPlaceHolder1_txtname'); // ya jab master page hoga tabhi chalega.
            var Tb = document.getElementById('<%=txtname.ClientID%>');// yab jab master page hoga ya nahi bhi hoga tab bhi chalega
            var exp = /^[a-zA-Z ]*$/
            if (Tb.Value == "") {
                return 'please enter your name !! \n';
            }
            else if (exp.test(Tb.Value)) {
                return "";
            }
            else {
                return 'please enter name between a-z,A-Z only !!\n ';
            }

        }
        function checkage() {
            //var TB = document.getElementById('ContentPlaceHolder1_txtage');
            var TB = document.getElementById('<%=txtage.ClientID%>');
            var exp = /^[0-9]*$/
            if (TB.value == "") {
                return 'Please enter your age !! \n';
            }
            else if (exp.test(TB.value)) {
                return "";
            }
            else {
                return 'please enter only int value for age !! \n';
            }
        }
        //function checksalary() {
        //    var Tb = document.getElementById('txtsalary'); // txtsalary this way is work only jab master page nahi hoga. tabhi chalega
        //    var exp = /^[0-9]*$/
        //    if (Tb.value == "") {
        //        return 'Please enter your salary !! \n';
        //    }
        //    //else if (10000<= Tb.value <=50000) {
        //    //    return "";
        //    //}
        //    else if (Tb.value >= 10000 && Tb.value <= 50000) {
        //        return "";
        //    }
        //    else if (exp.test(Tb.value)) {
        //        return "";
        //    }
        //    else {
        //        return 'Please enter salary only in range between 10000 to 50000 !! \n';
        //    }
        //}
        //function checkmobileno() {
        //    var Tb = Document.getElementById('txtmobile');
        //    var exp = /^\d{10}$/
        //    if (Tb.value == "") {
        //        return'please enter your mobile no !! \n';
        //    }
        //    else if (exp.test(Tb.value)) {
        //        return "";
        //    }
        //    else {
        //        return 'please enter 10 digit mobile number only !! \n';
        //    }
        //}
        //function checkPassword() {
        //    var Tb = Document.getElementById('txtpassword');
        //    if (Tb.value == "") {
        //        return 'please enter your password  !! \n';
        //    }
        //    else {
        //        return "";
        //    }
        //}
        //function CheckcPassword() {
        //    var Tb = Document.getElementById('txtcpassword');
        //    var Tb1 = Document.getElementById('txtpassword');
        //    /*var exp = /^\d{10}$/*/
        //    if (Tb.value == "") {
        //        return 'please enter your confirm password !! \n';
        //    }
        //    else if (Tb.value == Tb1.value) {
        //        return "";
        //    }
        //    else {
        //        return 'password do not match !! \n';
        //    }
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <td><asp:DropDownList ID="ddlcountry" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" ></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><asp:DropDownList ID="ddlstate" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="btnsave" runat="server" Text="Save" ForeColor="White" BackColor="Gray" OnClientClick="return Validation()" OnClick="btnsave_Click"  /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:GridView ID="grd" runat="server" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <columns>
                            <asp:TemplateField HeaderText="Sr. No.">
                                <ItemTemplate>
                                    <%#Eval("SerialNumber") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Emp Name">
                                <ItemTemplate>
                                    <%#Eval("CapitalName") %>
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
</asp:Content>
