<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="AddPingJia.aspx.cs" Inherits="AddPingJia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link rel="icon" href="image/favicon.ico" />
    <style>
        .box {
            height:700px;
        }
                 .btn {
            width: 210px;
            height: 50px;
            line-height: 50px;
            color: #fff;
            background-color: #ee5533;
            margin-top: 10px;
            outline: none;
            border: 0;
            font-size: 18px;
            margin-left:300px;
        }
        .textbox {
            Height:80px;
            Width:800px;
            outline:none;
            resize:none;
             padding:16px;
             font-size:14px;
        }
        img {
            width:30px;
            height:30px;
            border-radius:50%;
            overflow:hidden;
           

        }
        .name {
            color:#ccc;
            font-size:12px;
            text-align:left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   
        <div class="box">
            <h4>填写评论</h4>
                <asp:TextBox ID="TextBox2" runat="server"  TextMode="MultiLine" Width="800px" CssClass="textbox"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="评论" OnClientClick="return alert('评论成功！')" CssClass="btn"/>
            <h4>商品评论信息</h4>
                <asp:DataList ID="DataList2" runat="server" Width="100%">
                    <ItemTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 70%">评论人：<img src='<%#Eval("Photo","files/{0}")%>' alt="Alternate Text" /><%#Eval("UserName").ToString().Substring(0,1)+"***"+Eval("UserName").ToString().Substring(Eval("UserName").ToString().Length-1)%></td>
                                <td style="width:10%" class="name"><%#Eval("AddTime", "{0:d}")%></td>
                            </tr>
                            <tr>
                                <td style="width: 90%">
                                    内容：<%#Eval("Titles")%>
                                </td>
                            </tr>
                        </table>
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
        </div>

        <table>
        <tr>
            <td align="center" bgcolor="#ffffff" colspan="3" style="height: 24px">
                共【<asp:Label ID="lblSumPage" runat="server"></asp:Label>】页 &nbsp; &nbsp; &nbsp;
                当前第【<asp:Label ID="lblCurrentPage" runat="server"></asp:Label>】页&nbsp;
                <asp:HyperLink ID="hyfirst" runat="server">首页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="lnkPrev" runat="server">上一页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <asp:HyperLink ID="lnkNext" runat="server">下一页</asp:HyperLink>
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                <asp:HyperLink ID="hylastpage" runat="server">尾页</asp:HyperLink>
            </td>
        </tr>
    </table>
        </form>
    </body>
    </html>


