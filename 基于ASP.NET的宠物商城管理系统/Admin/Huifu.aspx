<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Huifu.aspx.cs" Inherits="Admin_Huifu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   <title>无标题页</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css"/>
</head>
<body >
    <form id="form1" runat="server">
    <div>
    <table width="98%" border="0" cellpadding="0" cellspacing="1" bgcolor="#e3ebfe" align="center">
<tr>
 <td style="height: 25px" >
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td align="center" style="height: 22px">
                          留言信息管理</td>
 </tr>
</table><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="96" align="center" valign="top"><table width="95%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="ShopInfo">
													<tr>
													  <td colspan="2" align="left" valign="middle" style="width: 1198px;" >
                                                          &nbsp;
                                                          <asp:TextBox ID="TextBox1" runat="server" Height="126px" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
											  </tr>
													<tr>
													  <td height="34" colspan="2" align="center" valign="middle" style="width: 1198px">
                                                          &nbsp;<asp:Button ID="btnAdd" runat="server" Text="回复" Width="102px" OnClick="btnAdd_Click" />
                                                        </td>
											  </tr>
												</table>											</td>
										</tr>
								</table>								</td>
						    </tr>
						</table>
					</td>
					<td class="C_Left_04">&nbsp;</td>
				</tr>
				
			</table>
    </form>

</body>
</html>
