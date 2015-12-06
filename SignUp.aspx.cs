using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.ToLower().Trim();
        string surname = txtSurname.Text.ToLower().Trim();
        string username = txtUsername.Text.Trim();
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();
        int result = Toolkit.InsertUser(username, email, password, name, surname);
        if (result == 1)
        {
            Response.Redirect("~/Login.aspx");
        }
        else if(result == 0)
        {
            lblMessage.Text = "Email or Username is already in use, pick different one";
        }
        else
        {
            lblMessage.Text = "There was a problem connectig to the database, please try later";
        }
    }
}