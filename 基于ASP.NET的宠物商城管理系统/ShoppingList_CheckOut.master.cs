using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingList_CheckOut : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
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
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session["UserId"] = null;
        Session["UserName"] = null;
        Response.Redirect("Default.aspx?activeItem=0");
    }
}
