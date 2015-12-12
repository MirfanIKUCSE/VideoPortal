using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// A very helpfull toolkit
/// </summary>
public class Toolkit
{
    public Toolkit()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Perform login on website with given credentials
    /// </summary>
    /// <param name="username">Username or Email Address</param>
    /// <param name="password">User Password</param>
    /// <returns>Result of login action: true or false</returns>
    public static bool DoLogin(string username, string password)
    {
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM [members].[User] WHERE user_email = @user_email", Conn);
            //cmd.Parameters.AddWithValue("@user_nick",username);
            cmd.Parameters.AddWithValue("@user_email", username);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            Conn.Open();
            adp.Fill(dt);
            Conn.Close();
            if (dt.Rows[0]["user_password"].ToString().Trim() == password)
            {
                return true;
            }
        }
        catch (Exception e)
        {
            //
            // TODO: Add constructor logic here
            //
        }
        return false;
    }

    /// <summary>
    /// Gets specified information about Member with given Email/Nickname
    /// Default specification is: user_id
    /// 
    /// </summary>
    /// <param name="usermail">Email Address or Nickname</param>
    /// <param name="order">Ordered info: user_id, user_nick, user_email.. Only valid for User table column names</param>
    /// <returns></returns>
    public static string GetUserInfobyMail(string usermail, string order = "user_id")
    {
        string some = "--";
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        if (usermail != null)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [members].[User] WHERE [user_email] = @user_email", Conn);
                //cmd.Parameters.AddWithValue("@info", order);
                cmd.Parameters.AddWithValue("@user_email", usermail);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                Conn.Open();
                adp.Fill(dt);
                Conn.Close();
                some = dt.Rows[0][order].ToString();
                return some;
            }
            catch (Exception e)
            {

            }
        }
        return some;
    }

    /// <summary>
    /// Executes a stored procedure to post the video to the viPortal database.
    /// </summary>
    /// <param name="user_id">NOTE: Will be filled by Session[UserID]</param>
    /// <param name="caption"></param>
    /// <param name="description"></param>
    /// <param name="link"></param>
    /// <param name="category"></param>
    /// <returns>Return cases: failure -1, on success 1, if cannot insert 0</returns>
    public static int InsertPost(string user_id, string caption, string description, string link, string category)
    {
        //
        // TODO:    Perform stored procedure
        //
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        if (user_id != null)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "InsertPost";
                cmd.Parameters.AddWithValue("@usr_id", Convert.ToInt32(user_id));
                cmd.Parameters.AddWithValue("@pcap", caption);
                cmd.Parameters.AddWithValue("@pdesc", description);
                cmd.Parameters.AddWithValue("@plink", link);
                cmd.Parameters.AddWithValue("@pcat", Convert.ToInt32(category));
                cmd.Connection = Conn;
                Conn.Open();
                int result = cmd.ExecuteNonQuery();
                Conn.Close();
                return result;
            }
            catch (Exception e)
            {
                //
                // TODO: Log the error somewhere. Do research about it
                //
            }

        }
        return -1;
    }

    /// <summary>
    /// Selects all the data from the specified table_name
    /// </summary>
    /// <param name="table_name">NOTE: table_name must be exist in the database</param>
    /// <returns>Returns a DataTable object filled with table info</returns>
    public static DataTable SelectAllFromTable(string table_name)
    {
        DataTable dt = new DataTable();
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        if (table_name != null)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM " + table_name, Conn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                Conn.Open();
                adp.Fill(dt);
                Conn.Close();
            }
            catch (Exception e)
            {

            }
        }
        return dt;
    }

    /// <summary>
    /// Executes a stored procedure to signup a user to the viPortal database with given credentials
    /// </summary>
    /// <param name="nick">Must be unique</param>
    /// <param name="email">Must be unique</param>
    /// <param name="password"></param>
    /// <param name="fname"></param>
    /// <param name="lname"></param>
    /// <returns>Return cases: failure -1, on success 1, cannot insert 0</returns>
    public static int InsertUser(string nick, string email, string password, string fname, string lname)
    {
        int result = -1;
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertUser";
            cmd.Parameters.AddWithValue("@user_nick", nick);
            cmd.Parameters.AddWithValue("@user_email", email);
            cmd.Parameters.AddWithValue("@user_password", password);
            cmd.Parameters.AddWithValue("@user_fname", fname);
            cmd.Parameters.AddWithValue("@user_lname", lname);
            cmd.Connection = Conn;
            Conn.Open();
            result = cmd.ExecuteNonQuery();
            Conn.Close();
        }
        catch (Exception e)
        {

        }
        return result;
    }

    /// <summary>
    /// By the selected video's id information, this method retrieves 
    /// result of Stored Procedure and stores it to DataTable dt
    /// </summary>
    /// <param name="post_id"></param>
    /// <returns></returns>
    public static DataTable ProcReadVideoContent(int post_id)
    {
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        try
        {
            Conn.Open();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ReadContent";
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@postid", post_id.ToString());
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            Conn.Close();
        }
        catch (Exception e)
        {

        }
        return dt;
    }

    /// <summary>
    /// Takes all data from table according to post_id and returns DataTable
    /// </summary>
    /// <param name="post_id"></param>
    /// <returns></returns>
    public static DataTable selectSRC(string post_id)
    {
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        try {
            Conn.Open();

            cmd.CommandText = "SELECT * FROM [members].[Post] WHERE [post_id] = @postid";
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@postid", post_id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);            
            Conn.Close();
        }
        catch (Exception e)
        {

        }

        return dt;
    }
    /// <summary>
    /// By the selected video's id information, this method increments 
    /// the number of view by Stored Procedure which is named as IncrementView
    /// </summary>
    /// <param name="post_id"></param>
    public static void ProcIncrementView(string post_id)
    {
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        try
        {
            Conn.Open();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "IncrementView";
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@postid", post_id.ToString());
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            Conn.Close();
        }
        catch (Exception e)
        {

        }
    }

    /// <summary>
    /// By the selected video's id information, this method increments 
    /// the number of likes by Stored Procedure which is named as IncrementLike
    /// </summary>
    /// <param name="post_id"></param>
    public static void ProcIncrementLike(string post_id)
    {
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        try
        {
            Conn.Open();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "IncrementLike";
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@postid", post_id.ToString());
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            Conn.Close();
        }
        catch (Exception e)
        {

        }
    }

    /// <summary>
    /// By the selected video's id information, this method increments 
    /// the number of dislikes by Stored Procedure which is named as IncrementDislike
    /// </summary>
    /// <param name="post_id"></param>
    public static void ProcIncrementDislike(string post_id)
    {
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();

        try
        {
            Conn.Open();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "IncrementDislike";
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@postid", post_id.ToString());
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            Conn.Close();
        }
        catch (Exception e)
        {

        }
    }

    /// <summary>
    /// This method returns a DataTable which includes info according to given table_name and post_id
    /// </summary>
    /// <param name="table_name"></param>
    /// <param name="post_id"></param>
    /// <returns></returns>
    public static DataTable SelectAllInfoByParameters(string table_name, string post_id)
    {
        DataTable dt = new DataTable();
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        if (table_name != null && post_id!= null)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM " + table_name + " WHERE [post_id]= @postid", Conn);
                cmd.Parameters.AddWithValue("@postid", post_id.ToString());
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                Conn.Open();
                adp.Fill(dt);
                Conn.Close();
            }
            catch (Exception e)
            {

            }
        }
        return dt;
    }

    /// <summary>
    /// By the post_id, user_id, comment, time variables, this method inserts comment
    /// by Stored Procedure which is named as InsertComment
    /// </summary>
    /// <param name="post_id"></param>
    /// <param name="user_id"></param>
    /// <param name="comment"></param>
    /// <param name="time"></param>
    public static int ProcInsertComment(string post_id, string user_id, string comment, string time)
    {
        int result = -1;
        string connectionName = "Conn";
        string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        SqlConnection Conn = new SqlConnection(connectionString);
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertComment";
            cmd.Parameters.AddWithValue("@postid", post_id);
            cmd.Parameters.AddWithValue("@userid", user_id);
            cmd.Parameters.AddWithValue("@comment_text", comment);
            cmd.Parameters.AddWithValue("@time", time);
            cmd.Connection = Conn;
            Conn.Open();
            result = cmd.ExecuteNonQuery();            
        }
        catch (Exception e)
        {

        }
        return result;
    }
}