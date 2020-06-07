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

public partial class Login : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    SqlDataReader dr;
    Alert js = new Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblyanzheng.Text = CreateRandomCode(4);

        }

    }
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


    private void chkADmin()
    {
        if (TxtUserName.Text == "" && TxtPassword.Text == "")
        {
            Alert.AlertAndRedirect("没有输入账号和密码！", "Login.aspx");


        }
        else
        {
            dr = data.GetDataReader("select * from  admin where admin='" + TxtUserName.Text.Trim() + "'and password='" + PwdEncrypt.MD5Encrypt64(TxtPassword.Text.Trim()) + "'    ");
            if (dr.Read())
            {
                Session["admin"] = dr["admin"].ToString();

                Response.Redirect("index.html");

            }
            else
            {
                Alert.AlertAndRedirect("管理员的账号或者密码不对请重新登陆！", "login.aspx");
            }
        }
    }
 
    protected void Image1_ServerClick(object sender, ImageClickEventArgs e)
    {
        if (lblyanzheng.Text != txtyan.Text)
        {
            js.Alertjs("验证码错误");
            return;
        }
        else
        {

            chkADmin();



        }
    }
}
