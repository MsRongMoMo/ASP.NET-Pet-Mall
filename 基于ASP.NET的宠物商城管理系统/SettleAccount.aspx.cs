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
public partial class SettleAccount : System.Web.UI.Page
{

    Double TtlPrice;
   /* Double jifena;*/
    SqlHelper data = new SqlHelper();
    SqlConnection sqlconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null)
        {
            Response.Redirect("ssnotice.aspx");
        }
        else
        {

            if (!Page.IsPostBack)
            {
              
                Panel1.Visible = false;
                SqlDataReader dr = data.GetDataReader("select * from Users where id=" + Session["UserId"]);
                dr.Read();
                TextBox5.Text = dr["XingMing"].ToString();
                TextBox6.Text = dr["Tel"].ToString();
                Address.Text = dr["Address"].ToString();
            }
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
        //string strconn = "Provider=Microsoft.Jet.OleDb.4.0;Data Source=" + Server.MapPath("App_Data/shopping.mdb");
        //string strsql = "Select * From 宠物 Where 编号 In " + Products;
        //OleDbConnection myConnection = new OleDbConnection(strconn);
        //OleDbCommand myCommand = new OleDbCommand(strsql, myConnection);
        //myConnection.Open();
        //OleDbDataAdapter da = new OleDbDataAdapter(myCommand);
        SqlConnection conn = new SqlConnection(SqlHelper.connstring);

        conn.Open();
        string mysql = "select * from ShangPinInfo where ShangPinID in" + Products;
        SqlCommand cmd = new SqlCommand(mysql, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        da.Fill(ds, "product");
        DataTable Table1 = new DataTable();
        Table1 = ds.Tables["product"];
        Table1.Columns.Add(new DataColumn("PurchaseCount", System.Type.GetType("System.Int32")));
       
        DataColumn[] Keys = { Table1.Columns["ShangPinID"] };
        Table1.PrimaryKey = Keys;
        foreach (string X in Hash.Keys)
        {
            Table1.Rows.Find(X)["PurchaseCount"] = Hash[X];
     

        }
        Table1.Columns.Add(new DataColumn("TotalPrice", System.Type.GetType("System.Double"), "ShangPinPrice*PurchaseCount"));
        /*Table1.Columns.Add(new DataColumn("zongji", System.Type.GetType("System.Double"), "ShangPinJiFen*PurchaseCount"));*/
        for (int I = 0; I < Table1.Rows.Count; I++)
        {
        /*    jifena += Convert.ToDouble(Table1.Rows[I]["zongji"]);*/
            TtlPrice += Convert.ToDouble(Table1.Rows[I]["TotalPrice"]);
        }
        // Session["TtlPrice"]=
        double ztg = Convert.ToDouble(TtlPrice.ToString()) + Convert.ToDouble(RadioButtonList1.SelectedValue.ToString());
        Label3.Text = ztg.ToString();
        SettleCountMoney.Text = ztg.ToString();
        Label1.Text = "应付总额:" + TtlPrice.ToString() + "元+" + RadioButtonList1.SelectedValue.ToString() + "元(邮费)=" + ztg.ToString() + "元";
   /*     Label12.Text = jifena.ToString();*/
        MyGrid.DataSource = Table1.DefaultView;
        MyGrid.DataBind();
    }
    protected void next_Click(object sender, EventArgs e)
    {

        SqlDataReader dr1;
        dr1 = data.GetDataReader("select * from Users where id='" + Session["UserId"].ToString() + "'");
        dr1.Read();
        string MPrice = dr1["MemberMoney"].ToString();
        if (Label10.Text == "会员结算")
        {
            if (Convert.ToDecimal(MPrice) < Convert.ToDecimal(SettleCountMoney.Text.Trim()))
            {

                Alert.AlertAndRedirect("您的余额不足，请充值后再购买", "AddMoney.aspx?action=recharge");
                return;


            }
        }


        //下订单代码

        string mysql1 = "select * from  Users where UserName='" + Session["UserName"].ToString() + "'";
        SqlDataReader dr = data.GetDataReader(mysql1);
        if (dr.Read())
        {
            //设置用户折扣
            int discount = Convert.ToInt32(dr["ZongMoney"].ToString());
            //默认为100，不打折
            int discountLevel = 100;
            if (discount >= 1500){
                discountLevel = 80; }
            else if (discount >= 1000){
                discountLevel = 88; }
            else if (discount >= 500){
                discountLevel = 95; }
            string setDiscount = "update Users set ZheKou=" + discountLevel+"where id="+Session["UserId"];
          data.ReturnSql(setDiscount);
            string zhekou=data.ReturnSql("select ZheKou from Users where id=" + Session["UserId"]);
           

            //添加订单 ORDERS表信息
            string userid = dr["id"].ToString();

            DateTime ordertime = DateTime.Now;
            string orderid = ordertime.ToString("yyyymmddhhmmss");
            
            decimal VIPPrice= Convert.ToDecimal(Label3.Text)* Convert.ToDecimal(zhekou);
            VIPPrice = VIPPrice / 100;
            string mysql = "insert into orders(orderid,username,userid,shouhuoname,telephone,address,songhuofs,fukuanfs,dingdanshijian,dingdantotal,beizhu,memberPrice)values('" + orderid + "','" + Session["username"].ToString() + "','" + userid + "','" + TextBox5.Text + "', '" + TextBox6.Text + "','" + Label4.Text + "','" + RadioButtonList1.SelectedItem.Text + "','" + RadioButtonList2.SelectedItem.Text + "','" + ordertime + "','" + Label3.Text + "','" + TextBox3.Text + "','"+ VIPPrice+"'); SELECT @@IDENTITY AS 'Identity'";
            SqlDataReader dra = data.GetDataReader(mysql);
            if (dra.Read())
            {
                string uoid = dra["Identity"].ToString();
                string mysql3 = "select * from orders where oid='" + uoid + "'";
                SqlDataReader drb = data.GetDataReader(mysql3);
                for (int i = 0; i < MyGrid.Rows.Count; i++)
                {

                    Label ShangPinID = (Label)MyGrid.Rows[i].FindControl("label1");
                    Label PurchaseCount = (Label)MyGrid.Rows[i].FindControl("PurchaseCount");
                    Label xiaoji = (Label)MyGrid.Rows[i].FindControl("label2");
                    int ShangPinIDs = Convert.ToInt32(ShangPinID.Text);
                    int PurchaseCounta = Convert.ToInt32(PurchaseCount.Text);
                    double xiaojia = Convert.ToDouble(xiaoji.Text);

                    string mysql2 = "insert into orderdetail(pid,shuliang,orderid,producttotail)values('" + ShangPinIDs + "','" + PurchaseCounta + "','" + orderid + "','" + xiaojia + "')";
                    int b = SqlHelper.exexu(mysql2);
                    if (b > 0)
                    {
                        //会员结算
                        if (RadioButtonList2.SelectedValue == "1")
                        {
                            
                            //默认折扣为100 ， 实际金额需要整除
                            decimal memberPrice=Convert.ToDecimal(SettleCountMoney.Text) * Convert.ToDecimal(zhekou);
                            memberPrice = memberPrice / 100;
                            string sqlstrshop1 = "update Users set MemberMoney='"+ (Convert.ToDecimal(MPrice) - memberPrice) + "' where id='" + Session["UserId"].ToString() + "'";
                            data.RunSql(sqlstrshop1);

                        }

                        Response.Write("<script>alert('下订单成功!');location.href='UserHome.aspx'</script>");
                        Session["ShoppingCar"] = null;


                    }


                }

            }

        }
        // Session["d_id"] = Label2.Text;
    }



    protected void previous_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        shoplist();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      

        Panel1.Visible = true;
        Panel2.Visible = false;
        Label7.Text = TextBox5.Text;
        Label8.Text = TextBox6.Text;
       // Label9.Text = TextBox1.Text;
        Label10.Text = RadioButtonList2.SelectedItem.Text;
        shoplist();
        Label4.Text = Session["dizhi"].ToString() + TextBox4.Text;


       
            

        }
   
        
}