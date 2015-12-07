using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* xxx */
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string name_email = txtEmail.Text.ToLower().Trim();
        string password = txtPassword.Text.Trim();
        if(Toolkit.DoLogin(name_email,password) == true)
        {
            Session["UserMail"] = name_email;
            Session["UserID"] = Toolkit.GetUserInfobyMail(name_email);
            Session["UserNick"] = Toolkit.GetUserInfobyMail(name_email, "user_nick");

            FormsAuthentication.SetAuthCookie(Session["UserNick"].ToString(), false);

            string returnUrl = Request.QueryString["ReturnUrl"] as String;
            if (returnUrl != null)
                Response.Redirect(returnUrl);
            else
                Response.Redirect("Default.aspx");
        }
        else
        {
            lblMessage.Text = "Login Unsuccessfull!";
        }
    }
}