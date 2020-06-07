<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico">
     <link href="style/reset.css" rel="stylesheet" />
    <link href="style/user.css" rel="stylesheet" />
    <style>
        ul li.verify {
            margin-bottom:100px;
        }
       .verify .verify_word {
            font-size:16px;
            color:#777;
        }
            .verify .input {
                width:250px;
                height:38px;
                line-height:38px;
                padding:5px;
                border:1px solid #ccc;
                outline:none;
            }
        .verify .verify_num {
            display:inline-block;
            width:70px;
            height:30px;
            background-color:#ff6655;
            color:#fff;
            line-height:30px;
            text-align:center;
            vertical-align:middle;
            font-size:16px;
            border-radius:18px;
            
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="topnav_box layout" >
            <div class="layout topnav clearfix">
                    <div class="mr50"><a href="UserLogin.aspx">登 录</a></div>
                        <div class="nomargin">|</div>
                    <div><a href="UserRegister.aspx">注 册</a></div>
            </div>
        </div>

        <div class="search_box">
            <div class="search layout clearfix">
                  <asp:Image ID="Image1" runat="server" ImageUrl="~/image/logo.png" CssClass="logo fl"/>
                  <span class="user_reg">|  用户登录</span>
             </div>
         </div>

         <div class="clearfix layout input_bg login">   
             <div class="fl"><img src="image/register_banner.jpg" alt="Alternate Text" /></div>
             <ul cellpadding="2" class="fl " >
                  <li>
                      <span class="wrap_txt user">
                            <img class="wordtip" src="image/user_icon.png"/>
                            <asp:TextBox ID="TxtUserName" runat="server" ValidationGroup="3" CssClass="textbox" placeholder="请输入用户帐号"></asp:TextBox>
                        </span>   
                   </li>
                
                   <li>
                       <span class="wrap_txt">
                           <img class="wordtip" src="image/pwd_icon.png"/>
                               <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" ValidationGroup="3" CssClass="textbox"></asp:TextBox>
                        </span>
                    </li>

                   <li>
                        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                   </li>


                    <li class="verify">
                        <p>
                            <span class="verify_word">验证码:</span>
                            <span><asp:TextBox ID="txtyan" runat="server" CssClass="input"></asp:TextBox></span>
                            <span><asp:Label ID="lblyanzheng" runat="server" CssClass="verify_num"></asp:Label></span>
                            
                         </p>
                     </li>

                    <li>                    
                         <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="登  陆" ValidationGroup="3"  CssClass="registerBtn"/>
                    </li>
            </ul>
       </div> 
    </form>
</body>
</html>
