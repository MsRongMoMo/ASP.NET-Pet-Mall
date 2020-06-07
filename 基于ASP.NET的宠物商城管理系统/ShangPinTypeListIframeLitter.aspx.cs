using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class ShangPinTypeListIframe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gvbind();

    }
    private void gvbind()
    {
        string sql;
        if (Request.QueryString["id"] == null && Request.QueryString["category"] == "dog") {
            sql = "select top 6 * from ShangPinInfo  where ShangPinTypeID=15";
        } else if (Request.QueryString["id"] == null && Request.QueryString["category"] == "cat") { 
            sql = "select top 6 * from ShangPinInfo  where ShangPinTypeID=14";

        }
        else {
            sql = "select  top 6 * from ShangPinInfo where ShangPinTypeID='" + Request.QueryString["id"].ToString() + "' order by ShangPinID";

        }
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        PagedDataSource objPds = new PagedDataSource();
        objPds.DataSource = ds.Tables[0].DefaultView;
        this.DataList4.DataSource = objPds;
        this.DataList4.DataBind();
        con.Close();
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