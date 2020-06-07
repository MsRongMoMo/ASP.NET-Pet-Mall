<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserHome" Title="Untitled Page" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="style/UserHome.css" rel="stylesheet" />
    <div class="layout clearfix">
        <div class="fl info">
             <div>
                <h3>我的消息</h3>
                <p><a href="MyNews.aspx" target="show-info" id="mynews">我的消息</a></p>
            </div>
            <div>
                <h3>交易记录</h3>
                <p><a href="OrderInfo.aspx" target="show-info" id="myorder">我的订单</a></p>
            </div>
            <div>
                <h3>个人设置</h3>
                <p><a href="ModifyMyInfo.aspx" target="show-info">个人资料</a></p>
                <p><a href="AddMoney.aspx" target="show-info">充值中心</a></p>
                <p><a href="MMPwd.aspx" target="show-info">修改密码</a></p>
            </div>
        </div>
       
        
           
            <iframe class="fr show-info" name="show-info">
                  
            </iframe>  

      
        
    </div>


    <!--默认选中我的订单-->
    <script src="js/jquery-1.3.2.min.js"></script>
<script>
    $(function () {
        document.getElementById("myorder").click();
    })
</script>

   


</asp:Content>


