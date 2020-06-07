<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMoney.aspx.cs" Inherits="AddMoney"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico">
    <style>
        p {
            margin:15px 200px;
            font-size:16px;
            color:#333;
        }
        .layout div{
            margin:15px;
            font-size:16px;
            color:#999;
        }
         .btn {
            width: 210px;
            height: 50px;
            line-height: 50px;
            color: #fff;
            background-color: #ee5533;
            margin-right: 30px;
            margin-top: 20px;
            outline: none;
            border: 0;
            font-size: 18px;
            margin-left:100px;
        }
        .no_outline {
            outline:none;
            padding:8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="layout">
        <p>充值中心</p>
        <div>现有金额：<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></div>
       
            <div>
                充值途径：
                <asp:DropDownList
                    ID="DropDownList1" runat="server"  Width="280px"  CssClass="no_outline">
                    <asp:ListItem Heigh="40px">银行卡</asp:ListItem>
                    <asp:ListItem>支付宝</asp:ListItem>
                    <asp:ListItem>微信</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                 充值金额：
                <asp:TextBox
                    ID="txtLoginName" runat="server" Font-Size="16pt" Width="280px" Heigh="40px" CssClass="no_outline"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLoginName" runat="server" ControlToValidate="txtLoginName"
                    Font-Size="12pt" Height="1px" Width="27px">*</asp:RequiredFieldValidator>
            </div>
     
               
       
       
        <div>
            
                <asp:Button ID="btnRegister" runat="server" Font-Size="12pt" OnClick="btnRegister_Click" CssClass="btn"
                    Text="充值" />
        </div>
     
    </div>
</form>
    <script>
       
        /*document.getElementById("*/<%= btnRegister.ClientID %>/*").onclick = function () {
            var path = location.pathname + location.search;
            if (path == "/AddMoney.aspx?action=recharge") {
                history.go(-1);
            }
        }*/
    </script>
 </body>
  </html>

