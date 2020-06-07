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

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    Login1.Visible = false;
                    Login2.Visible = true;

                }
                else
                {
                    Label1.Text = Session["UserName"].ToString();
                    Image2.ImageUrl = "files/" + Session["Photo"].ToString();

                    Login1.Visible = true;
                    Login2.Visible = false;

                }
            }




            DropDownList1.DataSource = data.GetDataReader("select * from ShangPinType");
            DropDownList1.DataValueField = "id";
            DropDownList1.DataTextField = "name";
            DropDownList1.DataBind();
            DropDownList1.Items.Add("所有类别");
            DropDownList1.Items[this.DropDownList1.Items.Count - 1].Value = " ";
            DropDownList1.SelectedIndex = this.DropDownList1.Items.Count - 1;

           


        }

        if (Request.QueryString["activeItem"]!=null) {
            string activeItem = Request.QueryString["activeItem"].ToString();

            switch (activeItem)
            {
                case "0": LI0.Style.Value = "background-color:#9a0000"; break;
                case "1": LI1.Style.Value = "background-color:#9a0000"; break;
                case "2": LI2.Style.Value = "background-color:#9a0000"; break;
                case "3": LI3.Style.Value = "background-color:#9a0000"; break;
                case "4": LI4.Style.Value = "background-color:#9a0000"; break;
                case "5": LI5.Style.Value = "background-color:#9a0000"; break;
                case "6": LI6.Style.Value = "background-color:#9a0000"; break;
            }
        }
       

        
        /* LI2.Style.Value = "background-color:#9a0000";*/


    }
    protected string CutChar(string strChar, int intLength)
    {
        //取得自定义长度的字符串
        if (strChar.Length > intLength)
        { return strChar.Substring(0, intLength); }
        else
        { return strChar; }

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchShangPinList.aspx?ShangPinName=" + TxtName.Text + "&ShangPinTypeName=" + DropDownList1.SelectedItem.Text);
    }

/*跳转用户中心*/
   /* protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx?activeItem=6");
    }*/

    /*退出登录*/
    protected void Button4_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["UserId"] = null;
        Session["UserName"] = null;
        Response.Redirect("Default.aspx?activeItem=0");
    }
}
