
  <%@ Page Language="C#"  AutoEventWireup="true" CodeFile="OrderInfo.aspx.cs" Inherits="OrderInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico">
    <style>
             p {
            margin:15px 400px;
            font-size:16px;
            color:#333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>我的订单</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"
        Width="95%" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" style="border-right:  #ee5533 1px solid; border-top:  #ee5533 1px solid; border-left:  #ee5533 1px solid; border-bottom: #ee5533 1px solid">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <Columns>
           
            <asp:TemplateField HeaderText="订单号" SortExpression="orderid">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderid") %>'></asp:TextBox>
                </EditItemTemplate>
             
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("pid") %>' runat="server"  ID="pid" Visible="False"/>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("orderid") %>' Visible="False"></asp:Label>
                    <asp:Label ID="ding" runat="server" Text='<%# Bind("dingdanfeel") %>' Visible="False"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("oid","OrderDetail.aspx?id={0}") %>'
                        Target="_blank" Text='<%# Bind("orderid") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="shouhuoname" HeaderText="收货人" SortExpression="username" />
            <asp:BoundField DataField="dingdanshijian" HeaderText="下单时间" SortExpression="dingdanshijian" />
            <asp:BoundField DataField="dingdantotal" HeaderText="订单总额(元)" SortExpression="dingdantotal" />
            <asp:TemplateField HeaderText="订单状态" SortExpression="dingdanfeel">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dingdanfeel") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("dingdanfeel") %>' Visible="False"></asp:Label><asp:Label
                        ID="zhuangtai" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="查看订单">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("oid","OrderDetail.aspx?id={0}") %>'
                        Text="查看订单"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="geng" runat="server" CommandName="cao">LinkButton</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    
                      <asp:Label ID="dingdanfeel" runat="server" Text='<%# Bind("dingdanfeel") %>' Visible="False"></asp:Label>
                     <asp:Label ID="fukuanfs" runat="server" Text='<%# Bind("fukuanfs") %>' Visible="False"></asp:Label>
                      <asp:Label ID="dingdantotal" runat="server" Text='<%# Bind("dingdantotal") %>' Visible="False"></asp:Label>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("orderid") %>'
                        CommandName="del" EnableTheming="True" OnClientClick="return confirm('确认删除吗？')">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
              
                    <asp:LinkButton ID="AddComment" runat="server" CommandArgument='<%# Eval("dingdanfeel") %>'
                        CommandName="comment" EnableTheming="True" Visible="false"  PostBackUrl='<%#"AddPingJia.aspx?ShangPinId="+ Eval("pid") %>'>添加评论</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>  
        </Columns>
        <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <HeaderStyle BackColor="#f3f3f3" Font-Bold="False" ForeColor="#999999" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [orders].*,[orderdetail].pid FROM [orders],[orderdetail] WHERE ([orders].username = @username) and [orders].orderid=[orderdetail].orderid ORDER BY [dingdanshijian] DESC ">
         <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="UserName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
      
        
      
</form>

 </body>
  </html>

