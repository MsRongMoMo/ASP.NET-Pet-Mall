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


public partial class Admin_admin : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Page.IsPostBack) {
/*
            if (Session["admin"] == null)
            {
               
                Alert.AlertAndRedirect("您未登录，请先登录！", "./Admin/login.aspx");
            }*/

            showData();


        }
     
        string mysql = "select * from admin where admin='" + Session["admin"].ToString() + "'";
        SqlDataReader dr = data.GetDataReader(mysql);
        if (dr.Read())
        {
            Label2.Text = dr["admin"].ToString();
            Label3.Text = dr["roleName"].ToString();

        }
        if (Label3.Text == "超级管理员") {
            addAmin.Visible = true;
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string mysql = "select count(*) from admin where admin='" + TextBox1.Text + "'";

        int n = SqlHelper.dd(mysql);

        if (n > 0)
        {
            TextBox1.Focus();
            Label1.Visible = true;
            Label1.Text = "该用户已经存在！";
            return;
            //  Page.RegisterClientScriptBlock("e","<script language='javascript'>alert('该用户已经存在！')</script>");

        }
        else {
            string addAdmin = "insert into admin(admin,password,roleName)values('" + TextBox1.Text + "','" + PwdEncrypt.MD5Encrypt64(TextBox2.Text) + "','" + RadioButtonList2.SelectedItem.Text + "')";
            int add = SqlHelper.exexu(addAdmin);
            if (add > 0)
            {


                Label1.Visible = true;
                Label1.Text = "添加管理员成功!";
                showData();
            }
            else
            {


                Label1.Visible = true;
                Label1.Text = "添加管理员失败!";
            }
        }
      
    
    }













    //检测管理员用户名是否可用
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Page.RegisterClientScriptBlock("e", "<script>alert('用户名不能为空！')</script>");
        }
        else
        {
            string mysql = "select count(*) from admin where admin='" + TextBox1.Text + "'";

            int n = SqlHelper.dd(mysql);

            if (n > 0)
            {
                TextBox1.Focus();
                Label1.Visible = true;
                Label1.Text = "该用户已经存在！";
                //  Page.RegisterClientScriptBlock("e","<script language='javascript'>alert('该用户已经存在！')</script>");

            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "用户名可用";
                //Page.RegisterClientScriptBlock("e","<script>alert('用户名可用')</script>");
            }
        }
    }



    public void showData()
    {

        string mysql = "select * from admin ";
        GridView1.DataSource = data.GetDs(mysql,"Table");
        GridView1.DataBind();

    }




    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string ID = GridView1.Rows[e.RowIndex].Cells[0].Text;
        //获取准备执行的用户的用户名
        string adminName = GridView1.Rows[e.RowIndex].Cells[1].Text;
        //获取准备执行的用户的用户角色
        string adminRole = GridView1.Rows[e.RowIndex].Cells[3].Text;
        //获取当前登录的用户角色
        string currentRole = Label3.Text;
        //获取当前登录的用户的用户名
        string currentName = Label2.Text;

        if (currentRole == "超级管理员" && adminRole == "普通管理员"|| currentRole == adminRole && currentName == adminName)
        {
            try
            {
                int n = SqlHelper.exexu("delete  from admin  where  id='" + Convert.ToInt32(ID) + "'");
                if (n > 0)
                {
                    Response.Write("<script>confirm('删除成功！')</script>");
                    GridView1.EditIndex = -1;
                }

                showData();
            }
            catch
            {

                Response.Write("<script>confirm('删除失败！')</script>");
            }

        }
        else if(currentRole == "超级管理员" && adminRole == "超级管理员"|| currentRole == "普通管理员" && adminRole == "超级管理员"|| currentRole == "普通管理员" && adminRole == "普通管理员") {
            Response.Write("<script>confirm('您的权限不足')</script>");
        }
      
        

    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex; //编辑的行设置为鼠标作用的当前行
        showData();//一定要进行绑定
    }



    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)

    {
        string ID = GridView1.Rows[e.RowIndex].Cells[0].Text;
        string adminName = GridView1.Rows[e.RowIndex].Cells[1].Text;
        string adminRole = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text;
 
        string adminPwd = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text;
        string currentRole = Label3.Text;
        string currentName = Label2.Text;
      
        /*  GridView1.EditIndex = -1; //一定要设置,否则还处于编辑状态
          showData();*/

        if (currentRole == "超级管理员"&& adminRole =="普通管理员"|| adminName == Session["admin"].ToString())
      
        {
         
            int n = SqlHelper.exexu("update   admin  set password='" + PwdEncrypt.MD5Encrypt64(adminPwd) + "',roleName='" + adminRole + "'where id='"+Convert.ToInt32(ID)+"'");
            if (n > 0)
            {
                Response.Write("<script>alert('更新成功')</script>");

            }

            else
            {
                Response.Write("<script>alert('更新失败')</script>");
                GridView1.DataBind();

            }
            GridView1.EditIndex = -1; //一定要设置,否则还处于编辑状态
            showData();
        }
        else
        {
            Response.Write("<script>alert('您的权限不足')</script>");
            GridView1.EditIndex = -1; //一定要设置,否则还处于编辑状态
            showData();
        }

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        /* GridView1.DataBind(); //最后还要重新绑定,否则还是呈现"更新"和"取消"*/
        showData();

    }


   
}
