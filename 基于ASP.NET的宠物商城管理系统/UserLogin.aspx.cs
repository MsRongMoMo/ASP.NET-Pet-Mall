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
public partial class UserLogin : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = " 用户登录";
        if (!IsPostBack)
        {
            lblyanzheng.Text = CreateRandomCode(4);

        }


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (lblyanzheng.Text != txtyan.Text)
        {
          
            Response.Write("<script>alert('验证码错误!');history.go(-1);</script>");
            return;
        }
        else
        {

            chkADmin();



        }




    }

    private void chkADmin() { 
      if (TxtUserName.Text == "" && TxtPassword.Text == "")
        {


            //  Alert.AlertAndRedirect("没有输入账号和密码！", "Default.aspx");
            Label1.Text = "没有输入账号和密码！";
        }
        else
        {
            SqlDataReader dr;
            dr = data.GetDataReader("select * from  Users where UserName='" + TxtUserName.Text.Trim() + "'and pwd='" + PwdEncrypt.MD5Encrypt64(TxtPassword.Text.Trim()) + "'");
            if (dr.Read())
            {
                Session["UserId"] = dr["id"].ToString();
                Session["UserName"] = dr["UserName"].ToString();
                Session["Photo"] = dr["Photo"].ToString();
                Response.Redirect("Default.aspx?activeItem=0");
            }
            else
            {
                Label1.Text = "账号或者密码不对请重新登陆！";
                /*Alert.AlertAndRedirect("账号或者密码不对请重新登陆！", "Default.aspx");*/
            }
        }
    }


    //验证码
    protected string CreateRandomCode(int codeCount)
    {
        string allChar = "0,1,2,3,4,5,6,7,8,9";
        string[] allCharArray = allChar.Split(',');
        string randomCode = "";
        int temp = -1;
        Random rand = new Random();
        for (int i = 0; i < codeCount; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(10);
            if (temp == t)
            {
                return CreateRandomCode(codeCount);
            }
            temp = t;
            randomCode += allCharArray[t];
        }
        return randomCode;
    }

}