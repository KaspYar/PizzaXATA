<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="Pizza.orders" MasterPageFile="~/AdminView.master" %>

    
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server"> 
    Orders Page
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderTab" runat="server"> 
    Orders Page
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSourceOrdersAll" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [order].Id, [user].username, [user].email, pizza.name AS pizza, pizza.price, [order].amount, [order].status, pizza.price * [order].amount AS Total FROM [order] INNER JOIN [user] ON [order].id_user = [user].id INNER JOIN pizza ON [order].id_pizza = pizza.Id ORDER BY [order].status DESC, [order].Id DESC" UpdateCommand="UPDATE [order] SET [status] = 'completed' WHERE [Id] = @Id">
            <UpdateParameters>
                <asp:Parameter Name="Id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceOrdersAll" DataKeyNames="Id" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:TemplateField>
            <ItemTemplate>
                <asp:Button runat="server" CommandName="Update" Text="Complete" />
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="false"/>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" ReadOnly="True" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" ReadOnly="True"/>
                <asp:BoundField DataField="pizza" HeaderText="pizza" SortExpression="pizza" ReadOnly="True"/>
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" ReadOnly="True"/>
                <asp:BoundField DataField="amount" HeaderText="amount" SortExpression="amount" ReadOnly="True"/>
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" ReadOnly="True" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    
    </div>
    </asp:Content>