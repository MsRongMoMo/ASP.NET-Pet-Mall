<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsTypeList.aspx.cs" Inherits="NewsTypeList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .box {
            height:600px;
            margin:0 auto;
            
        }
        .article_title {
           height:45px;
           line-height:45px;
           width:100%;
        }
        .category:hover,.category a:hover,.article a:hover {
            color:#ee5533;
            
        }
        .article {
      
             width:45%;
             display:inline-block;
        }
        .addTime {
            text-align:right;
             width:30%;
              display:inline-block;
        }
        .category {
            text-align:right;
             width:15%;
                display:inline-block;
        }
    </style>
    <div class="box layout">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" Width="1000px">
                            <ItemTemplate>
                                <div class="article_title">
                                    <span class="category">
                                        
                                         【<a href='<%#Eval("TypeName","NewsTypeList.aspx?TypeName={0}")%>'>
                                        <%#Eval("TypeName").ToString().Length > 25 ? CutChar(Eval("TypeName").ToString(), 32) + "..." : Eval("TypeName")%>
                                    </a>】
                                    </span>
                                    <span class="article">
                                          <a href='<%#Eval("id","NewsInfo.aspx?id={0}")%>'>
                                        <%#Eval("name").ToString().Length > 25 ? CutChar(Eval("name").ToString(), 32) + "..." : Eval("name")%>
                                    </a> 
                                    </span>
                                        
                                    <span class="addTime"> <asp:Label ID="Label2" runat="server" Height="20px" Text='<%# DataBinder.Eval(Container, "DataItem.Addtime") %>'></asp:Label></span>
                                </div>
                                 
                            </ItemTemplate>
                        </asp:DataList>
       
</div>

         <table class="layout">
                <tr>
                    <td align="center" bgcolor="#fbfbfb" class="middle_border_1 margin_middle1" style="width: 661px;
                        height: 38px">
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
   
</asp:Content>

