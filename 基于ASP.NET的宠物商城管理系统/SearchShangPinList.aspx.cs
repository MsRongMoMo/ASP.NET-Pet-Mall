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
public partial class SearchShangPinList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Request.QueryString["ShangPinName"].ToString();
        if (!IsPostBack)
        {
            gvbind();
        }
    }
    private void gvbind()
    {
        string ShangPinName = Request.QueryString["ShangPinName"].ToString();
        string ShangPinTypeName = Request.QueryString["ShangPinTypeName"].ToString();
    

        

        
        string sql = "select   *   from   ShangPinInfo   where   1=1";
        if (ShangPinName != "")
        {
            sql += " and   ShangPinName   like   '%" + ShangPinName + "%'   ";

        }
        if (ShangPinTypeName != "所有类别")
        {
            sql += " and   ShangPinTypeName   like   '%" + ShangPinTypeName + "%'   ";
        }
       
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
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1 + "&ShangPinName=" + Request.QueryString["ShangPinName"].ToString() + "&ShangPinTypeName=" + Request.QueryString["ShangPinTypeName"].ToString() ;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1) + "&ShangPinName=" + Request.QueryString["ShangPinName"].ToString() + "&ShangPinTypeName=" + Request.QueryString["ShangPinTypeName"].ToString()  ;
        }

        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount + "&ShangPinName=" + Request.QueryString["ShangPinName"].ToString() + "&ShangPinTypeName=" + Request.QueryString["ShangPinTypeName"].ToString()  ;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1) + "&ShangPinName=" + Request.QueryString["ShangPinName"].ToString() + "&ShangPinTypeName=" + Request.QueryString["ShangPinTypeName"].ToString() ;
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


        if (Session["UserName"] == null)
        {

            Alert.AlertAndRedirect("您还没有登录，请登录后再购买，谢谢合作！", "UserLogin.aspx");


        }

        else
        {

            int i;
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

            Session["ShoppingCar"] = Hash;




        }
    }
}
