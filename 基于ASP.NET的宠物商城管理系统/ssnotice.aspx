 <%@ Page Language="C#" MasterPageFile="~/ShoppingList_CheckOut.master" AutoEventWireup="true" CodeFile="ssnotice.aspx.cs" Inherits="ssnotice" Title="网上宠物--错误信息" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="jumpurl">
        <table width="700">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/tishi.jpg" /></td>
                <td style="text-align: left">
                    对不起，本页面需要会员身份，您未登录或登录已超时！请点击<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UserLogin.aspx"
                        Style="font-size: 15px; color: #ff0033">登录</asp:HyperLink>或<asp:HyperLink ID="HyperLink2"
                            runat="server" NavigateUrl="~/UserRegister.aspx" Style="font-size: 15px; color: #ff0033">免费注册</asp:HyperLink>进行操作!</td>
            </tr>
        </table>
    </p>
</asp:Content>

