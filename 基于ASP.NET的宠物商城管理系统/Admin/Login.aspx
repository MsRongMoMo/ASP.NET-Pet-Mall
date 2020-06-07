<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>用户登录页面</title>
    <STYLE type="text/css">
<!--
body {
	margin: 0px;
	background-color: #0056ba;
	font-size: 12px;
}
input{font-family : tahoma, verdana, 宋体, fantasy;font-size: 12px;}
.all {
	height: 550px;
}
td {
	color: #FFFFFF;
}
.all .input {
	height: 15px;
	font-size: 12px;
	border: 1px solid #003673;
	filter:Alpha(opacity=30);
}
.all .wz {
	margin-left: 20px;
	margin-top: 0px;
	margin-bottom: 5px;
}
.all .bq {
	padding-right: 8px;
	padding-top: 6px;
}
.all .gldl {
	padding-bottom: 10px;
}
-->
</STYLE>
</head>
<body>
    <form id="form1" runat="server">
   <DIV class="all">
<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TBODY>
  <TR>
    <TD height="365" align="center" valign="bottom">
      <TABLE width="438" background="images/v4_dlbg.gif" border="0" 
      cellspacing="0" cellpadding="0">
        <TBODY>
        <TR>
          <TD width="19" height="128"><IMG width="19" height="259" src="images/v4_lbg.gif"></TD>
          <TD width="404" align="center" valign="top">
            <TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
              <TBODY>
              <TR>
                <TD align="center" class="gldl"><IMG width="193" height="64" 
                  src="images/v4_gldl.gif"></TD></TR>
              <TR>
                <TD align="center"><IMG width="345" height="2" src="images/v4_hx.gif"></TD></TR>
              <TR>
                <TD height="137" align="center">
                  <TABLE width="97%" class="wz" background="images/v4_bg.gif" 
                  border="0" cellspacing="0" cellpadding="0">
                  
                    <TBODY>
                    <TR>
                      <TD height="115">
                        <TABLE width="100%" align="center" border="0" 
                        cellspacing="0" cellpadding="0">
                          <TBODY>
                          <TR>
                            <TD width="16%" align="right" style="height: 22px">用户名称:</TD>
                            <TD align="left" colspan="4" style="height: 22px">
                                <asp:TextBox ID="TxtUserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="fileusename" runat="server" ControlToValidate="TxtUserName" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator></TD>
                            </TR>
                          <TR>
                            <TD width="16%" align="right">管理账号:</TD>
                              <td align="left" colspan="4">
                                  <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Width="121px"></asp:TextBox><asp:RequiredFieldValidator
                                      ID="filepass" runat="server" ControlToValidate="TxtPassword" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator></td>
                          </TR>
                          </TBODY></TABLE>
                        <TABLE width="100%" align="center" border="0" 
                        cellspacing="0" cellpadding="0">
                          <TBODY>
                          <TR>
                            <TD width="16%" align="right">验证码:</TD>
                            <TD width="18%" align="left">
                                <asp:TextBox ID="txtyan" runat="server" Width="85px"></asp:TextBox></TD>
                            <TD width="30%" align="left">
                                <asp:Label ID="lblyanzheng" runat="server" BackColor="DeepSkyBlue" ForeColor="#004000"></asp:Label></TD>
                            <TD width="38%" align="left"><INPUT style="width: 109px; height: 46px;" 
                              type="image" 
                          src="images/v4_dl.gif" id="Image1" onserverclick="Image1_ServerClick" runat="server"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD height="35" align="right" class="bq"></TD></TR></TBODY></TABLE></TD>
          <TD width="15"><IMG width="15" height="259" src="images/v4_rbg.gif"></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height="82" align="center"><IMG src="images/v4_by.gif" 
    border="0"></TD></TR></TBODY></TABLE></DIV>
    </form>
</body>
</html>
