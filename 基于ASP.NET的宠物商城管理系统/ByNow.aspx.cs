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
public partial class ByNow : System.Web.UI.Page
{
    // Double 总价格;
    Double TtlPrice;

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
            {
                Alert.AlertAndRedirect("对不起您还没有登录", "UserLogin.aspx");
            }
            Msg.Visible = false;
            shoplist();
           

        }

    }
    protected void shoplist()
    {
        Hashtable Hash;
        if (Session["ShoppingCar"] == null)
        {
            Hash = new Hashtable();
        }
        else
        {
            Hash = (Hashtable)Session["ShoppingCar"];
        }
        if (Hash.Count == 0)
        {
        
            Msg.Visible = true;
            Msg.Text = "您还没有购物呢？赶快购物吧!";
        }

        string[] ArrKey = new string[Hash.Count];
        int[] ArrVal = new int[Hash.Count];
        string Products = "('";
        Hash.Keys.CopyTo(ArrKey, 0);
        Hash.Values.CopyTo(ArrVal, 0);
        int k = 0;
        for (int j = 0; j < ArrKey.Length; j++)
        {
            if (k > 0) Products += "','"; k++;
            Products += ArrKey.GetValue(j).ToString();
        }
        Products += "')";

        SqlConnection conn = new SqlConnection(SqlHelper.connstring);

        conn.Open();
        string mysql = "select * from ShangPinInfo where ShangPinID in" + Products;
        SqlCommand cmd = new SqlCommand(mysql, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "ShangPinInfo");
        DataTable Table1 = new DataTable();
        Table1 = ds.Tables["ShangPinInfo"];
        Table1.Columns.Add(new DataColumn("PurchaseCount", System.Type.GetType("System.Int32")));

        DataColumn[] Keys = { Table1.Columns["ShangPinID"] };
        Table1.PrimaryKey = Keys;
        foreach (string X in Hash.Keys)
        {
            Table1.Rows.Find(X)["PurchaseCount"] = Hash[X];

        }
        Table1.Columns.Add(new DataColumn("TotalPrice", System.Type.GetType("System.Double"), "ShangPinPrice*PurchaseCount"));


        for (int I = 0; I < Table1.Rows.Count; I++)
        {
            TtlPrice += Convert.ToDouble(Table1.Rows[I]["TotalPrice"]);

        }

        Label1.Text = TtlPrice.ToString();
        Session["TotalPrice"] = Label1.Text.ToString();
        MyGrid.DataSource = Table1.DefaultView;
        MyGrid.DataBind();

    }


    protected void MyGrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Hashtable Hash;
        if (Session["ShoppingCar"] == null)
        {
            Hash = new Hashtable();
        }
        else
        {
            Hash = (Hashtable)Session["ShoppingCar"];
        }

        if (Hash.ContainsKey(e.CommandArgument))
        {
            Hash.Remove(e.CommandArgument);
        }
        Msg.Text = (string)e.CommandArgument;

        Session["ShoppingCar"] = Hash;
        shoplist();
    }
    protected void changeCount_Click(object sender, EventArgs e)
    {
        int i;
        Hashtable Hash;
        if (Session["ShoppingCar"] == null)
        {
            Hash = new Hashtable();
        }
        else
        {
            Hash = (Hashtable)Session["ShoppingCar"];

        }

        for (i = 0; i < MyGrid.Rows.Count; i++)
        {
            // CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("BuyIt");
            Label lb = (Label)MyGrid.Rows[i].FindControl("bianhao");
            TextBox tb = (TextBox)MyGrid.Rows[i].FindControl("PurchaseCount");

            //if (cb.Checked && Int32.Parse(tb.Text) > 0)
            //{
            if (Convert.ToInt32(tb.Text) <= 0)
            {
                this.RegisterClientScriptBlock("E", "<script>alert('数量填写错误!')</script>");
                tb.Focus();
                return;
                //ClientScript.RegisterStartupScript(ClientScript.GetType(), "aa", "<script>alert('')</script>");
            }
            else if (!Hash.ContainsKey(lb.Text))
            {
                Hash.Add(lb.Text, Int32.Parse(tb.Text));
            }
            else
            {
                Hash[lb.Text] = Convert.ToInt32(tb.Text);
            }
            //}
        }

        Session["ShoppingCar"] = Hash;
        shoplist();
    }








    protected void clearCar_Click(object sender, EventArgs e)
    {
        Session["ShoppingCar"] = null;
        shoplist();
    }
    protected void toshopping_Click(object sender, EventArgs e)
    {
        Response.Write("<script>history.go(-3);</script>");
    }
    protected void toSettleAccount_Click(object sender, EventArgs e)
    {
        if (MyGrid.Rows.Count == 0)
        {
            Page.RegisterClientScriptBlock("e", "<script>alert('请先购物!')</script>");
        }
        else if (Session["UserName"] == null)
        {

            Response.Write("<script>alert('请先登录!');location.href='UserLogin.aspx'</script>");

            // Server.Transfer("userlogin.aspx");
        }
        else
        {

            Response.Redirect("SettleAccount.aspx");
        }
    }


 

  

}
