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
public partial class OrderDetail : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

        sss();
    }

    public void sss()
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
            Label10.Text = dr["beizhu"].ToString();

            PriceDifference.Text = Convert.ToDecimal(Convert.ToDecimal(dr["dingdantotal"]) - Convert.ToDecimal(dr["memberPrice"])).ToString();
            VIPPrice.Text = dr["memberPrice"].ToString();

            //  string dfell = dr["dingdanfeel"].ToString();
            switch (dr["dingdanfeel"].ToString())
            {
                case "0":
                    {
                        Label11.Text = "未确定订单";

                        break;
                    }
                case "1":
                    {
                        Label11.Text = "等待发货";
                        break;
                    }
                case "2":
                    {
                       
                        Label11.Text = "商家已发货";

                        break;
                    }
                case "3":
                    {
                        Label11.Text = "确认收货";

                        break;
                    }
                case "4":
                    {
                        
                        Label11.Text = "完成交易";

                        break;
                    }
            }
            Label13.Text = dr["dingdantotal"].ToString();
            if (dr["memberPrice"].ToString().Trim()!= dr["dingdantotal"].ToString().Trim()) {

                Price_discount.Visible = true;
                Price_actual.Visible = true;    
            }
            //MyGrid.DataSource = Class1.gd(mysql1);
            //MyGrid.DataBind();
        }
       
        string mysql1 = "select orderdetail.*,ShangPinInfo.* from orderdetail,ShangPinInfo where orderdetail.orderid='" + Label1.Text + "'and ShangPinInfo.ShangPinID=orderdetail.pid";
        GridView1.DataSource = data.GetDv(mysql1);
        GridView1.DataBind();
    
    }

}
