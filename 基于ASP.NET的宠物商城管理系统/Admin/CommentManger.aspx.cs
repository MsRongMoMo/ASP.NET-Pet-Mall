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
using System.IO;

public partial class AdminManger_CommentManger : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShangPinClass.DataSource = data.GetDataReader("select distinct ShangPinType.*  from ShangPinInfo,ShangPinType,Comment where Comment.ShangPinID=ShangPinInfo.ShangPinID and ShangPinInfo.ShangPinTypeID=ShangPinType.id");
            ShangPinClass.DataValueField = "id";
            ShangPinClass.DataTextField = "name";
            ShangPinClass.DataBind();
            ShangPinClass.Items.Add("所有类别");
            ShangPinClass.Items[this.ShangPinClass.Items.Count - 1].Value = "0";
            ShangPinClass.SelectedIndex = this.ShangPinClass.Items.Count - 1;

            Get_Info();
        }
    }
    protected void gvInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlHelper mydata = new SqlHelper();

        string ID = gvInfo.DataKeys[e.RowIndex].Values[0].ToString();
        try
        {
            mydata.RunSql("delete  from Comment  where  id='" + ID + "'");

            Label4.Text = "删除成功！";
            gvInfo.EditIndex = -1;
            Get_Info();
        }
        catch
        {

            Label4.Text = "删除失败！";
        }

    }
    private void Get_Info()
    {
        try
        {


            gvInfo.DataSource = GetCodeBy("select  Comment.* ,ShangPinInfo.* from Comment,ShangPinInfo where Comment.ShangPinID=ShangPinInfo.ShangPinID");
            gvInfo.DataBind();
        }
        catch
        {

        }

    }
    private void Get_Info(string sqlstring)
    {
        try
        {


            gvInfo.DataSource = GetCodeBy(sqlstring);
            gvInfo.DataBind();
        }
        catch
        {

        }

    }
    protected void gvInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvInfo.PageIndex = e.NewPageIndex;
        Get_Info();
    }
    protected void gvInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //鼠标移动变色
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标放上去的时候 先保存当前行的背景颜色 并给附一颜色 
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f6f6f6',this.style.fontWeight='';");
            //当鼠标离开的时候 将背景颜色还原的以前的颜色 
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor,this.style.fontWeight='';");
        }
        //单击行改变行背景颜色 
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onclick", "this.style.backgroundColor='#f6f6f6'; this.style.color='buttontext';this.style.cursor='default';");
        }

    }


    public DataSet GetCodeBy(string sqlstring)
    {
        SqlHelper date = new SqlHelper();
        // string strTop = "";
        /*  if (iCount > 1)
          {
              strTop = "top " + iCount.ToString();
          }*/

        string sql = sqlstring;
        SqlConnection con = new SqlConnection(SqlHelper.connstring);
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = null;
        try
        {
            con.Open();
            ds = new DataSet();
            da.Fill(ds);

        }
        catch (SqlException ex)
        {
            throw ex;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
        }
        return ds;
    }



    protected void ShangPinClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(ShangPinClass.SelectedValue) > 0)
            {
                gvInfo.DataSource = GetCodeBy("select Comment.*,ShangPinInfo.* from Comment,ShangPinInfo where Comment.ShangPinID=ShangPinInfo.ShangPinID and ShangPinInfo.ShangPinTypeID=" + ShangPinClass.SelectedValue);
                gvInfo.DataBind();
                Get_Info("select Comment.*,ShangPinInfo.* from Comment, ShangPinInfo where Comment.ShangPinID = ShangPinInfo.ShangPinID and ShangPinInfo.ShangPinTypeID =" + ShangPinClass.SelectedValue);
            }
            else if (Convert.ToInt32(ShangPinClass.SelectedValue) == 0)
            {
                Get_Info();
            }
        }
        catch
        {
        }


    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox3.Text == "")
        {
            Page.RegisterClientScriptBlock("e", "<script>alert('请输入查询商品ID号!')</script>");
            Get_Info();
        }
        else
        {

            //gvInfo.DataSource = GetCodeBy("select  Comment.*  ,ShangPinInfo.* from Comment,ShangPinInfo where Comment.ShangPinID=" + TextBox3.Text );
            //gvInfo.DataBind();
            Get_Info("select  Comment.* ,ShangPinInfo.* from Comment,ShangPinInfo where Comment.ShangPinID=ShangPinInfo.ShangPinID and Comment.ShangPinID=" + TextBox3.Text );
        }
    }

}
