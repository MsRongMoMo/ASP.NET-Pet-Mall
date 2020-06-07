 
<%@ Page Language="C#" MasterPageFile="~/ShoppingList_CheckOut.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="style/shoppingcar.css" rel="stylesheet" />
    <style>
        .default a{
            color:#444;
            font-size:14px;
            position:relative;
            left:1060px;
            top:-30px;
        }
        .mycart {
            height:660px;
        }
        div.page p {
            text-align:center;
        }
        div.page p,div.page p a{
            margin-top:40px;
            color:#777;
            font-size:14px;
        }
        .mycart .item {
            width:100%;
            height:130px;
              padding:10px;
              border-bottom:1px solid #eee;
        }
          .mycart  .item:nth-child(4n) {
                border-bottom:none;
            }
      .mycart  .item_left {
            display:inline-block;
            width:15%;
            font-size:0;
               position:relative;
                top:-35px;
        }
         .mycart   .item_left a {
                display:inline-block;
                width:110px;
                height:110px;
             
            }
          .mycart  .item_left a img {
                width:110px;
                height:110px;
                vertical-align:middle;
             
            }
      .mycart  .item_center {
             display:inline-block;
               width:50%;
              
        }
      .mycart  .item_count {
             display:inline-block;
            width:15%;
            text-align:right;
        }
         .mycart   .item_count div {
                position:relative;
                top:-35px;
            }
         .mycart   .item_center p ,.item_center span,.item_right p,.item_right p .del,.item_count .unit{
                color:#999;
                font-size:14px;

            }
          .mycart      .item_right p .del {
                    display:inline-block;
                    margin-top:10px;
                    width:86px;
                }
            .mycart        .item_right p .del:hover {
                        text-decoration:underline;
                        color:#777;
                    }
         .mycart   .item_center p .title ,.item_right span{
                height:35px;
                line-height:50px;
                color:#ee5533;
                font-size:14px;
            }
     .mycart  .item_right {
             display:inline-block;
               width:15%;
                 text-align:right;
        }
    </style>  
 <p class="default"><a href="Default.aspx">返回首页</a></p>
 <div class="mycart">   
   <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
     <p style="text-align:center">我的购物车</p>
   <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand"
        OnItemDataBound="DataList1_ItemDataBound" Width="100%">
        <ItemTemplate>
            <div class="item">
                <div class="item_left">   
                  <a href='ShowShangPin.aspx?id=<%#Eval("pid") %>'><asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("ShangPinPhoto","files/{0}") %>'/></a>
                  <asp:Label ID="pid" runat="server" Text='<%# Eval("pid") %>' Visible="False"></asp:Label>
                  <asp:Label ID="ShangPinNum" runat="server" Text='<%# Eval("ShangPinNum") %>' Visible="False"></asp:Label>
                </div>
                
                <div class="item_center">
                    <p><asp:HyperLink ID="HyperLink4" runat="server" CssClass="title" NavigateUrl='<%# Eval("ShangPinID","ShowShangPin.aspx?id={0}") %>' Text='<%# Eval("ShangPinName") %>'></asp:HyperLink></p>
                    <p>商品类别:<asp:Label ID="Label5" runat="server" Text='<%# Eval("ShangPinTypeName") %>'></asp:Label></p>
                    <p>产品规格:<asp:Label ID="Label2" runat="server" Text='<%# Eval("ShangPinKuanshi") %>'></asp:Label></p>
                </div>
                   
                <div class="item_count">
                    <div>
                         <asp:Button ID="subtract" runat="server" Text="-"  CssClass="symbol"   CommandName="subtract" /><asp:TextBox ID="sellCount" runat="server" CssClass="count" Text='<%# Eval("shuliang") %>'></asp:TextBox><asp:Button ID="addition" runat="server" CssClass="symbol"  Text="+"    CommandName="addition" />
                         <span class="unit">件</span>
                    </div>
                </div>

                <div class="item_right">
                    <p>波奇价:<asp:Label ID="Label1" runat="server" ForeColor="#ee5533" Text='<%# Eval("ShangPinPrice") %>'></asp:Label>元</p>
                    <p><asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("pid") %>'  CommandName="buynow"></asp:LinkButton></p>
                    <p><asp:LinkButton ID="LinkButton3" runat="server" CommandName="del" CssClass="del">删除</asp:LinkButton></p>                   
                </div>
                     
            </div>         
        </ItemTemplate>
    </asp:DataList>
 </div>
  

     <div class="page">
            <p align="center" bgcolor="#ffffff" colspan="3" style="height: 24px">
                共【<asp:Label ID="lblSumPage" runat="server"></asp:Label>】页 &nbsp; &nbsp; &nbsp;
                当前第【<asp:Label ID="lblCurrentPage" runat="server"></asp:Label>】页&nbsp;
                <asp:HyperLink ID="hyfirst" runat="server">首页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="lnkPrev" runat="server">上一页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:HyperLink ID="lnkNext" runat="server">下一页</asp:HyperLink>
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                <asp:HyperLink ID="hylastpage" runat="server">尾页</asp:HyperLink>
            </p>
    </div>
   </asp:Content>





