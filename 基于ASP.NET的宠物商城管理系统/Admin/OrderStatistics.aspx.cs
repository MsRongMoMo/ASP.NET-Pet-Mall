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
public partial class AdminManger_OrderStatistics : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txttime.Value = DateTime.Now.ToShortDateString();
            Text1.Value = DateTime.Now.AddDays(1).ToShortDateString();
           

            /* for (int i = 0; i < gvInfo.Rows.Count; i++)
             {

                 Label dingdantotal = (Label)gvInfo.Rows[i].FindControl("dingdantotal");
                 Label producttotail = (Label)gvInfo.Rows[i].FindControl("producttotail");
                 Label postMon = (Label)gvInfo.Rows[i].FindControl("postMoney");

                 int postmoney = Convert.ToInt32(dingdantotal.Text) - Convert.ToInt32(producttotail.Text);
                 postMon.Text = postmoney.ToString();
             }*/
        }
       
    }
   
    private void Get_Info()
    {
        try
        {


            gvInfo.DataSource = GetCodeBy();
            gvInfo.DataBind();
        }
        catch
        {

        }

    }
    protected void gvInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvInfo.PageIndex = e.NewPageIndex;
        Get_Info();
    }

     int TotalMoney = 0;
     int MemberMoney = 0;
    protected void gvInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
        //鼠标移动变色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f6f6f6',this.style.fontWeight='';");
            //当鼠标离开的时候 将背景颜色还原的以前的颜色 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");

            


            //单击行改变行背景颜色 
            e.Row.Attributes.Add("onclick", "this.style.backgroundColor='#f6f6f6'; this.style.color='buttontext';this.style.cursor='default';");


            DataRowView dr = e.Row.DataItem as DataRowView;
            TotalMoney += Convert.ToInt32(dr.Row["dingdantotal"]);//数据库中有数据为12.3,则用ToDouble，比对为表列名称，获得其中内容
            MemberMoney += Convert.ToInt32(dr.Row["producttotail"]);
           








    }
        if (e.Row.RowType == DataControlRowType.Footer)
        {

            e.Row.Cells[0].Text = "合计";
            e.Row.Cells[4].Text = TotalMoney.ToString();
            e.Row.Cells[5].Text = MemberMoney.ToString();
        }


    }
    public DataSet GetCodeBy()
    {
       
        string TextBoxShangPinName = this.SearchShangPinName.Text;
        string txttime = this.txttime.Value;
        string Text1 = this.Text1.Value;
       
        SqlHelper date = new SqlHelper();
      
       

        string str = "";
        string sql = str;
        sql = "select    dingdantotal, *  from orders,orderdetail,ShangPinInfo where  1=1 and orders.orderid=orderdetail.orderid and orderdetail.pid=ShangPinInfo.ShangPinID ";

  

        if (TextBoxShangPinName != "")
        {
            
            sql += " and ShangPinName like '%" + TextBoxShangPinName + "%'";
        }
        if (txttime != "")
        {
            sql += " and dingdanshijian between  '" + txttime + "' and  '"+Text1+"'";
        }


      
            SqlConnection con = new SqlConnection(SqlHelper.connstring);
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = null;
        try
        {
            con.Open();
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (SqlException ex)
        {
            throw ex;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return ds;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Get_Info();



    }
}
