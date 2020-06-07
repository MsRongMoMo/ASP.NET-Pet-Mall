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
using Microsoft.Win32;

public partial class OrderInfo : System.Web.UI.Page
{

    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
       
            GridView1.DataSourceID = "SqlDataSource1";
      
    }
 
   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            Label label = (Label)e.Row.FindControl("zhuangtai");

            LinkButton lb = (LinkButton)e.Row.FindControl("geng");
            LinkButton comment = (LinkButton)e.Row.FindControl("AddComment");
            switch (drv["dingdanfeel"].ToString())
            {
                case "0":
                    {
                        label.Text = "未确定订单";
                        lb.Text = "确定订单";
                        break;
                    }
                case "1":
                    {
                        label.Text = "等待发货";
                        lb.Text = "取消订单";
                        break;
                    }
                case "2":
                    {
                        label.Text = "商家已发货";
                        lb.Text = "确认收货";
                        break;
                    }
                case "3":
                    {
                        label.Text = "确认收货";
                        lb.Text = "等待完成";
                        lb.Enabled = false;
                        break;
                    }
                case "4":
                    {
                        label.Text = "完成交易";
                        lb.Text = "交易完成";
                        lb.Enabled = false;
                        comment.Visible = true;
                        break;
                    }
            }
        }
       
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cao")
        {
            //string lab = ((Label)GridView1.Rows[e.RowIndex].Cells[列号].FindControl("Label1")).Text;
            // string ddd=((Label)GridView1.Rows[e.r])
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
            string orderid = (row.Cells[0].FindControl("label2") as Label).Text;
            string dingdan = (row.Cells[0].FindControl("ding") as Label).Text;
            Label comment = (row.Cells[0].FindControl("AddComement") as Label);

            switch (dingdan)
            {
                case "0":
                    {
                        string mysql = "update orders set dingdanfeel=1 where orderid='" + orderid + "'";
                        data.GetDataReader(mysql);
                        GridView1.DataSourceID = "SqlDataSource1";
                        break;
                    }
                case "1":
                    {
                        string mysql = "update orders set dingdanfeel=0 where orderid='" + orderid + "'";
                        data.GetDataReader(mysql);
                        GridView1.DataSourceID = "SqlDataSource1";
                        break;
                    }
                case "2":
                    {
                        string mysql = "update orders set dingdanfeel=3 where orderid='" + orderid + "'";
                        data.GetDataReader(mysql);
                        GridView1.DataSourceID = "SqlDataSource1";
                        break;
                    }


            }


        }
        else if (e.CommandName == "del")
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
            string fukuanfs = (row.Cells[0].FindControl("fukuanfs") as Label).Text;
            string orderid = (row.Cells[0].FindControl("Label2") as Label).Text;
            string dingdanfeel = (row.Cells[0].FindControl("dingdanfeel") as Label).Text;
            string dingdantotal =(row.Cells[0].FindControl("dingdantotal") as Label).Text;
            string ShangPinName = " select ShangPinInfo.ShangPinName from ShangPinInfo,orderdetail  where ShangPinInfo.ShangPinID=orderdetail.pid and orderdetail.orderid=" + orderid;
            string name = data.ReturnSql(ShangPinName);
            string ShangPinPhoto = "select ShangPinInfo.ShangPinPhoto from ShangPinInfo,orderdetail where ShangPinInfo.ShangPinID = orderdetail.pid and orderdetail.orderid = " + orderid;
            string photo = data.ReturnSql(ShangPinPhoto);
            if (fukuanfs == "会员结算"&&Convert.ToInt32(dingdanfeel) ==0) {
                string moneyback = "update Users set MemberMoney = MemberMoney+'" + Convert.ToDouble(dingdantotal) +"'where id='" +Session["UserId"]+"'";
                SqlHelper.exexu(moneyback);

                string gcontent = "您好， " + Session["UserName"] + ",您购买的" + name + "，订单号为" + orderid + "的商品,价钱已经原路返回，注意查收，退货成功了!";
                string mysql = "insert into OrderNotify(pcontent,userid,pphoto)values('" + gcontent + "','" + Session["UserName"] + "','" + photo + "')";
                SqlHelper.exexu(mysql);
           
            }
            // Label pid = (Label)e.Item.FindControl("pid");
            //int piid = Convert.ToInt32(pid.Text);
            string order = "delete from orders where orderid='" + e.CommandArgument.ToString() + "'";
            string orderdetail="delete from orderdetail where orderid='"+ e.CommandArgument.ToString() + "'";
            int n1 = SqlHelper.exexu(order);
            int n2 = SqlHelper.exexu(orderdetail);
            if (n1 > 0&& n2>0)
            {

                //Page.RegisterClientScriptBlock("e", "<script>alert('删除成功!')</script>");
                GridView1.DataSourceID = "SqlDataSource1";
            }
        }
        else if (e.CommandName == "comment") {

            GridViewRow row = (GridViewRow)((Control)e.CommandSource).Parent.Parent;

            string orderid = (row.Cells[0].FindControl("label2") as Label).Text;
            string pid = (row.Cells[0].FindControl("pid") as Label).Text;
          
        

        }



    }
}
