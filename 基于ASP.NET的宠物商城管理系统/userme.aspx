<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="userme.aspx.cs" Inherits="userme" %>
 <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico">
    <style>
        table tr td a {
            color:#ee5533;
            font-size:14px;
            text-decoration:underline;
        }
             table tr td {
                 text-align:center;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BackColor="White" BorderColor="#EE5533" BorderStyle="None" BorderWidth="1px"
        CellPadding="4" DataSourceID="SqlDataSource1" Width="80%" DataKeyNames="pid">
        <Columns>
             <asp:TemplateField HeaderText="商品" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pphoto") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp; <asp:ImageButton ImageUrl='<%# Eval("pphoto","files/{0}") %>' runat="server"  Width="60px"  Height="60px"/>
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="消息标题" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pcontent") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("pcontent").ToString().Substring(Eval("pcontent").ToString().Length-6)%>' NavigateUrl='<%# Eval("pid","usermede.aspx?id={0}") %>'  ></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="操作" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                        OnClientClick="return confirm('确认要删除吗？')" Text="删除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerTemplate>
            <table>
                <tr>
                    <td style="height: 20px">
                        <asp:Label ID="LabelCurrentPage" runat="server" Font-Size="Small">当前页：<%# ((GridView)Container.NamingContainer).PageIndex + 1 %></asp:Label></td>
                    <td style="height: 20px">
                        <asp:Label ID="LabelPageCount" runat="server" Font-Size="Small">总页数：<%# ((GridView)Container.NamingContainer).PageCount %></asp:Label></td>
                    <td style="height: 20px">
                        <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                            Enable="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>" Font-Size="Small">首页</asp:LinkButton></td>
                    <td style="height: 20px">
                        <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                            CommandName="Page" Enable="<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>"
                            Font-Size="Small">上一页</asp:LinkButton></td>
                    <td style="height: 20px">
                        <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                            Enable="<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                            Font-Size="Small">下一页</asp:LinkButton></td>
                    <td style="height: 20px">
                        <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                            Enable="<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>"
                            Font-Size="Small">尾页</asp:LinkButton></td>
                </tr>
            </table>
        </PagerTemplate>
        <RowStyle BackColor="White" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <HeaderStyle BackColor="#f1f1f1" ForeColor="#777777" Height="25px" Font-Size="12" />
        <AlternatingRowStyle BackColor="#f1f1f1" />
        <EmptyDataTemplate>
            暂无消息
        </EmptyDataTemplate>
    </asp:GridView>
  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [OrderNotify] WHERE ([userid] = @userid) and pfeel=0 ORDER BY [pid] DESC"  
         DeleteCommand="DELETE FROM [OrderNotify] WHERE [pid] = @pid" 
        >
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="UserName" Type="String" />
        </SelectParameters>
         <DeleteParameters>
            <asp:Parameter Name="pid" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</form>
    </body>
    </html>
