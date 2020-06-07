<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="admin_orderdetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td style="height: 22px; text-align: center; font-weight: bold; font-size: 20pt; color: #003399;">
                    订单详细信息</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="border-right: mediumslateblue 1px solid; border-top: mediumslateblue 1px solid;
                        border-left: mediumslateblue 1px solid; width: 90%; border-bottom: mediumslateblue 1px solid">
                        <tr>
                            <td style="height: 20px; text-align: left">
                                收货人信息 订单号:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                下单时间:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td rowspan="4">
                                <table style="width: 60%">
                                    <tr>
                                        <td style="text-align: right">
                                            收货人</td>
                                        <td rowspan="4" width="20">
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            收货地址</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            邮政编码</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            联系电话</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="border-right: mediumslateblue 1px solid; border-top: mediumslateblue 1px solid;
                        border-left: mediumslateblue 1px solid; width: 90%; border-bottom: mediumslateblue 1px solid">
                        <tr>
                            <td style="text-align: left">
                                送货方式</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 90%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="border-right: mediumslateblue 1px solid; border-top: mediumslateblue 1px solid;
                        border-left: mediumslateblue 1px solid; width: 90%; border-bottom: mediumslateblue 1px solid">
                        <tr>
                            <td style="text-align: left">
                                付款方式</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 90%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="border-right: mediumslateblue 1px solid; border-top: mediumslateblue 1px solid;
                        border-left: mediumslateblue 1px solid; width: 90%; border-bottom: mediumslateblue 1px solid">
                        <tr>
                            <td style="text-align: left">
                                备注信息</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 90%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="border-right: mediumslateblue 1px solid; border-top: mediumslateblue 1px solid;
                        border-left: mediumslateblue 1px solid; width: 90%; border-bottom: mediumslateblue 1px solid">
                        <tr>
                            <td style="text-align: left">
                                宠物列表<asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 90%">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                                                Width="90%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="名称">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="10">
                                                                    </td>
                                                                    <td colspan="3" style="text-align: left">
                                                                        <a href='~/ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'></a><span style="color: #000000">
                                                                            <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" ImageUrl='<%#Eval("ShangPinPhoto","../files/{0}") %>'
                                                                                Style="width: 80px; height: 80px" />
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="False" NavigateUrl='<%# Eval("ShangPinID", "~/ShowShangPin.aspx?id={0}") %>'
                                                                                Target="_blank" Text='<%# Eval("ShangPinName") %>'></asp:HyperLink></span></td>
                                                                </tr>
                                                            </table>
                                                            &nbsp;&nbsp;
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ShangPinPrice" HeaderText="单价(元)" />
                                                    <asp:BoundField DataField="shuliang" HeaderText="数量" />
                                                    <asp:BoundField DataField="producttotail" HeaderText="小计(元)" />
                                                </Columns>
                                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                                <RowStyle ForeColor="#4A3C8C" />
                                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       <!--
                           
                            <tr>
                            <td style="text-align: center">
                                订单总价：<asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>元
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改总价" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:Panel ID="Panel1" runat="server" Width="100%">
                                    <table style="width: 80%">
                                        <tr>
                                            <td>
                                                修改订单总价为：<asp:TextBox ID="TextBox2" runat="server" Width="45px"></asp:TextBox>元
                                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" /></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                           
                           -->
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
