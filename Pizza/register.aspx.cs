using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Common;
namespace Pizza
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.Open();            
            
            if(IsPostBack)
            {                
            String checkUser = "select count(*) from [user] where username='"+txtBoxUserName.Text+"'";
            SqlCommand command = new SqlCommand(checkUser, connection);
            command.ExecuteScalar();
                        }
             
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try{            
                
                String insertUser = "insert into  [user] " +
                    //"values('"+txtBoxUserName.Text+"','"+txtBoxPass.Text+"','"+txtBoxEmail.Text+"') ";
                    "values(@userName, @password, @email);";
                SqlCommand command = new SqlCommand(insertUser, connection);
                command.Parameters.AddWithValue("@userName", txtBoxUserName.Text);
                command.Parameters.AddWithValue("@password", txtBoxPass.Text);
                command.Parameters.AddWithValue("@email", txtBoxEmail.Text);
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }

        }
    }
}