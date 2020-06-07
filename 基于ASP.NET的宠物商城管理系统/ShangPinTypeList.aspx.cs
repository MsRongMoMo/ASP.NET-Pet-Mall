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

public partial class ShangPinTypeList : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商品展示";
        if (!IsPostBack)
        {
            gvbind();
        }

       
    }


  private void gvbind()
    {

       
        
        string sql = "select * from ShangPinInfo where ShangPinTypeID='" + Request.QueryString["id"].ToString() + "' order by ShangPinID desc";
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
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
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1 + "&id=" + Request.QueryString["id"].ToString();
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1) + "&id=" + Request.QueryString["id"].ToString();
        }

        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount + "&id=" + Request.QueryString["id"].ToString();

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1) + "&id=" + Request.QueryString["id"].ToString();
        }

        this.DataList1.DataSource = objPds;
        this.DataList1.DataBind();
        con.Close();
    }
    protected string CutChar(string strChar, int intLength)
    {
        //取得自定义长度的字符串
        if (strChar.Length > intLength)
        { return strChar.Substring(0, intLength); }
        else
        { return strChar; }

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
      
       

        if (Session["UserId"] == null)
        {
            Alert.AlertAndRedirect("您还没有登录，请登录后再购买！", "UserLogin.aspx");

        }

        else
        {
            Label ShangPinID = (Label)e.Item.FindControl("ShangPinID");
            SqlDataReader dr = data.GetDataReader("select * from ShoppingCart where  pid='" + Convert.ToInt32(ShangPinID.Text) + "'and userid='" + Convert.ToInt32(Session["UserId"]) + "'");
            if (dr.Read())
            {
                int shuliang = Convert.ToInt32(dr["shuliang"].ToString());
                shuliang = shuliang + 1;
                string mysql = "update  ShoppingCart set shoutime='" + System.DateTime.Now + "',shuliang='" + shuliang + "'where pid ='" + Convert.ToInt32(ShangPinID.Text) + "'";
                int n = SqlHelper.exexu(mysql);
                if (n > 0)
                {
                    Page.RegisterClientScriptBlock("e", "<script>alert('加入购物车成功!')</script>");
                }
            }
            else
            {

                int shuliang = 1;
                string mysql = "insert into ShoppingCart(pid,userid,shoutime,shuliang)values('" + Convert.ToInt32(ShangPinID.Text) + "','" + Convert.ToInt32(Session["UserId"]) + "','" + System.DateTime.Now + "','" + shuliang + "')";
                int n = SqlHelper.exexu(mysql);
                if (n > 0)
                {
                    Page.RegisterClientScriptBlock("e", "<script>alert('加入购物车成功!')</script>");
                }
            }

        }
    }
}
