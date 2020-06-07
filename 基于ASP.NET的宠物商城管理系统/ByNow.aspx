 
<%@ Page Language="C#" MasterPageFile="~/ShoppingList_CheckOut.master" AutoEventWireup="true" CodeFile="ByNow.aspx.cs" Inherits="ByNow" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="style/shoppingcar.css" rel="stylesheet" />
    <span class="toshopping"><asp:Button ID="toshopping" runat="server" OnClick="toshopping_Click" Text="继续购物"/></span>
        <div>
             <table class="shoppingcarlist">
        <tr>
            <td colspan="3">
                <asp:GridView ID="MyGrid" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataKeyNames="ShangPinID" HeaderStyle-BackColor="Honeydew"
                    HeaderStyle-ForeColor="RoyalBlue" HeaderStyle-HorizontalAlign="center" Width="100%" OnRowCommand="MyGrid_RowCommand" BackColor="#FFFFFF"  GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="商品">
                            <ItemStyle HorizontalAlign="Left" CssClass="ShangPinName" />
                            <ItemTemplate> 
                                <table width="100%">
                                    <tr>  
                                        <td colspan="3"><a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'>
                                          <asp:Image ID="Image1" runat="server" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("ShangPinPhoto","files/{0}") %>' style="border:1px solid #ccc;" /></a>
                                         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ShangPinID", "ShowShangPin.aspx?id={0}") %>' Target="_blank" Text='<%# Eval("ShangPinName")%>' CssClass="title">
                                         </asp:HyperLink><asp:Label ID="Label1" runat="server" Text='<%# Bind("ShangPinID") %>' Visible="False"></asp:Label></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ShangPinPrice" HeaderText="波奇价(元)">
                            <ItemStyle HorizontalAlign="Center" CssClass="ShangPinSinglePrice" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="数量">
                            <EditItemTemplate>
                             
                                <asp:TextBox ID="PurchaseCount" runat="server" Text='<%# Bind("PurchaseCount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="bianhao" runat="server" Text='<%#Eval("ShangPinID") %>' Visible="False"></asp:Label>
                                <asp:TextBox ID="PurchaseCount" runat="server" Text='<%#Eval("PurchaseCount") %>' Width="60px"></asp:TextBox>
                                <asp:Label ID="MaxCount" runat="server" Text='<%#Eval("ShangPinNum") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TotalPrice" HeaderText="小计(元)">
                            <ItemStyle HorizontalAlign="Center" ForeColor="#FF8000" CssClass="ShangPinTotalPrice" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%#Eval("ShangPinID") %>'
                                    Text="删除" style="font-size:12px;text-decoration:underline;" ForeColor="#999999"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                

                    <RowStyle CssClass="table-row" />
                
                </asp:GridView>
             
                <asp:Label ID="Msg" runat="Server"></asp:Label></td>
        </tr>
        <tr class="account">
            <td align="right"><asp:Button ID="clearCar" runat="server" OnClick="clearCar_Click" Text="清空购物车"/></td>
                <td align="right"><asp:Button ID="changeCount" runat="server" OnClick="changeCount_Click" Text="修改数量"/></td>
            <td style="padding-right:30px;" align="right">
                <span style="text-align: right;color:#999;font-size:12px;margin-right:150px;">商品总价(不含运费):<asp:Label ID="Label1" runat="server" CssClass="totalPrice">Label</asp:Label>元</span>
                <div class="money"><asp:Button ID="toSelttleAccount" runat="server" OnClick="toSettleAccount_Click" Text="去结算"/></div>
            </td>
        
            
        </tr>
        
    </table>
        </div>
 
   </asp:Content>





