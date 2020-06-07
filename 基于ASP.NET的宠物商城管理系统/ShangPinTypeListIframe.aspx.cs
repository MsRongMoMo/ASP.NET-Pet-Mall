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
        if (Request.QueryString["id"]==null) {
            sql = "select top 8 * from ShangPinInfo  order by ShangPinID";
        }
        else {
            sql = "select  top 8 * from ShangPinInfo where ShangPinTypeID='" + Request.QueryString["id"].ToString() + "' order by ShangPinID";

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