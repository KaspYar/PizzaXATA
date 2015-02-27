using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pizza
{
    public partial class pizzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lblInsert_Click(object sender, EventArgs e)
        {
            SqlDataSourcePizzas.InsertParameters["name"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("txtBoxName")).Text;
            SqlDataSourcePizzas.InsertParameters["ingridients"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("txtBoxIngridients")).Text;
            SqlDataSourcePizzas.InsertParameters["price"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("txtBoxPrice")).Text;
            SqlDataSourcePizzas.Insert();
        }
        
    }
}