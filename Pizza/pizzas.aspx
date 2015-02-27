<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pizzas.aspx.cs" Inherits="Pizza.pizzas" MasterPageFile="~/AdminView.master" %>

<asp:content id="Content2" contentplaceholderid="head" runat="server"> 
    Avaliable Pizzas Page
    </asp:content>
<asp:content id="Content1" contentplaceholderid="ContentPlaceHolderTab" runat="server"> 
    Avaliable Pizzas Page
    </asp:content>
<asp:content id="Content3" contentplaceholderid="ContentPlaceHolderBase" runat="server"> 

    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourcePizzas" ShowFooter="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button  ValidationGroup="grpInsert" OnClick="lblInsert_Click" ID="lblInsert" runat="server" Text="Insert"></asp:Button> 
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtBoxName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="grpInsert" ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Name field can't be empty" ControlToValidate="txtBoxName" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ingridients" SortExpression="ingridients">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ingridients") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ingridients") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtBoxIngridients" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="grpInsert" ID="RequiredFieldValidatorIngridients" runat="server" ErrorMessage="Ingridients field can't be empty" ControlToValidate="txtBoxIngridients" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="price" SortExpression="price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtBoxPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="grpInsert" ID="RequiredFieldValidatorPrice" runat="server" ErrorMessage="Price field can't be empty" ControlToValidate="txtBoxPrice" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
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
        <asp:ValidationSummary ValidationGroup="grpInsert" ID="ValidationSummaryInsert" ForeColor="Red" runat="server" />
        <asp:ValidationSummary ID="ValidationSummaryUpdate" ForeColor="Red" runat="server" />

        <asp:SqlDataSource ID="SqlDataSourcePizzas" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [pizza] WHERE [Id] = @Id" InsertCommand="INSERT INTO [pizza] ([name], [ingridients], [price]) VALUES (@name, @ingridients, @price)" SelectCommand="SELECT * FROM [pizza]" UpdateCommand="UPDATE [pizza] SET [name] = @name, [ingridients] = @ingridients, [price] = @price WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="ingridients" Type="String" />
                <asp:Parameter Name="price" Type="Single" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="ingridients" Type="String" />
                <asp:Parameter Name="price" Type="Single" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </asp:content>

