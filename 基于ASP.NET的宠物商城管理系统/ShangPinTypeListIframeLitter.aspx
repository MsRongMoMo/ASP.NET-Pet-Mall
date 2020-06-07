<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShangPinTypeListIframeLitter.aspx.cs" Inherits="ShangPinTypeListIframe" %>

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
    width: 178px;
    height: 60px;
   margin-top:12px;
    box-sizing: border-box;
    font-size:0px;
}
            ul li img {
                width: 60px;
                height: 60px;
            }
   ul li  .word {    
      width:108px;
     height:40px;
     padding-top:7px;
     color:#666;
    overflow:hidden;
    line-height:16px;
    display:inline-block;
    font-size:14px;
        }

.shangPinTypeListIframeLitter ul li span{
    width:178px;
    height:16px;
padding-top:3px;
color:#ee5533;
position:relative;
top:-23px;
left:63px;
   font-size: 12px;
}

 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="shangPinTypeListIframeLitter">
                  <asp:DataList ID="DataList4" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="200px" Height="60px" VerticalAlign="Left" HorizontalAlign="Left">
                        <ItemTemplate>     
                          <ul class="clearfix">
                             <li class="good">
                               <a href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>'> <img src='files/<%#Eval("ShangPinPhoto")%>' alt="Alternate Text" /></a>
                               <a class="word" href='ShowShangPin.aspx?id=<%#Eval("ShangPinID") %>' ><%#Eval("ShangPinName").ToString().Length > 25 ? CutChar(Eval("ShangPinName").ToString(), 32) + "..." : Eval("ShangPinName")%>     

                               </a>
                                 <br />
                                 <span>¥  <%#Eval("ShangPinPrice")%> </span>
                              </li>
                        </ul>
                     </ItemTemplate>
                 </asp:DataList>
        </div>
    </form>
</body>
</html>
