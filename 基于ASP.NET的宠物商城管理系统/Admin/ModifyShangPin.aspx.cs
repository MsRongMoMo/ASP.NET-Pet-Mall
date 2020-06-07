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
public partial class AdminManger_ModifyShangPin : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = data.GetDataReader("select * from ShangPinType");
            DropDownList1.DataValueField = "id";
            DropDownList1.DataTextField = "name";
            DropDownList1.DataBind();
         string   sql = "select * from ShangPinInfo where ShangPinID=" + Request.QueryString["id"].ToString();
            getdata(sql);
        }
    }
    private void getdata(string sql)
    {
        SqlDataReader dr = data.GetDataReader(sql);
        if (dr.Read())
        {
            title.Text = dr["ShangPinName"].ToString();
            TextBox2.Text = dr["ShangPinPrice"].ToString();
            TextBox3.Text = dr["ShangPinNum"].ToString();
            content1.Value = dr["ShangPinIntroduce"].ToString();
            pic.Text = dr["ShangPinPhoto"].ToString();
            Image1.ImageUrl = "../files/" + dr["ShangPinPhoto"].ToString();
            DropDownList1.Items.FindByValue(dr["ShangPinTypeID"].ToString()).Selected = true;
            DropDownList1.Items.FindByText(dr["ShangPinTypeName"].ToString()).Selected = true;

            TextBox1.Text = dr["ShangPinKuanshi"].ToString();
          
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string res;
        upload up = new upload();
        res = up.Up(file1, "../files/");
        this.Label1.Visible = true;
        this.Label1.Text = up.Resup[Convert.ToInt32(res)];
        this.pic.Text = up.s;
        Image1.ImageUrl = "../files/" + pic.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "update ShangPinInfo set ShangPinName='" + title.Text.ToString().Trim() + "',ShangPinPrice='" + TextBox2.Text + "',ShangPinNum='" + TextBox3.Text + "',ShangPinIntroduce='" + content1.Value + "' ,ShangPinPhoto='" + pic.Text + "',ShangPinTypeID='" + DropDownList1.SelectedValue + "',ShangPinTypeName='" + DropDownList1.SelectedItem.Text + "',ShangPinKuanshi='" + TextBox1.Text + "'   where ShangPinID=" + Request.QueryString["id"].ToString();
        data.RunSql(sql);
        Alert.AlertAndRedirect("修改成功", "ShangPinManger.aspx");
    }
}
