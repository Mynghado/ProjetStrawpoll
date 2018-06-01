using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Esondage2018.View
{
    public partial class Sinscrire : System.Web.UI.Page
    { 
        //public static int Pair=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            textboxt1.Visible = false;
        }
        protected void Add_Pass_Clicx(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");

            
            
            conn.Open();
            String a = String.Format("{0}", Request.Form["nom"]);
                     String b = String.Format("{0}", Request.Form["email"]);
                    String c = String.Format("{0}", Request.Form["motdepasse"]);
                    String d = String.Format("{0}", Request.Form["admin"]);
                    if (String.IsNullOrEmpty(b) || String.IsNullOrEmpty(a) || String.IsNullOrEmpty(c) || String.IsNullOrEmpty(d))
                    {
                        textboxt1.Visible = true;
                        textboxt1.Text = "Champs vide(s)";
                    }
            SqlCommand command = new SqlCommand("select * from utilisateur where email='" + b + "';", conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    Response.Redirect("Resultat.aspx", true);
                    textboxt1.Visible = true;
                    textboxt1.Text = "Cette adresse e-mail existe déjà !";
                }
                else
                {

                    conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
                    SqlCommand insert = new SqlCommand("insert into utilisateur(nom,email,pass,TypeUser) values (@a,@b,@c,@d);", conn);
                    
                    insert.Parameters.AddWithValue("@a", a);
                    insert.Parameters.AddWithValue("@b", b);
                    insert.Parameters.AddWithValue("@c", c);
                    insert.Parameters.AddWithValue("@d", d);

                   
                    try
                    {
                        //if (Pair % 2 == 1)
                        //{
                            conn.Open();
                            insert.ExecuteNonQuery();
                            conn.Close();
                        //}
                        //Pair++;
                    }
                    catch (Exception ex)
                    {
                        textboxt1.Visible = true;
                        textboxt1.Text = ex.Message;
                    }
                    //Type cstype = this.GetType();

                    //// Get a ClientScriptManager reference from the Page class.
                    //ClientScriptManager cs = Page.ClientScript;

                    //// Check to see if the startup script is already registered.
                    //if (!cs.IsStartupScriptRegistered(cstype, "PopupScript"))
                    //{
                    //    String cstext = "alert('"+a+" est ajouté(e) avec succées');";
                    //    cs.RegisterStartupScript(cstype, "PopupScript", cstext, true);
                    //}
                    //Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('dd')</script>");
                    //Response.Redirect("login.aspx", true);
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                    Session["nom"] = a;
                    if (d.Equals("on"))
                    {
                        Session["nom"] += " (admin)";
                        Session["admin"] = "admin";
                    }
                    Response.Redirect("Index.aspx", true);
                }
            }
            }
            
        
    }
}