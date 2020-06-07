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
public partial class admin_orderdetail : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
       // Panel1.Visible = false;
        xiugai();
        
    }
    public void xiugai()
    {

        string mysql = "select orders.*,orderdetail.* from orders,orderdetail where orders.oid='" + Request.QueryString["id"] + "'";
        SqlDataReader dr = data.GetDataReader(mysql);
        if (dr.Read())
        {
            Label1.Text = dr["orderid"].ToString();
            Label2.Text = dr["dingdanshijian"].ToString();
            Label3.Text = dr["shouhuoname"].ToString();
            Label4.Text = dr["address"].ToString();
            Label5.Text = dr["postcode"].ToString();
            Label6.Text = dr["telephone"].ToString();
            Label7.Text = dr["songhuofs"].ToString();
            Label8.Text = dr["fukuanfs"].ToString();
            Label9.Text = dr["pid"].ToString();
            //Label10.Text = dr["dingdantotal"].ToString();
            Label11.Text = dr["beizhu"].ToString();
            //MyGrid.DataSource = Class1.gd(mysql1);
            //MyGrid.DataBind();
        }
        string mysql1 = "select orderdetail.*,ShangPinInfo.* from orderdetail,ShangPinInfo where orderdetail.orderid='" + Label1.Text + "'and ShangPinInfo.ShangPinID=orderdetail.pid";
        GridView1.DataSource =data.GetDs(mysql1,"TABLE");
        GridView1.DataBind();
    
    }

   /* protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Button2.Visible = false;
    }*/
   /* protected void Button1_Click(object sender, EventArgs e)
    {
        string mysql1 = "update orders set dingdantotal='" + TextBox2.Text + "'where orderid='" + Label1.Text + "'";
        int n = SqlHelper.exexu(mysql1);
        if (n > 0)
        {
            Page.RegisterClientScriptBlock("e", "<script>alert('修改总价成功!')</script>");
            xiugai();
            Button2.Visible = true;
        }
    }*/
}
