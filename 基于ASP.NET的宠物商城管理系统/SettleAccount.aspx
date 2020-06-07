
<%@ Page Language="C#" MasterPageFile="~/ShoppingList_CheckOut.master" AutoEventWireup="true"  CodeFile="SettleAccount.aspx.cs" Inherits="SettleAccount" Title="Untitled Page" %>

<%@ Register Src="usedd.ascx" TagName="usedd" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
         .wordtip{
        height: 45px;
        width: 100px;
        text-align: right;
        display: inline-block;
        line-height:45px;
        padding-right:15px;
    }
        .multiline_tip {
             height:130px;
        width: 100px;
        text-align: right;
        display: inline-block;
        line-height:130px;
        padding-right:15px;
            margin:10px 0px;
        }

    .wrap_txt{
        width: 352px;
        height: 45px;
        padding: 0 10px;
        border:1px solid #ccc;
        box-sizing: border-box;
        display: inline-block;
        margin:5px 0;
    }
   .muliline_txt {
            width:352px;
              height:130px;
              line-height:75px;
               padding: 0 10px;
        border:1px solid #ccc;
        box-sizing: border-box;
        display: inline-block;
        margin:10px 0px;
        }

        .noborder {
            border:0;
            padding:0;
            line-height:45px;
        }
    .wrap_txt .textbox{
        width: 330px;
        height:43px;
        padding: 5px 0;
        line-height: 43px;
        /* background-color: #fff; */
        box-sizing: border-box;
        outline: none;
        border: none;

       
    }
      .multiline_textbox {
          resize:none;
          outline:none;
       
          width:350px;
          margin:10px 0px;
              height:120px;
              position:relative;
              left:-450px;
       
          
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
        }
   
    </style>

     <table style="width: 900px;margin:20px auto">
        <tr>
            <td colspan="4">
                <table cellpadding="0" cellspacing="0" width="900">
                    <tr>
                        <td colspan="3">
                            <asp:Panel ID="Panel2" runat="server" Width="100%">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="height: 30px; text-align: left; font-weight: bold; font-size: 18px; color: #ee5533;">填写收货人信息</td>
                                    </tr>
                                   
                                    <tr>
                                                <td class="wordtip" style="text-align: right">收货人姓名:</td>
                                                <td class="wrap_txt" style="text-align: left;color:red">
                                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="textbox"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="请输入收货人！"></asp:RequiredFieldValidator>
                                                </td>
                                    <tr style="color: #000000">
                                        <td class="wordtip" style="text-align: right">手机号码:</td>
                                        <td class="wrap_txt" style="text-align: left;color:red">
                                            <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="phonetbrfv" runat="server" ControlToValidate="TextBox6" ErrorMessage="请输入手机号码"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="手机号码格式不正确" ValidationExpression="^1[34578]\d{9}$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr style="color: #000000">
                                        <td class="wordtip" style="text-align: right">收货地址:</td>
                                        <td class="wrap_txt  noborder" style="text-align: left;color:red">
                                            <uc1:usedd ID="Usedd1" runat="server" />
                                        </td>
                                    </tr>
                                    <tr style="color: #000000">
                                        <td class="wordtip" style="text-align: right">详细地区:</td>
                                        <td class="wrap_txt" style="text-align: left;color:red">
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="请输入详细地址！"></asp:RequiredFieldValidator>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Address" runat="server" style="display:none" Width="401px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="multiline_tip" style="text-align: right">备注信息:</td>
                                        <td class="multiline_txt" style="text-align: left;color:red">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass=" multiline_textbox" Height="120px" TextMode="MultiLine" Width="350px">
                                                        </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td rowspan="1" width="10"></td>
                                        <td></td>
                                    </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr style="margin-top:20px;">
                                        <td style="height: 30px; text-align: left; font-weight: bold; font-size: 18px; color: #ee5533;" >送货方式(支持货到付款)</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="普通邮递(5元)" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="普通快递送货上门(10元)" Selected="True" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="邮件特快专递(15元)" Value="15"></asp:ListItem>
                                            </asp:RadioButtonList></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold; font-size: 18px; color: #ee5533; height: 30px;" >付款方式</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" >
                                                <asp:ListItem  Text="货到付款" Value="0"></asp:ListItem>
                                                <asp:ListItem Selected="True" Text="会员结算" Value="1"></asp:ListItem>
                                            </asp:RadioButtonList></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" PostBackUrl="~/ShoppingCart.aspx" Text="返回购物车" CausesValidation="False" CssClass="btn"/>&nbsp;
                                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="下一步" CssClass="btn"/></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Panel ID="Panel1" runat="server" Width="100%">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="text-align: left; font-weight: bold; font-size: 18px; color: #ee5533; height: 30px;">购买的宠物</td>
                                    </tr>
                                     
                                    <tr>
                                        <td>
                                            <asp:GridView ID="MyGrid" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ShangPinID"
                                                HeaderStyle-BackColor="Honeydew" HeaderStyle-ForeColor="RoyalBlue" HeaderStyle-HorizontalAlign="center"
                                                Width="100%" >
                                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="名称">
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <ItemTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="10"></td>
                                                                    <td colspan="3">
                                                                        <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'>
                                                                            <asp:Image ID="Image1" runat="server" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("ShangPinPhoto","files/{0}") %>'
                                                                                Style="width: 80px; height: 80px" /></a>
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ShangPinID", "ShowShangPin.aspx?id={0}") %>'
                                                                            Target="_blank" Text='<%# Eval("ShangPinName") %>'></asp:HyperLink><asp:Label ID="Label1"
                                                                                runat="server" Text='<%# Bind("ShangPinID") %>' Visible="False"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="10"></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ShangPinPrice" HeaderText="单价(元)">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="数量">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PurchaseCount") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="bianhao" runat="server" Text='<%# Eval("ShangPinID") %>' Visible="False"></asp:Label><asp:Label
                                                                ID="PurchaseCount" runat="server" Text='<%# Eval("PurchaseCount") %>'></asp:Label>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="小计(元)">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TotalPrice") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle ForeColor="#FF8000" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TotalPrice") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle ForeColor="#000066" />
                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                                <HeaderStyle BackColor="#f1775c" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                            </asp:GridView>
                                         
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold; font-size: 18px; color: #333399; height: 15px; text-align: left"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold; font-size: 18px; color: #ee5533; height: 30px; text-align: left">收货人信息</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 300px; height: 25px; text-align: right">收货人姓名：</td>
                                                    <td rowspan="1" width="10" style="height: 25px"></td>
                                                    <td style="height: 25px; text-align: left">
                                                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 300px; height: 25px; text-align: right">联系电话：</td>
                                                    <td rowspan="1" style="height: 25px" width="10"></td>
                                                    <td style="height: 25px; text-align: left">
                                                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 300px; height: 25px; text-align: right">收货详细地址：</td>
                                                    <td rowspan="1" style="height: 25px" width="10"></td>
                                                    <td style="height: 25px; text-align: left">
                                                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                                                </tr>
                                                
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: bold; font-size: 18px; color: #ee5533; height: 30px; text-align: left">支付方式</td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px">
                                            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px"></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px"></td>
                                    </tr>
                                      <tr>
                                        <td style="text-align: right; height: 5px;">&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" ForeColor="#ee5533" Visible="false">Label</asp:Label></td>
                                    </tr>
                                 
                                     <tr>
                                        <td style="text-align: right; height: 5px;">&nbsp;&nbsp;
                            <asp:Label ID="SettleCountMoney" runat="server" Visible="false">Label</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="previous" runat="server" CausesValidation="False"  CssClass="btn" Text="返回信息填写"
                                                 OnClick="previous_Click" />
                                            <asp:Button ID="next" runat="server" CssClass="btn"
                                                OnClick="next_Click" Text="下一步"/></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <!--
                           <asp:Label ID="Label5" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                           <asp:Label ID="Label6" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                                   
                       -->
                    </tr>
                    <tr>
                            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                     
                    </tr>
                </table>
            </td>
        </tr>
    </table>
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
            document.getElementById('<%= TextBox4.ClientID%>').value = area;
            console.log(s1,s2,s3)
           
	$(".ChinaArea").jChinaArea({
		 aspnet:true,
		 s1,//默认选中的省名
		 s2,//默认选中的市名
		 s3//默认选中的县区名
	})
        })
          </script>
 </asp:Content>
