<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ly.aspx.cs" Inherits="ly" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <style>
        
          .btn {
            width: 210px;
            height: 50px;
            line-height: 50px;
            color: #fff;
            background-color: #ee5533;
            margin: 10px;
            outline: none;
            border: 0;
            font-size: 18px;
        
        }
            h2 {
                height:45px;
                margin:15px auto;
                line-height:45px;
                color:#777;
            }
            #Table4 {
                display:inline-block;
                width:39%;
                margin:0;
            }
                #Table4 tr {
                    width:100%;
                }
                #Table4 .label {
                    width:30%;
                    text-align:right;
                    padding-right:15px;
                    vertical-align:middle;
                }
                #Table4 .input select {
                  font-size:14px;
                }
                #Table4 .input {
                    width:70%;     
                }
                    #Table4 .input input, #Table4 .input textarea, #Table4 .input select{
                        width:100%;
                         height:40px;
                    line-height:40px;
                     outline:none;
                     border:1px solid #ccc;
                     padding:10px;
                     margin-top:15px;
                       font-size:14px;
                    }
                    #Table4 .input textarea {
                        height:200px;
                        width:100%;
                        resize:none;
                    }
                #Table4 .submit {
                    text-align:center;
                }
            .ly {
               position:relative;
                display:inline-block;
                width:59%;
                vertical-align:top;
                height:583px;

            }
                .ly .content {
                    background-color:#f3f3f3;
                    margin-bottom:6px;
                }
             
                .ly .label {
                    display:inline-block;
                    width:15%;
                    text-align:right;
                    font-size:14px;
                    color:#333;

                }
                .ly .label_right {
                    text-align:right;
                    margin-left:150px;
                }
                .ly .page_next {
                    position:absolute;
                    bottom:20px;
                    right:0px;
                    width:100%;
                    text-align:center;
                }
                .ly .ly_word {
                    font-size:14px;
                    color:#333;
                }
               
    </style>

 <DIV class="main layout"  >

     <div id="Table4">
         <H2> 留言中心 </H2>
         <table  border="0" cellpadding="1" cellspacing="0">
           <tr>
            <td class="label"> 留言类别:</td>
            <td class="input">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" >
                    <asp:ListItem>在线咨询</asp:ListItem>
                    <asp:ListItem>意见反馈</asp:ListItem>
                    <asp:ListItem>其他</asp:ListItem>
                </asp:DropDownList>
             </td>
        </tr>
                    <tr>
                        <td class="label">您的姓名:</td>
                        <td class="input">
                            <asp:TextBox ID="TextBox1" runat="server" EnableViewState="False" ValidationGroup="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                ErrorMessage="必须填写" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label"> 你的E_mail:</td>
                        <td class="input">
                            <asp:TextBox ID="TextBox2" runat="server" EnableViewState="False" ValidationGroup="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                ErrorMessage="必须填写" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            发表内容:</td>
                        <td class="input">
                            <asp:TextBox ID="TextBox3" runat="server" EnableViewState="False"
                                TextMode="MultiLine"  ValidationGroup="2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                ErrorMessage="必须填写" ValidationGroup="2"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
              </table>             
     <p class="submit"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="确认" CssClass="btn"/></p>
                   
     </div>
                    
 
  



<DIV class="nb ly">
    <h2>历史留言</h2>
    <div>   
        <asp:DataList ID="DataList1" runat="server" Width="100%">
             <ItemTemplate>  
                 <div class="content">
                       <p>
                     <span class="label">用户:</span>
                     <asp:Label ID="Label1" runat="server" ForeColor="Maroon" Text='<%# DataBinder.Eval(Container, "DataItem.username") %>'></asp:Label>
                     <span class="label_right"><asp:Label ID="Label4" runat="server" ForeColor="#bbbbbb" Text='<%# DataBinder.Eval(Container, "DataItem.Addtime") %>'></asp:Label></span>
                 </p> 
             
               
                     
              
                 <p>
                     <span class="label">留言:</span>
                      <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.lybcontent") %>' CssClass="ly_word"></asp:Label>
                 </p>  
                 <p>
                     <span class="label">系统回复:</span>
                       <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.lyhuifu") %>' CssClass="ly_word"></asp:Label>
                 </p>       
                 </div>
               </ItemTemplate>
         </asp:DataList> 
    </div> 
                
    <div class="page_next"> 
        <div>
            共【<asp:Label ID="lblSumPage" runat="server"></asp:Label>】页 &nbsp; &nbsp;&nbsp; 当前第【<asp:Label
                    ID="lblCurrentPage" runat="server"></asp:Label>】页&nbsp;
                <asp:HyperLink ID="hyfirst" runat="server">首页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="lnkPrev" runat="server">上一页</asp:HyperLink>
                &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                <asp:HyperLink ID="lnkNext" runat="server">下一页</asp:HyperLink>
                &nbsp;&nbsp;
                <asp:HyperLink ID="hylastpage" runat="server">尾页</asp:HyperLink>
        </div>
    </div>
                
  </DIV>

 
    
 </DIV>   
</asp:Content>

