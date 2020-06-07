<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
    <div class="banner">     
       <div class="layout">
            <div class="datalist1">
                <span  class="pet_icon"></span>
                <span class="pet_name">狗狗商品</span>
                 <asp:DataList ID="DlGoodsType1" runat="server"  RepeatDirection="Horizontal" RepeatColumns="3" HorizontalAlign="Justify" Width="160px">
                <ItemTemplate>
                        <span>
                        <a href='<%#Eval("id", "ShangPinTypeList.aspx?id={0}")%>'>
                            <%#Eval("name").ToString().Substring(2,2)%>
                        </a>
                    </span> 
                </ItemTemplate>
            </asp:DataList>

                <div class="datalist2">
                      <span  class="pet_icon cat"></span>
                <span class="pet_name">猫猫商品</span>
                 <asp:DataList ID="DlGoodsType2" runat="server"  RepeatDirection="Horizontal" RepeatColumns="3"  HorizontalAlign="Center" Width="160px">
                <ItemTemplate>
                        <span>
                        <a href='<%#Eval("id", "ShangPinTypeList.aspx?id={0}")%>'>
                            <%# Eval("name").ToString().Substring(2,2)%>
                        </a>
                    </span>
                </ItemTemplate>
            </asp:DataList>
                </div>

            </div>
           </div>
    </div>



   


    <!--   轮播图  -->

 


    <div class="swiper-container content_placeholder layout">
  <div class="swiper-wrapper">
    <div class="swiper-slide"><asp:HyperLink runat="server" NavigateUrl="SearchShangPinList.aspx?ShangPinName=费利威&ShangPinTypeName=所有类别"><img src="image/banner_newerDiscount.jpg" alt=""/></asp:HyperLink></div>
    <div class="swiper-slide"><asp:HyperLink runat="server" NavigateUrl="SearchShangPinList.aspx?ShangPinName=怡亲&ShangPinTypeName=所有类别"> <img src="image/banner_yiqin.jpg" alt=""/></asp:HyperLink></div>
  </div>
         <div class="swiper-pagination"></div>
</div>



    


    <!--狗狗商品列表展示-->

    <div class="petslist layout">

        <div class="navpet  clearfix">
            <div class="pettit fl">
                <span></span>
                <h2>狗狗商品</h2>
            </div>
            <div class="navtit fl">
                <asp:DataList ID="DlGoodsType3" runat="server"  RepeatDirection="Horizontal" RepeatColumns="8" HorizontalAlign="Justify" Width="750px">
                <ItemTemplate>
                        <span class="brief">
                        <a href='<%#Eval("id", "ShangPinTypeList.aspx?id={0}")%>'class='<%#Eval("id", "ShangPinTypeList.aspx?id={0}")%>' onmouseover="console.log(document.getElementById('listIframe_dog').src='ShangPinTypeListIframe.aspx?id=<%#Eval("id")%>')">
                            <%#Eval("name").ToString().Substring(2,2)%>
                        </a>
                    </span> 
                </ItemTemplate>
            </asp:DataList>
            </div>
        </div>

        <div class="content_pet">
            <a href="SearchShangPinList.aspx?ShangPinName=福来恩&ShangPinTypeName=所有类别"><div class="content_l"></div></a>
            <div class="content_c clearfix"> 
                <iframe id="listIframe_dog" src="ShangPinTypeListIframe.aspx" width="100%" height="420px" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe> 
                <ul class="vendor">
                    <li> <a href="#"><img src="image/vendor/dog_1.jpg" alt="Alternate Text" title="宝路"/></a></li>
                    <li> <a href="#"><img src="image/vendor/dog_2.jpg" alt="Alternate Text" title="比瑞吉"/></a></li>
                    <li> <a href="#"><img src="image/vendor/dog_3.jpg" alt="Alternate Text" title="冠能"/></a></li>
                    <li> <a href="#"><img src="image/vendor/dog_4.jpg" alt="Alternate Text" title="佳乐滋"/></a></li>
                    <li> <a href="#"><img src="image/vendor/dog_5.jpg" alt="Alternate Text" title="佩玛思特"/></a></li>
                    <li> <a href="#"><img src="image/vendor/dog_6.jpg" alt="Alternate Text" title="维克"/></a></li>
                    <li> <a href="#"><img src="image/vendor/dog_1.jpg" alt="Alternate Text" title="味优"/></a></li>
                    <li><a href="SearchShangPinList.aspx?ShangPinName=怡亲&ShangPinTypeName=所有类别"><img  class="last" src="image/vendor/yiqin.jpg" alt="Alternate Text" title="怡亲"/></a></li>

                </ul>
             </div>
             <div class="content_r">
                 <p>波奇推荐</p>
                 <iframe src="ShangPinTypeListIframeLitter.aspx?category=dog" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
             </div>
        </div>
    </div>                 
              
    <!--猫猫商品列表展示-->

    
    <div class="petslist layout" style="margin-top:25px;">

        <div class="navpet  clearfix">
            <div class="pettit fl cat">
                <span></span>
                <h2>猫猫商品</h2>
            </div>
            <div class="navtit fl">
                <asp:DataList ID="DlGoodsType4" runat="server"  RepeatDirection="Horizontal" RepeatColumns="8" HorizontalAlign="Justify" Width="750px">
                <ItemTemplate>
                        <span class="brief">
                        <a href='<%#Eval("id", "ShangPinTypeList.aspx?id={0}")%>'class='<%#Eval("id", "ShangPinTypeList.aspx?id={0}")%>' onmouseover="console.log(document.getElementById('listIframe_cat').src='ShangPinTypeListIframe.aspx?id=<%#Eval("id")%>')">
                            <%#Eval("name").ToString().Substring(2,2)%>
                        </a>
                    </span> 
                </ItemTemplate>
            </asp:DataList>
            </div>
        </div>

        <div class="content_pet">
            <a href="SearchShangPinList.aspx?ShangPinName=伟嘉&ShangPinTypeName=所有类别"><div class="content_l cat"></div></a>
            <div class="content_c"> 
                <iframe id="listIframe_cat" src="ShangPinTypeListIframe.aspx" width="100%" height="421px" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>  
                 <ul class="vendor">
                    <li> <a href="#"><img src="image/vendor/cat_1.jpg" alt="Alternate Text" title="美食厨房"/></a></li>
                    <li> <a href="#"><img src="image/vendor/cat_2.jpg" alt="Alternate Text" title="欧帝亿"/></a></li>
                    <li> <a href="#"><img src="image/vendor/cat_3.jpg" alt="Alternate Text" title="维斯康"/></a></li>
                    <li> <a href="#"><img src="image/vendor/cat_4.jpg" alt="Alternate Text" title="喜跃"/></a></li>
                    <li> <a href="#"><img src="image/vendor/cat_5.jpg" alt="Alternate Text" title="卫塔卡夫"/></a></li>
                    <li> <a href="#"><img src="image/vendor/cat_6.jpg" alt="Alternate Text" title="优基"/></a></li>
                    <li> <a href="#"><img src="image/vendor/cat_7.jpg" alt="Alternate Text" title="珍宝"/></a></li>
                    <li><a href="SearchShangPinList.aspx?ShangPinName=伟嘉&ShangPinTypeName=所有类别"><img  class="last" src="image/vendor/weijia.jpg" alt="Alternate Text" title="伟嘉"/></a></li>

                </ul>
             </div>
             <div class="content_r">
                 <p>波奇推荐</p>
                 <iframe src="ShangPinTypeListIframeLitter.aspx?category=cat" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
             </div>
        </div>
    </div> 

  



  

<script>        
    var mySwiper = new Swiper('.swiper-container', {
        direction: 'horizontal', 
        loop: true, // 循环模式选项
        autoplay:true,

        // 如果需要分页器
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: true,
            clickableClass: 'my-pagination-clickable',
            autoplayDisableOnInteraction: false,
            preventLinksPropagation: true
        }

    })
  </script>

</asp:Content>
