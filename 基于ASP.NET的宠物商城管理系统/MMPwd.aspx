<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="MMPwd.aspx.cs" Inherits="MMPwd" %>

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
            margin-left:100px;
        }
               p {
            margin:15px 150px;
            font-size:16px;
            color:#333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <p>修改密码</p>
    <table cellpadding="2" class="registeInfo layout">
     
        <tr>
            <td id="TD1" align="right" style="height: 35px" width="120">
                原密码：</td>
            <td style="height: 35px">
                <asp:TextBox ID="txtpwd1" runat="server" TextMode="Password" Width="142px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpwd1"
                    Display="Dynamic" ErrorMessage="密码不能空"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="height: 35px" width="120">
                新密码：</td>
            <td style="height: 35px">
                <asp:TextBox ID="txtpwd2" runat="server" TextMode="Password" Width="138px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd2" Display="Dynamic"
                    ErrorMessage="密码不能空"></asp:RequiredFieldValidator></td>
        </tr>
        <tr style="color: #000000">
            <td align="right" style="height: 35px" width="120">
                确认密码：</td>
            <td style="height: 35px">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="138px"></asp:TextBox><asp:CompareValidator
                    ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="txtpwd2"
                    Display="Dynamic" ErrorMessage="密码不一致"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  CssClass="btn" Text="修改" />
                <br />
                <asp:Label ID="LabelWarningMessage" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
    </form>
    </body>


