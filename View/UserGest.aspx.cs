using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Esondage2018.View
{
    public partial class UserGest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty((String)Session["admin"]))
            {

                Response.Redirect("Index.aspx");

            }
            /*if (String.IsNullOrEmpty((String)Session["nom"]))
            {
                Label15.Text = " Anonymous ";
                Response.Redirect("login.aspx");
                LinkButton2.Visible = false;

            }
            else
            {
                Label15.Text = " " + (String)Session["nom"] + " ";
            }*/
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");


            Boolean mailexist = false;
            String b = mailTxt.Text;
            conn.Open();
            SqlCommand command = new SqlCommand("select * from utilisateur where email='" + b + "';", conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    mailexist = true;

                }
            }
            if (mailexist == true)
            {
                //btAddUsg.Text = "walou";
                //Response.Redirect("Resultat.aspx", true);
                //textboxt1.Visible = true;
            }
            else
            {

                conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");

                SqlCommand insert = new SqlCommand("insert into utilisateur(nom,email,pass,TypeUser) values (@a,@b,@c,@d);", conn);
                String a = TextBox3.Text;
                b = mailTxt.Text;
                String c = TextBox2.Text;
                String d = "";
                if (CheckBox1.Checked)
                {
                    d = "on";
                    System.Diagnostics.Debug.WriteLine("test");

                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("test");
                }
                insert.Parameters.AddWithValue("@a", a);
                insert.Parameters.AddWithValue("@b", b);
                insert.Parameters.AddWithValue("@c", c);
                insert.Parameters.AddWithValue("@d", d);

                /* File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@choixs\", RadioButtonList1.Text);");
                        File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@ids\", " + title + ");");
                        File.AppendAllText(file1, " try  {conn.Open();insert.ExecuteNonQuery();conn.Close();}catch {}}}}");*/
                try
                {
                    conn.Open();
                    insert.ExecuteNonQuery();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    //btAddUsg.Text = ex.Message;
                }
                Response.Redirect("UserGest.aspx", true);
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }



        /*protected void Button7_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "";
            string query = "select * from utilisateur where nom like '" + TextBox4.Text + "%'";
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "utilisateur");


            DataView dvPerson = ds.Tables["utilisateur"].DefaultView;






            GridView1.DataSource = dvPerson;


            GridView1.DataBind();

        }*/

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserGest.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion_sondages.aspx");
        }

        protected void log_Click(object sender, EventArgs e)
        {
            Session["nom"] = "";
            Session["admin"] = "";
            Response.Redirect("login.aspx");
        }


    }


}