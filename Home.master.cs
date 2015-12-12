using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Home : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=VideoPortal;Integrated Security=True;User ID=sa; Password=a8533986a");
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM data.Category", conn);
            adp.Fill(dt);
            repCategory.DataSource = dt;
            repCategory.DataBind();
        }
        catch{
            Response.Write("There was an error retrieving categories");
        }
        finally{
            conn.Close();
        }
    }

    protected void lnkBtnLogout_Click(Object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Session.Abandon();
        Response.Redirect("/Default.aspx");
    }
}
