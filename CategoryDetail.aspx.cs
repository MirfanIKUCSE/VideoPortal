using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CategoryDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["cid"] != null)
            LoadVideos();
    }

    public void LoadVideos()
    {
        string CatId = Request.QueryString["cid"].ToString();
        string ConnStr = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString.ToString();
        string QueryStr = "SELECT * FROM members.Post WHERE cat_id=" + CatId;
        SqlConnection conn = new SqlConnection(ConnStr);
        conn.Open();
        SqlDataAdapter adp = new SqlDataAdapter(QueryStr, conn);
        conn.Close();
        DataTable dt = new DataTable();
        adp.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();

    }

    public string trunc(string str, int limiter)
    {
        string trncStr = str;
        if (str.Length > limiter)
        {
            trncStr = String.Empty;
            trncStr = str.Substring(0, limiter);
            trncStr += " ...";
        }
        return trncStr;
    }

    public string getNick(string user_id)
    {
        string ConnStr = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString.ToString();
        string QueryStr = "SELECT user_nick FROM members.[User] where user_id =" + user_id;
        SqlConnection conn = new SqlConnection(ConnStr);
        conn.Open();
        SqlDataAdapter adp = new SqlDataAdapter(QueryStr, conn);
        conn.Close();
        DataTable dt = new DataTable();
        adp.Fill(dt);
        if (dt.Rows.Count > 0)
            return dt.Rows[0].ItemArray[0].ToString();
        else
            return "unknown_user";
    }

    public string getDate(string date)
    {
        DateTime dtdate = new DateTime();
        dtdate = DateTime.Parse(date);
        TimeSpan ts = new TimeSpan();
        ts = DateTime.Now - dtdate;
        if(ts.TotalMinutes > 0 && ts.TotalMinutes < 60)
        {
            return Math.Floor(ts.TotalMinutes) + " minutes ago";
        }
        else if(ts.TotalHours >= 1 && ts.TotalHours < 24)
        { 
            return Math.Floor(ts.TotalHours) + " hours ago";
        }
        else if(ts.TotalHours >= 24 && ts.TotalDays < 7)
        {
            return Math.Floor(ts.TotalDays) + " days ago";
        }
        else if(ts.TotalDays >= 7 && ts.TotalDays <28)
        {
            return Math.Floor(ts.TotalDays / 7) + " weeks ago";
        }
        else if(ts.TotalDays >= 28 && ts.TotalDays < 365)
        {
            return Math.Floor(ts.TotalDays / 12) + " moths ago";
        }
        else
        {
            return Math.Floor(ts.TotalDays / 365) + " years ago";
        }
    }
}