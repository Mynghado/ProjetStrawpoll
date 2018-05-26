using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Esondage2018.View
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Visible = false;
        }
        protected void Add_Pass_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");

            String typeofuser="";
            Boolean userison=false;
            String b = String.Format("{0}", Request.Form["mail"]);
            String c = String.Format("{0}", Request.Form["pass"]);
            conn.Open();
            SqlCommand command = new SqlCommand("select * from utilisateur where email='"+b+"' and pass='"+c+"';", conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    userison = true;
                    typeofuser = Convert.ToString(reader["TypeUser"]);
                    Session["nom"] = Convert.ToString(reader["nom"]);
                    if (typeofuser.Equals("on"))
                    {
                        Session["nom"] += " (admin)";
                        Session["admin"] = "admin";
                    }
                    
                }
            }
            if(userison==true)
            {
                Response.Redirect("Index.aspx", true);
                TextBox1.Visible = true;
                TextBox1.Text = typeofuser;

            }
            else
            {
                TextBox1.Visible = true;
            }
            /* File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@choixs\", RadioButtonList1.Text);");
                    File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@ids\", " + title + ");");
                    File.AppendAllText(file1, " try  {conn.Open();insert.ExecuteNonQuery();conn.Close();}catch {}}}}");*/
            
                conn.Close();
           
            
        }
    }
}