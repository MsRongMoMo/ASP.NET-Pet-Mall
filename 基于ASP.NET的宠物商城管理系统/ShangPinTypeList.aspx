<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShangPinTypeList.aspx.cs" Inherits="ShangPinTypeList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style>
        .addToCart {
            display:inline-block;
            width:222px;
            outline:none;
            border:0;
            color:#333;
    height: 30px;
    font-size: 12px;
    text-align: center;
    line-height: 30px;
        }
      

    </style>
    <div class="shangPinTypeList clearfix layout_shangPinTypeList">
          <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="920px" Height="406px" HorizontalAlign="Left" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>  
         <asp:Label  runat="server"  ID="commentCount"/>   
         <asp:Label Text='<%#Eval("ShangPinID") %>' runat="server"  ID="ShangPinID" Visible="false"/>   
        <div class="good">
             <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'><img alt="" border="0" src='files/<%#Eval("ShangPinPhoto")%>' style="width: 210px; height: 210px" /></a>
        <p><span class="price">¥  <%#Eval("ShangPinPrice")%> </span></p> 
        <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>' class="desc"><%#Eval("ShangPinName").ToString().Length > 25 ? CutChar(Eval("ShangPinName").ToString(), 32) + "..." : Eval("ShangPinName")%></a>                      
        <p><span class="sellCount">销量：<%#Eval("ZongXiaoLiang")%></span> </p>    
              <asp:LinkButton runat="server"  ID="addToCart" Text="加入购物车"  CssClass="addToCart" CommandArgument='<%# Eval("ShangPinID") %>' CommandName="addToCart" />
        </div>                              
    </ItemTemplate>
 </asp:DataList>

    </div>
           









    <div class="layout">
          <div class="paging">
          共【<asp:Label ID="lblSumPage" runat="server"></asp:Label>】页 &nbsp; &nbsp; &nbsp;
                    当前第【<asp:Label ID="lblCurrentPage" runat="server"></asp:Label>】页&nbsp;
                    <asp:HyperLink ID="hyfirst" runat="server">首页</asp:HyperLink>
                    &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="lnkPrev" runat="server">上一页</asp:HyperLink>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:HyperLink ID="lnkNext" runat="server">下一页</asp:HyperLink>
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:HyperLink ID="hylastpage" runat="server">尾页</asp:HyperLink>
    </div>
    </div>
 
</asp:Content>

