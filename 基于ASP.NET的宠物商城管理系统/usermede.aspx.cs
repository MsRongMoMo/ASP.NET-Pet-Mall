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
using System.Data.SqlClient;
public partial class usermede : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddd();
        }
    }

    public void ddd()
    {
        string mysql = "select * from OrderNotify where pid='" + Request.QueryString["id"] + "';update OrderNotify set pfeel=1 where pid='" + Request.QueryString["id"] + "'";
        SqlDataReader dr = data.GetDataReader(mysql);
        if (dr.Read())
        {
            
            Label1.Text = dr["pcontent"].ToString();

        }
    }
}
