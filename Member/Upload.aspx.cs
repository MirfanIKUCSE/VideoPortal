using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Member_Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //
            // TODO: call the load function
            loadControls();
            //
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        //
        // TODO: try to execute stored procedure to upload the video with given information
        //
        string caption = txtCaption.Text.Trim();
        string description = txtDescription.Text.Trim();
        string link = txtLink.Text.Trim();
        string category = ddlCateogory.SelectedValue.ToString();
        string user_id = Session["UserID"].ToString();
        if(Toolkit.InsertPost(user_id,caption,description,link,category) == 1)
        {
            lblMessage.Text = "Upload Successfull!";
        }
        else
        {
            lblMessage.Text = "Upload Failed! Video you're trying to upload already exist!";
        }
   }

    private void loadControls()
    {
        //
        // TODO: fill all the required controls
        //
        string table_name = "[data].[Category]";
        DataTable dt = Toolkit.SelectAllFromTable(table_name);
        ddlCateogory.DataSource = dt;
        ddlCateogory.DataTextField = "category_name";
        ddlCateogory.DataValueField= "category_id";
        ddlCateogory.DataBind();
        ddlCateogory.Items.Insert(0, "-Select Category-");
    }
}