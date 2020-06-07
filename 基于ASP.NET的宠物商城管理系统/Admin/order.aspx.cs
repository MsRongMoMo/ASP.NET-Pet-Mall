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
using System.IO;
public partial class Admin_Order : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSourceID = "SqlDataSource1";
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            Label label = (Label)e.Row.FindControl("zhuangtai");

            LinkButton lb = (LinkButton)e.Row.FindControl("geng");
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
                        lb.Text = "商家发货";
                        break;
                    }
                case "2":
                    {
                        label.Text = "商家已发货";
                        lb.Text = "收货确认";
                        lb.Enabled = false;
                        break;
                    }
                case "3":
                    {
                        label.Text = "确认收货";
                        lb.Text = "完成交易";
                        break;
                    }
                case "4":
                    {
                        label.Text = "完成交易";
                        lb.Text = "交易完成";
                        lb.Enabled = false;
                        break;
                    }
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "cao")
        {
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).Parent.Parent;
            string orderid = (row.Cells[0].FindControl("label2") as Label).Text;
            string dingdan = (row.Cells[0].FindControl("ding") as Label).Text;
            string user = (row.Cells[0].FindControl("label3") as Label).Text;
            string ShangPinName = " select ShangPinInfo.ShangPinName from ShangPinInfo,orderdetail  where ShangPinInfo.ShangPinID=orderdetail.pid and orderdetail.orderid="+orderid;
            string name = data.ReturnSql(ShangPinName);
            string ShangPinPhoto="select ShangPinInfo.ShangPinPhoto from ShangPinInfo,orderdetail where ShangPinInfo.ShangPinID = orderdetail.pid and orderdetail.orderid = "+orderid;
            string photo = data.ReturnSql(ShangPinPhoto);

            switch (dingdan)
            {
                case "0":
                    {
                        string mysql = "update orders set dingdanfeel=1 where orderid='" + orderid + "'";
                        SqlHelper.exexu(mysql);
                        GridView1.DataSourceID = "SqlDataSource1";
                        break;
                    }
                case "1":
                    {
                        
                       
                        string tcontent = "您好," + user.ToString() +",您购买的"+name+",订单号为" + orderid.ToString()+ "的宠物,已经成功发货了!";
                        string mysql = "update orders set dingdanfeel=2 where orderid='" + orderid + "';insert into OrderNotify(pcontent,userid,pphoto)values('" + tcontent + "','" + user + "','"+photo+"')";
                        SqlHelper.exexu(mysql);
                        GridView1.DataSourceID = "SqlDataSource1";
                        break;



       
                    }
                case "3":
                    {
                        string mysql1 = "select * from orderdetail where orderid='" + orderid + "'";
                        SqlDataReader dr =data.GetDataReader(mysql1);
                        if (dr.Read())
                        {
                            string gcontent = "您好， " + user + ",您购买的"+name+"，订单号为" + orderid + "的宠物,已经交易成功了!";
                            int ShangPinID = Convert.ToInt32(dr["pid"].ToString());
                            int num = Convert.ToInt32(dr["shuliang"].ToString());
                            string mysql = "update orders set dingdanfeel=4 where orderid='" + orderid + "';update ShangPinInfo set ShangPinNum=ShangPinNum-'"+num+"',ZongXiaoLiang=ZongXiaoLiang+'"+ num + "' where ShangPinInfo.ShangPinID='" + ShangPinID + "';insert into OrderNotify(pcontent,userid,pphoto)values('" + gcontent + "','" + user + "','" + photo + "')";
                            SqlHelper.exexu(mysql);
                            GridView1.DataSourceID = "SqlDataSource1";

                        }
                        break;
                    }


            }
        }
        else if (e.CommandName == "del")
        {
            // Label pid = (Label)e.Item.FindControl("pid");
            //int piid = Convert.ToInt32(pid.Text);
            string mysql = "delete from orders where orderid='" + e.CommandArgument.ToString() + "'";
            int n = SqlHelper.exexu(mysql);
            if (n > 0)
            {

                Page.RegisterClientScriptBlock("e", "<script>alert('删除成功!')</script>");
                GridView1.DataSourceID = "SqlDataSource1";
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (DropDownList1.SelectedValue)
        {
            case "0":
                {
                    GridView1.DataSourceID = "SqlDataSource2";
                    break;
                }
            case "1":
                {
                    GridView1.DataSourceID = "SqlDataSource2";
                    break;
                }
            case "2":
                {
                    GridView1.DataSourceID = "SqlDataSource2";
                    break;
                }
            case "3":
                {
                    GridView1.DataSourceID = "SqlDataSource2";
                    break;
                }
            case "4":
                {
                    GridView1.DataSourceID = "SqlDataSource2";
                    break;
                }
            case "5":
                {
                    GridView1.DataSourceID = "SqlDataSource1";
                    break;
                }

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox3.Text == "")
        {
            Page.RegisterClientScriptBlock("e", "<script>alert('请输入用户名!')</script>");
            GridView1.DataSourceID = "SqlDataSource1";
        }
        else
        {
            GridView1.DataSourceID = "SqlDataSource3";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {



    }
}
