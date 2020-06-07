
<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="OrderDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico"
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 900px;margin:20px auto;background-color:#fff;">
            <tr>
                <td style="text-align: center; height: 22px; font-weight: bold; font-size: 25px; color: #ee5533;">
                    订单详细信息</td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="border-color: mediumslateblue; border-width: 1px; width: 100%; ">
                        <tr>
                            <td style="height: 20px; text-align: left; font-weight: bold; font-size: 16px;">
                                收货人信息 订单号:<asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                                下单时间:<asp:Label ID="Label2" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                                订单状态:<asp:Label ID="Label11" runat="server" ForeColor="Red" Text="Label"></asp:Label>&nbsp;
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 80%">
                                    <tr>
                                        <td colspan="3" style="text-align: right">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 200px;">
                                            收货人</td>
                                        <td rowspan="4" width="20">
                                        </td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 200px;">
                                            收货地址</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 200px;">
                                            邮政编码</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 200px;">
                                            联系电话</td>
                                        <td style="text-align: left">
                                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="width: 100%; border-top-width: 1px; border-left-width: 1px; border-left-color: mediumslateblue; border-bottom-width: 1px; border-bottom-color: mediumslateblue; border-top-color: mediumslateblue; border-right-width: 1px; border-right-color: mediumslateblue;">
                        <tr>
                            <td style="text-align: left; font-weight: bold; font-size: 16px;">
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
                    <table style="width: 100%; border-top-width: 1px; border-left-width: 1px; border-left-color: mediumslateblue; border-bottom-width: 1px; border-bottom-color: mediumslateblue; border-top-color: mediumslateblue; border-right-width: 1px; border-right-color: mediumslateblue;">
                        <tr>
                            <td style="text-align: left; font-weight: bold; font-size: 16px;">
                                付款方式</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 100%">
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
                    <table style="width: 100%; border-top-width: 1px; border-left-width: 1px; border-left-color: mediumslateblue; border-bottom-width: 1px; border-bottom-color: mediumslateblue; border-top-color: mediumslateblue; border-right-width: 1px; border-right-color: mediumslateblue;">
                        <tr>
                            <td style="text-align: left; font-weight: bold; font-size: 16px;">
                                备注信息</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <table style="width: 100%; border-top-width: 1px; border-left-width: 1px; border-left-color: mediumslateblue; border-bottom-width: 1px; border-bottom-color: mediumslateblue; border-top-color: mediumslateblue; border-right-width: 1px; border-right-color: mediumslateblue;">
                        <tr>
                            <td style="text-align: left; font-weight: bold; font-size: 16px;">
                                商品列表<asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="100%" 
                                                 DataKeyNames="ShangPinID">
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
                                                                        <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'></a><span style="color: #000000">
                                                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("ShangPinPhoto","files/{0}") %>' style="width: 80px; height: 80px" ImageAlign="AbsMiddle" />
                                                                            <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("ShangPinName") %>' NavigateUrl='<%# Eval("ShangPinID", "ShowShangPin.aspx?id={0}") %>' Font-Underline="False" Target="_blank"></asp:HyperLink></span></td>
                                                                </tr>
                                                      
                                                            </table>
                                                            &nbsp;&nbsp;
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ShangPinPrice" HeaderText="单价(元)" />
                                                    <asp:BoundField DataField="shuliang" HeaderText="数量" />
                                                    <asp:BoundField DataField="producttotail" HeaderText="小计(元)" />
                                                </Columns>
                                                <FooterStyle BackColor="#B5C7DE" ForeColor="#f1775c" />
                                                <RowStyle ForeColor="#f1775c" />
                                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <PagerStyle BackColor="#E7E7FF" ForeColor="#f1775c" HorizontalAlign="Right" />
                                                <HeaderStyle BackColor="#f1775c" Font-Bold="True" ForeColor="#F7F7F7" />
                                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr></tr>
                                    <tr>
                                        <td style="text-align: right">
                                            &nbsp;应付金额：<asp:Label ID="Label13" runat="server" Text="Label" ForeColor="Red"></asp:Label>元</td>
                                    </tr>
                                     <tr>
                                         <asp:Panel runat="server" Visible="false" ID="Price_discount">
                                              <td style="text-align: right">
                                            &nbsp;会员优惠金额：<asp:Label ID="PriceDifference" runat="server" Text="Label" ForeColor="Red" ></asp:Label>元</td>
                                         </asp:Panel>
                                    </tr>
                                     <tr>
                                         <asp:Panel runat="server" Visible="false" ID="Price_actual">
                                             <td style="text-align: right">
                                            &nbsp;实收金额：<asp:Label ID="VIPPrice" runat="server" Text="Label" ForeColor="Red" ></asp:Label>元</td>
                                         </asp:Panel>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</form>
    </body>
    </html>