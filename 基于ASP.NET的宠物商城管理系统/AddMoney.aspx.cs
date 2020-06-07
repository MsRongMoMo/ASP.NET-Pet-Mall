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
public partial class AddMoney : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "充值中心";
        if (Session["UserName"] == null)
        {
            Response.Redirect("ssnotice.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["UserName"].ToString() == "")
            {
                Alert.AlertAndRedirect("您没有登陆不能充值", "UserLogin.aspx");
            }
            else
            {
                SqlDataReader dr;
                dr = data.GetDataReader("select * from  Users  where id='" + Session["UserId"].ToString() + "'");
                if (dr.Read())
                {
                    Label1.Text = dr["MemberMoney"].ToString();
                }
            }
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        data.RunSql("update Users set MemberMoney=MemberMoney+" + Convert.ToDecimal(txtLoginName.Text) + ",ZongMoney=ZongMoney+" + Convert.ToDecimal(txtLoginName.Text) + " where id='" + Session["UserId"].ToString() + "'");
       
        if (Request.QueryString["action"]== "recharge") {
            Response.Write("<script>alert('充值成功请继续结算'); history.go(-2);</script>");
        }
        else {
            Response.Write("<script>alert('充值成功!');history.go(-1);</script>");


        }



    }
}
