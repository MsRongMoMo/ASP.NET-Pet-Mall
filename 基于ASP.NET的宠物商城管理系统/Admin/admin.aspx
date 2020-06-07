<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs"  ValidateRequest="false" EnableEventValidation="false"  Inherits="Admin_admin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>管理员信息管理</title>
    <script src="js/jquery-1.8.0.min.js"></script>
    <style>
        .currentUser {
            text-align:center;
        }
    </style>
</head>
<body>
     <form runat="server" id="form1">

         <p class="currentUser">
            欢迎您： <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            您的身份：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
         </p>

    <table style="width: 80%">
        
      
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    BorderColor="#E0E0E0" BorderWidth="1px" CellPadding="3" CellSpacing="1"
                    DataKeyNames="id"  GridLines="None" Width="90%" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="编号" InsertVisible="False" ReadOnly="True"
                            SortExpression="id" />
                        <asp:BoundField DataField="admin" HeaderText="管理员" SortExpression="admin" InsertVisible="False" ReadOnly="True"/>
                        <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" />
                        <asp:BoundField DataField="roleName" HeaderText="角色" SortExpression="roleName" />
                        <asp:TemplateField HeaderText="操作" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="Update"
                                    Text="更新"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server"  CommandName="Cancel"
                                    Text="取消"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="roleName" runat="server" Text='<%# Eval("roleName") %>' Visible="false"></asp:Label>
                                <asp:Label ID="admin" runat="server" Text='<%# Eval("admin") %>' Visible="false"></asp:Label>
                                <asp:LinkButton ID="LinkButton1"  runat="server" CommandArgument='<%# Eval("id") %>' CommandName="Edit"
                                    Text="编辑"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="Delete"
                                   Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="White" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <HeaderStyle BackColor="#F3F8F7" Height="25px" Font-Bold="True" ForeColor="#73938E" />
                    <AlternatingRowStyle BackColor="#F3F8F7" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Panel runat="server" ID="addAmin" Visible="false">
                      <table style="border-right: #666699 1px solid; border-top: #666699 1px solid; border-left: #666699 1px solid; width: 90%; border-bottom: #666699 1px solid">
                    <tr>
                        <td colspan="2" style="text-align: left">添加管理员</td>
                    </tr>
                    <tr>
                        <td style="text-align: right">管理员</td>
                        <td style="text-align: left">
                            <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="用户名不能为空！"></asp:RequiredFieldValidator>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" OnClick="Button2_Click"
                                 Text="检测用户名" Width="85px" />
                        </td>
                       
                    </tr>
                       <tr>
                        <td style="height: 50px; text-align: right">所属角色</td>
                         <td style="text-align: left">
                              <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" >
                                    <asp:ListItem  Text="普通管理员" Value="0"></asp:ListItem>
                                      <asp:ListItem Selected="True" Text="超级管理员" Value="1"></asp:ListItem>
                               </asp:RadioButtonList>
                         </td>
                    </tr>
                    <tr>
                        <td style="height: 26px; text-align: right">密码</td>
                        <td style="height: 26px; text-align: left">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="200px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 26px; text-align: right">重复密码</td>
                        <td style="height: 26px; text-align: left">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                                ControlToValidate="TextBox3" ErrorMessage="密码不一致"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: left">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: left">
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label></td>
                    </tr>
                </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
      </form>
</body>
</html>  


