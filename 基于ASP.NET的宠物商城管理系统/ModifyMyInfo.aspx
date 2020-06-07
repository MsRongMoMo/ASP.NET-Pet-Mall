<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="ModifyMyInfo.aspx.cs" Inherits="ModifyMyInfo" %>
<%@ Register Src="usedd.ascx" TagName="usedd" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico">
    <style>
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
        }
               p {
            margin:15px 300px;
            font-size:16px;
            color:#333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>修改个人资料</p>
    <table cellpadding="2" class="registeInfo layout">
        <tr>
            <td id="TD1" align="right" style="height: 35px" width="120">
                登录帐号：</td>
            <td style="height: 35px">
                <asp:TextBox ID="txtname" runat="server" Width="109px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                    ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="height: 35px" width="120">
                姓名：</td>
            <td style="height: 35px">
                <asp:TextBox ID="XingMing" runat="server" Width="166px"></asp:TextBox></td>
        </tr>
        <tr style="color: #000000">
            <td align="right">
                性别：</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="89px">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
                 
        <tr style="color: #000000">
            
            <td align="right">
        
         <asp:Image ID="Image1" runat="server" Width="126px" /><br />
                </td>
                    <asp:TextBox ID="pic" runat="server" CssClass="inputBox" ReadOnly="True" Width="72px" Visible="false"></asp:TextBox>
            <td><input id="file1" runat="server" class="inputBox" style="width: 141px" type="file" />&nbsp;</td>
                    <td><asp:Button ID="updataImg" runat="server" OnClick="updataImg_Click" Text="上传图片" /></td>
                    <td><asp:Label ID="Label1" runat="server" Visible="False" Width="60px"></asp:Label></td>
        </tr>



    <tr style="color: #000000">
      
                                                    <td style="text-align: right" class="wordtip">收货地址:</td>
                                                    <td style="text-align: left;color:red" class="wrap_txt  noborder">
                                                        
                                                        <uc1:usedd ID="Usedd1" runat="server" />

                                                    </td>
                                                </tr>
                                                <tr style="color: #000000">
                                                    <td style="text-align: right" class="wordtip">详细地区:</td>
                                                    <td style="text-align: left;color:red" class="wrap_txt">
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
                                                     </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4"
                                                            ErrorMessage="请输入详细地址！"></asp:RequiredFieldValidator>
                                                    </td>
                                           
        
            <td align="right">
            </td>  
        <td>
            <asp:TextBox ID="Address" runat="server" Width="401px" style="display:none"></asp:TextBox></td>
          
    </tr>
        <!--
        <tr>
            <td align="right">
                年龄：</td>
            <td>
                <asp:TextBox ID="Age" runat="server" Width="58px"></asp:TextBox></td>
        </tr>
        -->
        <tr>
            <td align="right">
                电子邮件：</td>
            <td>
                <label for="ksIDType3">
                    <asp:TextBox ID="txtemal" runat="server" Width="166px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemal"
                        ErrorMessage="格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemal"
                        ErrorMessage="必填"></asp:RequiredFieldValidator></label></td>
        </tr>
        <tr>
            <td align="right" style="height: 18px">
                联系电话：</td>
            <td style="height: 18px">
                <asp:TextBox ID="Tel" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="right" style="height: 127px">
                用户描述：</td>
            <td style="height: 127px">
                <asp:TextBox ID="txtds" runat="server" Height="115px" TextMode="MultiLine" Width="473px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" CssClass="btn" /></td>
        </tr>
    </table>

        </form>
    <script type="text/javascript">
        $(document).ready(function () {
            
            var address = document.getElementById('<%= Address.ClientID%>').value;
            
            var province = address.indexOf('省');
            var s1 = address.substring(0, province+1);
            var city = address.indexOf('市');
            var s2 = address.substring(province+1, city+1);
            var region = address.indexOf('区');
            var s3 = address.substring(city + 1, region + 1);
            var area = address.substring(region + 1);
           document.getElementById('<%= TextBox4.ClientID%>').value=area;
           
	$(".ChinaArea").jChinaArea({
		 aspnet:true,
		 s1,//默认选中的省名
		 s2,//默认选中的市名
		 s3//默认选中的县区名
	})
})
</script>
    </body>

