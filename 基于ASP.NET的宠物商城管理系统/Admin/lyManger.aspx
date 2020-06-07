<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lyManger.aspx.cs" Inherits="admin_lyManger" %>

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
</table>
     <asp:Label ID="Label4" runat="server" ForeColor="Red" Text=""></asp:Label></td>
</tr>
</table>
    </div>
        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td class="C_Left_03" style="width: 9px">&nbsp;</td>
        <td class="C_Middle">
                        <asp:GridView ID="gvliuyan" runat="server"  AllowPaging="True"  AutoGenerateColumns="False"
                            BackColor="White" CellPadding="5" DataKeyNames="id" OnPageIndexChanging="gvFilms_PageIndexChanging"
                            OnRowDataBound="gvFilms_RowDataBound"  PageSize="10" Width="100%">
                            <Columns>
                               
                                <asp:TemplateField HeaderText="用户">
                             <ItemStyle HorizontalAlign="Left" Width="80px" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  
                                <asp:TemplateField HeaderText="电子邮件">
                             <ItemStyle HorizontalAlign="Left" Width="80px" />
                                    <ItemTemplate>
                                        <asp:Label ID="useremail" runat="server" Text='<%# Bind("useremail") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                     
                                
                                     
                                
                               
                                   <asp:TemplateField HeaderText="留言内容">
                             <ItemStyle HorizontalAlign="Left" Width="200px" />
                                    <ItemTemplate>
                                        <asp:Label ID="lybcontent" runat="server" Text='<%# Bind("lybcontent") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="添加日期" SortExpression="Addtime">
                                  
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Addtime","{0:d}") %>' Width="98px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                       
                                <asp:TemplateField HeaderText="回复">
                                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Huifu.aspx?id="+Eval("id") %>'
                                            Text="回复" Width="100px"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="选择">
                                    <HeaderTemplate>
                                        选择</HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="40px" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#F6F6F6" />
                            <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPreviousFirstLast"
                                NextPageText="下一页" PageButtonCount="12" PreviousPageText="上一页" />
                            <RowStyle HorizontalAlign="Left" />
                            <PagerStyle BackColor="#F6F6F6" HorizontalAlign="Left" />
                            <PagerTemplate>
                                <table border="0" width="100%">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page" 
Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">首页 </asp:LinkButton> 
<asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev" CommandName="Page" 
Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != 0 %>">上一页 </asp:LinkButton> 
<asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page" 
Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">下一页 </asp:LinkButton> 
<asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page" 
Visible=" <%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>">尾页 </asp:LinkButton> 共 <asp:Label ID="LabelPageCount" runat="server" 
Text=" <%# ((GridView)Container.NamingContainer).PageCount %>"> </asp:Label>页   
第 <asp:Label ID="Label2" runat="server" Text=" <%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"> </asp:Label>页                    
                                        </td>
                                        <td align="right" width="20%">
                                          </td>
                                    </tr>
                                </table>
                            </PagerTemplate>
                        </asp:GridView>
		</td>
					<td class="C_Left_04">&nbsp;</td>
				</tr>
				<tr>
					<td class="C_Left_03" vAlign="bottom" style="width: 9px"><IMG height="8" src="Images/Admin_48.gif" width="8"></td>
					<td class="C_Left_02">&nbsp;<asp:Button ID="btnSelectAll" runat="server" OnClick="btnSelectAll_Click" Text="全选" /><asp:Button ID="btnDel" runat="server" OnClick="btnDel_Click" OnClientClick="javascript:return confirm('确定删除所新闻么？');"
                                                Text="删除" /></td>
					<td class="C_Left_04" vAlign="bottom" width="8"><IMG height="8" src="Images/Admin_51.gif" width="8"></td>
				</tr>
    </table>
   
    </form>
</body>
</html>
