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

public partial class HotShangPinList : System.Web.UI.Page
{
    SqlHelper sqloperate = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "热门商品";
        if (!IsPostBack)
        {
            gvbind();
        }
    }
    protected string CutChar(string strChar, int intLength)
    {
        //取得自定义长度的字符串
        if (strChar.Length > intLength)
        { return strChar.Substring(0, intLength); }
        else
        { return strChar; }

    }
    private void gvbind()
    {
        string sqlstr = "";
        sqlstr = "select  * from ShangPinInfo order by ShangPinClick desc ";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        con.Open();

        SqlDataAdapter sda = new SqlDataAdapter(sqlstr, con);

        DataSet ds = new DataSet();
        sda.Fill(ds);
        PagedDataSource objPds = new PagedDataSource();
        objPds.DataSource = ds.Tables[0].DefaultView;

        objPds.AllowPaging = true;
        objPds.PageSize = 16;

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
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1);
        }

        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1);
        }

        this.DataList1.DataSource = objPds;
        this.DataList1.DataBind();
        con.Close();


    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //判断用户是否已登录，若未登录，则跳转到登录页面
        if (Session["UserName"] == null)
        {
            Alert.AlertAndRedirect("您还没有登录，请登录后再购买，谢谢合作！", "UserLogin.aspx");
        }
        //已登录，把商品信息持久化到ShoppingCart数据表中
        else
        {
            Label ShangPinID = (Label)e.Item.FindControl("ShangPinID");
            SqlDataReader dr = sqloperate.GetDataReader("select * from ShoppingCart where  pid='" + Convert.ToInt32(ShangPinID.Text) + "'and userid='" + Convert.ToInt32(Session["UserId"]) + "'");
            int shuliang;
            string mysql;
            int n;
            //判断该商品是否已经存在于ShopingCart数据中
            if (dr.Read())
            {
                //已存在，原来的数量+1
                shuliang = Convert.ToInt32(dr["shuliang"].ToString());
                shuliang = shuliang + 1;
               mysql = "update  ShoppingCart set shoutime='" + System.DateTime.Now + "',shuliang='" + shuliang + "'where pid ='" + Convert.ToInt32(ShangPinID.Text) + "'";
            }
            else
            {
                //未存在，新插入商品信息
                shuliang = 1;
                mysql = "insert into ShoppingCart(pid,userid,shoutime,shuliang)values('" + Convert.ToInt32(ShangPinID.Text) + "','" + Convert.ToInt32(Session["UserId"]) + "','" + System.DateTime.Now + "','" + shuliang + "')";
                
            }
            n = SqlHelper.exexu(mysql);
            //操作完成，输出提示信息
            if (n > 0)
            {
                Page.RegisterClientScriptBlock("e", "<script>alert('加入购物车成功!')</script>");
            }
        }
    }
}
