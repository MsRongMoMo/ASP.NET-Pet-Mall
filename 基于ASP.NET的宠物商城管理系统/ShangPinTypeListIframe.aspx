<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShangPinTypeListIframe.aspx.cs" Inherits="ShangPinTypeListIframe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="style/reset.css" rel="stylesheet" />
    <link href="style/masterPage.css" rel="stylesheet" />
    <base target="_blank" />
    <style>
        ul li{
    float: left;
    width: 200px;
    height: 210px;
    padding:20px 12px 15px;
    box-sizing: border-box;
}
 ul li img{
    width: 120px;
    height: 120px;
    position: relative;
    left: 28px;
    
}
   ul li  .word {
           
            width:174px;
            height:26px;
            display:block;
        }
 ul li .keyword{
    color:#666;
    font-size: 14px;
    padding: 7px 0;
    text-overflow:ellipsis;
     white-space:nowrap;
    overflow:hidden;


}
ul li .price{
color:#ee5533;
font:14px;
}
 ul li .sellCount{
    font-size: 12px;
    color:#666;
    margin-left: 40px;

}
 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                  <asp:DataList ID="DataList4" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="800px" Height="421px" HorizontalAlign="Left">
                        <ItemTemplate>     
                          <ul>
                             <li class="good">
                               <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'> <img src='files/<%#Eval("ShangPinPhoto")%>' alt="Alternate Text" /></a>
                                 <a class="word" href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>' ><p class="keyword"><%#Eval("ShangPinName").ToString().Length > 25 ? CutChar(Eval("ShangPinName").ToString(), 32) + "..." : Eval("ShangPinName")%></p></a>
                                  <p><span class="price">¥  <%#Eval("ShangPinPrice")%> </span><span class="sellCount">销量：<%#Eval("ZongXiaoLiang")%></span></p>
                              </li>
                        </ul>
                     </ItemTemplate>
                 </asp:DataList>
        </div>
    </form>
</body>
</html>
