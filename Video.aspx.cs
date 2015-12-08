using System;
using System.Collections.Generic;
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
        retrievePostID();
    }

    public void retrievePostID()
    {
        int post_id = Int32.Parse(Request.QueryString["vid"].ToString());
        uploadDetails(post_id);
    }

    public void uploadDetails(int post_id)
    {
        DataTable dt = Toolkit.ProcReadVideoContent(post_id);
        lblCaption.Text = dt.Rows[0]["post_caption"].ToString();
        lblDescrp.Text = dt.Rows[0]["post_description"].ToString();
    }
}