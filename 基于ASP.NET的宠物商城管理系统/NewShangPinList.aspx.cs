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


public partial class NewShangPinList : System.Web.UI.Page
{

    SqlHelper sqloperate = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = " 最新商品";
        if (!IsPostBack)
        {
            gvbind();
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
       
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
        sqlstr = "select  * from ShangPinInfo order by ShangPinDate desc ";
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


        if (Session["UserName"] == null)
        {

            Alert.AlertAndRedirect("您还没有登录，请登录后再购买，谢谢合作！", "UserLogin.aspx");


        }

        else {



            Label ShangPinID = (Label)e.Item.FindControl("ShangPinID");
            SqlDataReader dr = sqloperate.GetDataReader("select * from ShoppingCart where  pid='" + Convert.ToInt32(ShangPinID.Text) + "'and userid='" + Convert.ToInt32(Session["UserId"]) + "'");
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



            /* int i;
             Hashtable Hash;

             if (Session["ShoppingCar"] == null)
             {
                 //如果用户没有分配购物车 新生成一个购物车
                 Hash = new Hashtable();
             }
             else
             {
                 //用户已有购物车
                 Hash = (Hashtable)Session["ShoppingCar"];

             }
             //如果购物车已经有此宠物，宠物数量加1
             if (!Hash.Contains(e.CommandArgument))
             {
                 Hash.Add(e.CommandArgument, 1);

             }
             else
             {
                  int addBefore = Convert.ToInt32(Hash[e.CommandArgument].ToString());//得到宠物数量
                 Hash[e.CommandArgument] = (addBefore + 1);//宠物数量加1


             }

             Session["ShoppingCar"] = Hash;*/




        }
    }
}
