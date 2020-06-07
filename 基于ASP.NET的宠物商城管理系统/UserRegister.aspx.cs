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
public partial class UserRegister : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = " 用户注册";
        if (!IsPostBack)
        {
            lblyanzheng.Text = CreateRandomCode(4);

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (lblyanzheng.Text != txtyan.Text)
        {

            Response.Write("<script>alert('验证码错误!');history.go(-1);</script>");
            return;
        }

        else {
            SqlDataReader dr = data.GetDataReader("select * from Users where  UserName='" + txtname.Text + "'");
            if (dr.Read())
            {
                Label1.Text = "已经存在账号了";
            }
            else
            {
                //data.RunSql("insert into Users(emal,UserName,Sex,pwd,XingMing,Tel,Address,ShengRi)values('" + txtemal.Text + "','" + txtname.Text + "','" + DropDownList1.SelectedItem.Text + "','" + PwdEncrypt.MD5Encrypt64(TextBox1.Text) + "','" + XingMing.Text + "','" + Tel.Text + "','" + Address.Text + "','" + txttime.Value + "')");
                data.RunSql("insert into Users(UserName,pwd,Tel)values('" + txtname.Text + "','" + PwdEncrypt.MD5Encrypt64(TextBox1.Text) + "','"  + Tel.Text + "')");

                Alert.AlertAndRedirect("注册成功！", "UserLogin.aspx");
            }
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

}
