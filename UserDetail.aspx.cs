using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        userDetailLoad();
    }

    public void userDetailLoad()
    {
        string user_id = Session["UserID"].ToString();

        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        Conn.Open();

        try
        {
            SqlCommand command = new SqlCommand("SELECT * FROM [members].[User] WHERE [user_id] = @userid", Conn);

            command.Parameters.AddWithValue("@userid", user_id);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                string FName = reader["user_fname"].ToString();
                lblFName.Text = FName;

                string LName = reader["user_lname"].ToString();
                lblLName.Text = LName;

                string BirthDate = reader["user_jdate"].ToString().Trim();
                lblBirthDate.Text = BirthDate;
            }
        }
        catch(Exception e)
        {

        }
    }
}