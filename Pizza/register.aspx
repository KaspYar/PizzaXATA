<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Pizza.WebForm1" MasterPageFile="~/AdminView.master"%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server"> 
    Registration Page
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTab" runat="server"> 
    Registration Page
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">User Name</td>
                <td>
                    <asp:TextBox ID="txtBoxUserName" runat="server" Height="20px" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ErrorMessage="User Name is required" ControlToValidate="txtBoxUserName" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">E-mail</td>
                <td>
                    <asp:TextBox ID="txtBoxEmail" runat="server" Height="20px" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="E-mail is required" ControlToValidate="txtBoxEmail" ForeColor="Red"></asp:RequiredFieldValidator><br/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ErrorMessage="Wrong email!" ControlToValidate="txtBoxEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td>
                    <asp:TextBox ID="txtBoxPass" runat="server" Height="20px" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="Password is required" ControlToValidate="txtBoxPass" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Confirm Password</td>
                <td>
                    <asp:TextBox ID="txtBoxConfirmPass" runat="server" Height="20px" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" runat="server" ErrorMessage="Confirm Password is required" ControlToValidate="txtBoxConfirmPass" ForeColor="Red"></asp:RequiredFieldValidator><br/>
                    <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="Passwords mismatch" ControlToCompare="txtBoxPass" ControlToValidate="txtBoxConfirmPass" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
                    <input id="btnReset" type="reset" value="reset" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    </asp:Content>
