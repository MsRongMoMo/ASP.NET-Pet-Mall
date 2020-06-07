<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Admin_Order" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css"/>
</head>
<body >
    <form id="form1" runat="server">
    
    <table style="width: 98%">
        <tr>
            <td style="text-align: right">
                用户名:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                订单状态:<asp:DropDownList
                    ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="5">订单状态</asp:ListItem>
                    <asp:ListItem Value="0">未确定订单</asp:ListItem>
                    <asp:ListItem Value="1">等待发货</asp:ListItem>
                    <asp:ListItem Value="2">商家已发货</asp:ListItem>
                    <asp:ListItem Value="3">确认收货</asp:ListItem>
                    <asp:ListItem Value="4">完成交易</asp:ListItem>
                   
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" Width="100%" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <Columns>
            <asp:TemplateField HeaderText="订单号" SortExpression="orderid">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderid") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="ding" runat="server" Text='<%# Bind("dingdanfeel") %>' Visible="False"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("orderid") %>' Visible="False"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("oid","orderdetail.aspx?id={0}") %>'
                        Target="_blank" Text='<%# Bind("orderid") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户名" SortExpression="username">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="shouhuoname" HeaderText="收货人" />
            <asp:BoundField DataField="dingdanshijian" HeaderText="下单时间" SortExpression="dingdanshijian" />
            <asp:BoundField DataField="dingdantotal" HeaderText="订单总额(元)" SortExpression="dingdantotal" />
            <asp:TemplateField HeaderText="订单状态" SortExpression="dingdanfeel">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dingdanfeel") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("dingdanfeel") %>' Visible="False"></asp:Label>
                    <asp:Label ID="zhuangtai" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="songhuofs" HeaderText="送货方式" SortExpression="songhuofs" />
            <asp:BoundField DataField="fukuanfs" HeaderText="付款方式" SortExpression="fukuanfs" />
            <asp:TemplateField HeaderText="查看订单">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("oid","OrderDetail.aspx?id={0}") %>'
                        Text="查看订单" Target="_blank" ></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="geng" runat="server" CommandName="cao">LinkButton</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("orderid") %>'
                        CommandName="del" OnClientClick="return confirm('确认删除吗？')">删除</asp:LinkButton>
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
        <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>
            查找不到相关记录!
        </EmptyDataTemplate>
    </asp:GridView>
               
                </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [orders] ORDER BY [dingdanshijian] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [orders] WHERE ([dingdanfeel] = @dingdanfeel) ORDER BY [dingdanshijian] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="dingdanfeel" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT * FROM [orders] WHERE ([username] LIKE '%' + @username + '%') ORDER BY [dingdanshijian] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox3" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>

