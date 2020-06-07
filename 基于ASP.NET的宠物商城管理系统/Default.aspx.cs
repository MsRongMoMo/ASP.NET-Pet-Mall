using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
        
    {   this.Title="首页";
       /* Request.Params.Set("activeItem", "0");*/

        if (!IsPostBack)
        {
           /* DataList3.DataSource = data.GetDataReader("select top 10   * from  dbo.News   order by  Addtime desc ");
            DataList3.DataBind();*/


            DlGoodsType1.DataSource = data.GetDataReader("select * from  ShangPinType  where left(Name,2)='狗狗'");
            DlGoodsType1.DataBind();
            DlGoodsType3.DataSource = data.GetDataReader("select * from  ShangPinType  where left(Name,2)='狗狗'");
            DlGoodsType3.DataBind();


            DlGoodsType2.DataSource = data.GetDataReader("select * from  ShangPinType  where left(Name,2)='猫猫'");
            DlGoodsType2.DataBind();
            DlGoodsType4.DataSource = data.GetDataReader("select * from  ShangPinType  where left(Name,2)='猫猫'");
            DlGoodsType4.DataBind();




        }

    }

    protected string CutChar(string strChar, int intLength)
    {
        //取得自定义长度的字符串
        if (strChar.Length > intLength)
        { return strChar.Substring(0, intLength); }
        else
        { return strChar; }

    }
   
    }

   
