<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowShangPin.aspx.cs" Inherits="ShowShangPin" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="style/detail.css" rel="stylesheet" />

     

   <div id="box" class="detail_img">
        <div class="small"><!--小层-->
             <asp:Image ID="iGPhoto_small" runat="server" Height="245px" Width="251px" />
              <div class="mask"></div><!--遮挡层-->
        </div>
       <div class="big"><!--大层-->
           <asp:Image ID="iGPhoto_big" runat="server" Height="800px" Width="800px" /><!--大图-->
        </div><!--大图-->
    </div>
          
        <div class="detail_params">
            
       
            <p>
                  <asp:Label ID="Label2" runat="server" Text="" CssClass="name"></asp:Label>
            </p>
            <p class="price">
                <span>波奇价：</span>
                <span class="money">￥
                    <asp:Label ID="Label4" runat="server" Text="" CssClass="money"></asp:Label>
                
                    <input id="Hidden2" runat="server" type="hidden" />
                </span>
                <br />
                 <span>商品规格：</span>
                     <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </p>
            <p>
               
            </p>
     
            <p>
                <span>商品类别：</span> 
                <span><asp:Label ID="Label3" runat="server" Text=""></asp:Label></span>
                <span><input id="Hidden1" runat="server" type="hidden" /></span>   
            </p>
   
            
      
            <p>
                <span>货余量：</span>
                <asp:Label ID="Label5" runat="server" Text=""></asp:Label>

            </p>
      
            <p>
                <span>浏览次数：</span>
                <span><asp:Label ID="Label6" runat="server" Text=""></asp:Label></span>
            </p> 
       
            <p>
                <span>购买数量：</span>
                 <asp:Button ID="subtract" runat="server" Text="-"  CssClass="symbol" OnClick="subtract_Click" /><asp:TextBox ID="sellCount" runat="server" CssClass="count">1</asp:TextBox><asp:Button ID="addition" runat="server" CssClass="symbol"  Text="+" OnClick="addition_Click"   />
                <span class="unit">件</span>
            </p>
 
            <p>
                     
                       <asp:Button ID="buyNow" runat="server"  OnClick="buyNow_Click"  CssClass="buyNow" Text="立即购买"/> 
                     <asp:Button ID="addToCart" runat="server"  OnClick="addToCart_Click"  CssClass="addToCart" /> 
            </p>
       
 
        </div>


    <div class="layout">
        <div class="detail_desc" id="goods_info" >
            <span class="tit">商品介绍</span>
             <div id="DIV1" runat="server" class="desc"></div>
        </div>
      
        <div class="detail_comment detail_desc" id="comment_info">
            <span class="tit">评论信息</span>


            <asp:DataList ID="DataList2" runat="server" Width="100%">
                <ItemTemplate>
                    <table style="width: 100%">
                        <tr>
                            <td colspan="2" class="user">
                                <img src="files/<%#Eval("Photo")%>" alt="Alternate Text" />
                                <p><%#Eval("UserName").ToString().Substring(0,1)+"***"+Eval("UserName").ToString().Substring(Eval("UserName").ToString().Length-1)%></p>
                            </td> 
                           <td class="content">
                                内容：<%#Eval("Titles")%></td>
                            <td class="date">
                             <%#Eval("AddTime", "{0:d}")%>
                            </td>
                          </tr>
                         
                    </table>
                </ItemTemplate>
            </asp:DataList>

            <!--评论信息的分页-->
            <div>
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


        </div>
    </div>
  
    

 <!--商品介绍与评论介绍显示-->
    <script>

       
        var goods_info = document.getElementById("goods_info");
        console.log(goods_info);
        var comment_info = document.getElementById("comment_info");
        if (comment_info.children.length == 2) {
            comment_info.style.display="none";
        }
        if (goods_info.getElementsByTagName("div")[0].innerText=="") {
            goods_info.style.display = "none";
        }
    </script>

    <!--放大镜脚本-->
    <script>
       function getScrollTop() {
            return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
        }
        var box = document.getElementById("box");
            //小图的div
            var small=box.children[0];

            //遮挡层
            var mark=small.children[1];
            //大图的div
            var big=box.children[1];
            //获取大图
            var imgBig=big.children[0];
    box.onmouseover=function () {
                mark.style.display = "block";
        big.style.display="block";
    }
    box.onmouseout=function () {
                mark.style.display = "none";
        big.style.display="none";
        }

        window.onscroll = function () {
            small.onmousemove = function (e) {
                var left = e.clientX - (mark.offsetWidth / 2) - 13;
                var top = e.clientY - (mark.offsetHeight / 2) + 13;
                var x = left - 451;
                var y = top - 247;
                //x轴最小值
                x = x < 0 ? 0 : x;
                //x轴最大值
                x = x > this.offsetWidth - mark.offsetWidth ? this.offsetWidth - mark.offsetWidth : x;
                //y轴最小值
                y = y < 0 ? 0 : y;
                //y轴最大值

                if (getScrollTop() != 0) {
                    console.log(getScrollTop())
                    y = y > this.offsetHeight + getScrollTop() - mark.offsetHeight ? this.offsetHeight - mark.offsetHeight : this.offsetHeight + getScrollTop - mark.offsetHeight;

                } else {
                    y = y > this.offsetHeight - mark.offsetHeight ? this.offsetHeight - mark.offsetHeight : y;
                }



                mark.style.left = x + "px";
                mark.style.top = y + "px";
                //测试使用
                // console.log(y);

                //放大的比例为问题
                //遮挡层的移动距离/大图的移动距离=遮挡层最大的移动距离/大图的最大的移动距离

                //大图的横向最大移动距离
                // imgW-big.offsetWidth

                // var bigX=imgBig.offsetWidth-big.offsetWidth;
                //大图的纵向最大移动距离
                // imgH-big.offsetHeight
                var bigY = imgBig.offsetHeight - big.offsetHeight;

                var bigImgX = x * bigY / (small.offsetHeight - mark.offsetHeight);
                var bigImgY = y * bigY / (small.offsetHeight - mark.offsetHeight);
                imgBig.style.marginLeft = -bigImgX + "px";
                imgBig.style.marginTop = -bigImgY + "px";

            }
        }
    </script>
   
</asp:Content>

