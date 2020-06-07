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

public partial class ShoppingCart : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "我的购物车 ";
        if (!IsPostBack)
        {

            BinderReplay();
        }
        if (Session["UserName"] == null)
        {
            Response.Redirect("ssnotice.aspx");
        }
        else
        {
         
            if (DataList1.Items.Count == 0)
            {
                Label4.Visible = true;
                Label4.Text = "暂时没有相关的数据";
            }
        }
    }
  
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)

        //if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //  TextBox TXT = (TextBox)e.Item.FindControl("quantity");
            // TXT.Text = "1";
            LinkButton lik = (LinkButton)e.Item.FindControl("LinkButton1");
            lik.Text = @"<img src='image/goumai1.bmp' border='0'>";
         
        }
    }
 
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label pid = (Label)e.Item.FindControl("pid");
        int piid = Convert.ToInt32(pid.Text);
        TextBox sellCount = (TextBox)e.Item.FindControl("sellCount");
        Label ShangPinNum = (Label)e.Item.FindControl("ShangPinNum");
      

        if (e.CommandName == "buynow")
        {
            Hashtable hash;
            if (Session["ShoppingCar"] == null)
            {
                //如果用户没有分配购物车
                hash = new Hashtable();         //新生成一个
                //  hash.Add(e.CommandArgument, 1); //添加一个宠物
                // Session["Cart"] = hash;     //分配给用户
            }
            else
            {
                //用户已经有购物车
                hash = (Hashtable)Session["ShoppingCar"];//得到购物车的hash表
            }
            if (!hash.Contains(e.CommandArgument))//购物车中已有此宠物，宠物数量加1
            {
                hash.Add(e.CommandArgument, Convert.ToInt32(sellCount.Text));//如果没有此宠物，则新添加一个项

            }
            else
            {
                int count = Convert.ToInt32(hash[e.CommandArgument].ToString());//得到该宠物的数量
                hash[e.CommandArgument] = (count + Convert.ToInt32(sellCount.Text));//宠物数量加1
            }
            Session["ShoppingCar"] = hash;
            //  Response.Write("<script>window.open('shoppingcar.aspx');</script>");
            Response.Redirect("ByNow.aspx");
        }

        else if (e.CommandName == "del")
        {
           
            string mysql = "delete from ShoppingCart where pid='" + piid + "'";
            SqlHelper.exexu(mysql);
            BinderReplay();


            // Page.RegisterClientScriptBlock("e", "<script>alert('删除成功!');location.href='myshoucang.aspx'</script>");

        }

        else if (e.CommandName == "subtract") {  
            if (Convert.ToInt32(sellCount.Text) > 1)
            {
                int sub=Convert.ToInt32(sellCount.Text) - 1;
                string mysql = "update ShoppingCart set shuliang='" + sub + "'where pid='" + piid + "'and userid='" + Session["UserId"] + "'";
                SqlHelper.exexu(mysql);
                BinderReplay();
            }
            else {
                Page.RegisterClientScriptBlock("e", "<script>alert('商品数量不能再少啦!')</script>");
            }
        }
        else if (e.CommandName == "addition") {    
            if (Convert.ToInt32(sellCount.Text) < Convert.ToInt32(ShangPinNum.Text))
            {
               int add = Convert.ToInt32(sellCount.Text) + 1;
                string mysql = "update ShoppingCart set shuliang='" + add + "'where pid='" + piid + "'and userid='" + Session["UserId"] + "'";
                SqlHelper.exexu(mysql);
                BinderReplay();
            }
            else {
                Page.RegisterClientScriptBlock("e", "<script>alert('超出货存量啦!')</script>");
            }

        }
    }


    private void BinderReplay()
    {
        int id = Convert.ToInt32(Session["UserId"]);
        /* string sql = "select * from  Comment where ShangPinId=" + id;*/

        string sql = "select ShangPinInfo.* ,ShoppingCart.* from  ShangPinInfo,ShoppingCart where ShoppingCart.userid='"+id+ "'and ShangPinInfo.ShangPinID = ShoppingCart.pid ORDER BY ShoppingCart.shoutime DESC";
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        PagedDataSource objPds = new PagedDataSource();
        objPds.DataSource = ds.Tables[0].DefaultView;

        objPds.AllowPaging = true;
        objPds.PageSize = 5;

        int CurPage;
        if (Request.QueryString["Page"] != null)
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        else
            CurPage = 1;

        objPds.CurrentPageIndex = CurPage - 1;
        lblCurrentPage.Text = CurPage.ToString();
        lblSumPage.Text = objPds.PageCount.ToString();

        if (!objPds.IsFirstPage)
        {
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1 + "&id=" + id;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1) + "&id=" + id;
        }

        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount + "&id=" + id;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1) + "&id=" + id;
        }

        this.DataList1.DataSource = objPds;
        this.DataList1.DataBind();
        con.Close();
    }
  




}
