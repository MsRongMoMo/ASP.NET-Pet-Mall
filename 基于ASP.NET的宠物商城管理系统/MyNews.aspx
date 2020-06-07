<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyNews.aspx.cs" Inherits="MyNews" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
             p {
            margin:15px 200px;
            font-size:16px;
            color:#333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <p>我的消息</p>
            <div class="fr news">
          
                <span> 您好:<asp:Label ID="Label1" runat="server" ForeColor="#FF8000" Text="Label"></asp:Label></span>
                <span>，欢迎您回来！ 您有未读消息<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Red"  target="show-info"
                                    PostBackUrl="~/userme.aspx">
                                    </asp:LinkButton></span>
                <span> 条!&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black"   target="show-info"
                                    PostBackUrl="~/userme1.aspx">查看已读消息</asp:LinkButton>

                </span>
               
                       
                    </div>   

    </form>
</body>
</html>
