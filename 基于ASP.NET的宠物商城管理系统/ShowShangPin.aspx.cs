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
using System.IO;
using System.Data.SqlClient;

public partial class ShowShangPin : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商品详情";
        if (!IsPostBack)
        {
            BinderReplay();
            data.RunSql("update ShangPinInfo set ShangPinClick=ShangPinClick+1 where ShangPinID=" + Request.QueryString["id"].ToString());
            string sql = "select * from ShangPinInfo where ShangPinID=" + Request.QueryString["id"].ToString();
            getdata(sql);



        }
    
     
    
       
    }
    private void getdata(string sql)
    {
        SqlDataReader dr = data.GetDataReader(sql);
        if (dr.Read())
        {
        
            Label2.Text = dr["ShangPinName"].ToString();
            Label4.Text = dr["ShangPinPrice"].ToString();
            Label5.Text = dr["ShangPinNum"].ToString();
            DIV1.InnerHtml = dr["ShangPinIntroduce"].ToString();
            Label6.Text = dr["ShangPinClick"].ToString();
            iGPhoto_small.ImageUrl = "files/" + dr["ShangPinPhoto"].ToString();
            iGPhoto_big.ImageUrl=iGPhoto_small.ImageUrl;
            Label3.Text = dr["ShangPinTypeName"].ToString();
            Hidden1.Value = dr["ShangPinTypeID"].ToString();

            Label1.Text = dr["ShangPinKuanshi"].ToString();
          
            Hidden2.Value = dr["ShangPinJiFen"].ToString();
            
        }

    }
    protected void addToCart_Click(object sender, EventArgs e)
    {

        if (float.Parse(Label5.Text) < float.Parse(sellCount.Text))
        {
            Alert.AlertAndRedirect("对不起您购买的商品不能大于库存数量", "ShowShangPin.aspx?id=" + Request.QueryString["id"].ToString());

        }
        else if(Session["UserName"] == null)
        {
           
                Alert.AlertAndRedirect("您还没有登录，请登录后再购买！", "UserLogin.aspx");

            
        }else {


            //判断购物车中是否已存在该商品
            string isHas = "select shuliang from ShoppingCart where pid=" + Request.QueryString["id"];
            SqlDataReader dr = data.GetDataReader(isHas);
            string mysql;
            //若已存在，则数量加1
            if (dr.Read())
            {

                int shuliang = Convert.ToInt32(dr["shuliang"].ToString());
                shuliang += 1;
                 mysql = "update ShoppingCart set shuliang=" + shuliang + "where id=" + Request.QueryString["id"];

            }
            //若不存在，则插入新数据
            else { 
                 mysql = "insert into ShoppingCart(pid,userid,shoutime,shuliang)values('" + Request.QueryString["id"] + "','" + Session["UserId"].ToString() + "','" + System.DateTime.Now + "','" +sellCount.Text+"')";

            }
            int n = SqlHelper.exexu(mysql);
                if (n > 0)
                {
                    Page.RegisterClientScriptBlock("e", "<script>alert('加入购物车成功!')</script>");
                }

        }
     
    }




    





    private void BinderReplay()
    {
        int id = int.Parse(Request.QueryString["id"].ToString());

        string sql = "select Comment.addTime,Comment.Titles,Users.Photo,Users.UserName from Comment , Users where Comment.UserId = Users.id and Comment.ShangPinID =" + id+ "ORDER BY Comment.addTime DESC ";
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        DataSet ds = new DataSet();

        

        sda.Fill(ds);
        //PagedDataSource类封装了DataList属性，使其可以执行分页
        PagedDataSource objPds = new PagedDataSource();
        //获取或设置数据源
        objPds.DataSource = ds.Tables[0].DefaultView;

        //设置是否用分页的值
        objPds.AllowPaging = true;
        //获取或设置要在单页上显示的项数
        objPds.PageSize = 5;

        int CurPage;
        if (Request.QueryString["Page"] != null)
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        else
            CurPage = 1;
        //获取或设置当前页的索引
        objPds.CurrentPageIndex = CurPage - 1;
        lblCurrentPage.Text = CurPage.ToString();
        //显示数据源中所有项所需要的总页数
        lblSumPage.Text = objPds.PageCount.ToString();
        //获取一个值，判断当前页是否是首页
        if (!objPds.IsFirstPage)
        {
            this.hyfirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + 1 + "&id=" + id;
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1) + "&id=" + id;
        }
        //获取一个值，判断当前页是最后一页
        if (!objPds.IsLastPage)
        {
            hylastpage.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + objPds.PageCount + "&id=" + id;

            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1) + "&id=" + id;
        }

        this.DataList2.DataSource = objPds;
        this.DataList2.DataBind();

        con.Close();
    }

    /*根据是否有商品价绍信息和商品评论信息 来判断是否显示对应的介绍信息*/
    /*  protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
      {
          if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
          {
              DataRowView drv = (DataRowView)e.Item.DataItem;
              if (drv != null)
              {
                  e.Item.FindControl("Label7").Visible = true;
              }
          }
          else
          {
              e.Item.FindControl("Label7").Visible = false;

          }
      }*/


  
    protected void subtract_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(sellCount.Text) >1)
        {
            sellCount.Text = (Convert.ToInt32(sellCount.Text) - 1).ToString();
        }
       
     
    }

    protected void addition_Click(object sender, EventArgs e)
    {
        sellCount.Text = (Convert.ToInt32(sellCount.Text) +1).ToString();
    }



    protected void buyNow_Click(object sender, EventArgs e)
    {
        if (float.Parse(Label5.Text) < float.Parse(sellCount.Text))
        {
            Alert.AlertAndRedirect("对不起您购买的商品不能大于库存数量", "ShowShangPin.aspx?id=" + Request.QueryString["id"].ToString());
            return;

        }
        int i;
        Hashtable Hash;
        //如果用户没有购物车，新生成一个
        if (Session["ShoppingCar"] == null)
        {
            Hash = new Hashtable();
        }
        else
        {
            //若用户已有购物车，则获取购物车对象
            Hash = (Hashtable)Session["ShoppingCar"];
        }
        string tb = sellCount.Text;
        string lb = Request.QueryString["id"].ToString();
        if (Int32.Parse(tb) > 0)
        {
            //如果购物车没有此商品，则新添加一个项
            if (!Hash.ContainsKey(lb))
            {
                //MyHashTable.add(index,object) index为hash表的关键字，Object为具体的内容
                Hash.Add(lb, Int32.Parse(tb));
            }
            //若购车车已存在该商品，则该商品数量+1
            else
            {
                Hash[lb] = (int)Hash[lb] + Convert.ToInt32(tb);
            }
        }
        Session["ShoppingCar"] = Hash;
        Response.Redirect("ByNow.aspx");
    }  
    
}




