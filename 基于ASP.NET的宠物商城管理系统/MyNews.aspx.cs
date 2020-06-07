using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("ssnotice.aspx");
        }
        if (!IsPostBack)
        {
            Label1.Text = Session["UserName"].ToString();
            gga();
        }
    }
    public void gga()
    {

        string mysql1 = "select count(*) from OrderNotify where userid='" + Session["UserName"].ToString() + "'and pfeel=0";
        int n = SqlHelper.dd(mysql1);
        LinkButton1.Text = n.ToString();
    }

}