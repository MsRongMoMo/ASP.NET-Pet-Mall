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

public partial class Admin_Huifu : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        data.RunSql("update  userliuyanban set lyhuifu='"+TextBox1.Text+"' where id="+Request.QueryString["id"].ToString());
        Alert.AlertAndRedirect("回复成功", "lyManger.aspx");

    }
}
