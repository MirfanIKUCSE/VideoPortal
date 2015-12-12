using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Video : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        uploadDetails(Int32.Parse(Request.QueryString["vid"]));

        if(!IsPostBack && Request.QueryString!=null)
        {
            IncrementView();
        }
        uploadDtLComment();

        string table_name = "[members].[Post]";
        DataTable dt = Toolkit.SelectAllInfoByParameters(table_name, Request.QueryString["vid"].ToString());
        string num_like = dt.Rows[0]["num_likes"].ToString();
        string num_dislike = dt.Rows[0]["num_dislikes"].ToString();
        lblLikeResult.Text = num_like;
        lblDislikeResult.Text = num_dislike;
    }
    
    public void uploadDetails(int post_id)
    {
        DataTable dt = Toolkit.ProcReadVideoContent(post_id);
        lblCaption.Text = dt.Rows[0]["post_caption"].ToString();
        lblDescrp.Text = dt.Rows[0]["post_description"].ToString();
    }

    // Invokes selectSRC(string post_id) which is in Toolkit.cs and returns the post_link row as String
    public string takeSRC()
    {
        string post_id = Request.QueryString["vid"];
        string ConnStr = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString.ToString();
             
        DataTable dt = Toolkit.selectSRC(post_id);
        string src = dt.Rows[0]["post_link"].ToString();

        return src;
    }

    public void IncrementView()
    {
        string post_id = Request.QueryString["vid"];
        Toolkit.ProcIncrementView(post_id);
    }

    public void IncrementLike()
    {
        string post_id = Request.QueryString["vid"];
        
        Toolkit.ProcIncrementLike(post_id);
        string ConnStr = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString.ToString();

        string table_name = "[members].[Post]";
        DataTable dt = Toolkit.SelectAllInfoByParameters(table_name, post_id);
        string src  = dt.Rows[0]["num_likes"].ToString();
        lblLikeResult.Text = src;
    }

    public void IncrementDislike()
    {
        string post_id = Request.QueryString["vid"];
        string table_name = "[members].[Post]";
        Toolkit.ProcIncrementDislike(post_id);
        string ConnStr = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString.ToString();
        
        DataTable dt = Toolkit.SelectAllInfoByParameters(table_name, post_id);
        string src = dt.Rows[0]["num_dislikes"].ToString();
        lblDislikeResult.Text = src;
    }

    protected void linkbtnLike_Click(object sender, EventArgs e)
    {
        IncrementLike();
    }

    protected void linkbtnDislike_Click(object sender, EventArgs e)
    {
        IncrementDislike();
    }

    public void InsertComment()
    {
        int result=-1;
        //string user_id = Session["UserID"].ToString();
        if (Session["UserID"] != null)
        {
            string user_id = Session["UserID"].ToString();
            string post_id = Request.QueryString["vid"];
            DateTime now = DateTime.Now;
            string time = Convert.ToString(now);

            string comment = txtBoxComment.Text;
            result = Toolkit.ProcInsertComment(post_id, user_id, comment, time);
            txtBoxComment.Text = null;
            if(result==1)
            {
                lblSuccess.Text = "Thank you!";
            }
            else
            {
                lblSuccess.Text = "Sorry! Something went wrong!";
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
        uploadDtLComment();
    }

    protected void uploadDtLComment()
    {
        string post_id = Request.QueryString["vid"];
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        Conn.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();

        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [members].[Comment] INNER JOIN [members].[User] ON [members].[Comment].[user_id] = [members].[User].[user_id] WHERE [members].[Comment].[post_id] = @post_id", Conn);
            adp.SelectCommand = cmd;
            adp.SelectCommand.Parameters.AddWithValue("@post_id", post_id);
            adp.Fill(dt);
            DtLComment.DataSource = dt;
            DtLComment.DataBind();
        }
        catch (Exception e)
        {

        }
    }

    protected void btnAddComment_Click(object sender, EventArgs e)
    {
        InsertComment();
    }
    
}