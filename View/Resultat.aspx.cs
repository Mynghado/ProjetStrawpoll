using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Esondage2018.View
{
    public partial class Resultat : System.Web.UI.Page
    {
        String idsondage = Vote.titlev;

        public String kloo = "";
        protected void Page_Init(object sender, EventArgs e)
        {
            //comWrapRes.Visible = false;
            comAreaRes.Visible = false;
            sendWrapRes.Visible = false;
            panel1.Visible = true;

            kloo = Vote.titlev;
            LinkedList<String> choix = new LinkedList<string>();
            LinkedList<String> nchoix = new LinkedList<string>();
            //Label1.Text = "Question n° " + idsondage + " : ";
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            conn.Open();

            SqlCommand command = new SqlCommand("Select * from poll where id='"+idsondage+"';", conn);
            //command.Parameters.AddWithValue("@zip", "india");
            // int result = command.ExecuteNonQuery();
            LinkedList<String> choiceZeroVote = new LinkedList<String>();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    String ques = Convert.ToString(reader["question"]);
                    titleRes.Text = "Asking : " + ques;

                    //Label2.Text = Convert.ToString(reader["question"]);
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix1"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix2"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix3"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix4"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix5"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix6"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix7"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix8"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix9"]));
                    choiceZeroVote.AddLast(Convert.ToString(reader["choix10"]));
                }
}

conn.Close();
//-------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------

conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
conn.Open();

command = new SqlCommand("select distinct choix,count(choix) as nbpre from choice  where id='" + idsondage+"' group by choix;", conn);
//command.Parameters.AddWithValue("@zip", "india");
// int result = command.ExecuteNonQuery();
using (SqlDataReader reader = command.ExecuteReader())
{
while (reader.Read())
{
choix.AddLast(Convert.ToString(reader["choix"]));
nchoix.AddLast(Convert.ToString(reader["nbpre"]));
}
}

conn.Close();
foreach (String aa in choix)
{
choiceZeroVote.Remove(aa);
}

foreach (String aa in choiceZeroVote)
{
if (!String.IsNullOrEmpty(aa))
{
/*Label27.Text += aa + "<br/>";
Label28.Text += "0 Vote(s) <br/>";*/
                }
            }
            //float somme = 1;
            /*foreach (String a in choix)
            {
                Label3.Text += a +"xxxxxx";
            }*/
            //foreach (String b in nchoix)
            //{
            //    somme += Convert.ToInt32(b);
            //}

            if (choix.Count > 0 & nchoix.Count > 0)
            {
                Label4.Text = choix.ElementAt(0);
                Label5.Text = nchoix.ElementAt(0) + " Vote(s) ";
            }

            if (choix.Count > 1 & nchoix.Count > 1)
            {
                Label6.Text = choix.ElementAt(1);
                Label7.Text = nchoix.ElementAt(1) + " Vote(s) "; ;
            }
            if (choix.Count > 2 & nchoix.Count > 2)
            {
                Label8.Text = choix.ElementAt(2);
                Label9.Text = nchoix.ElementAt(2) + " Vote(s) "; ;
            }
            if (choix.Count > 3 & nchoix.Count > 3)
            {
                Label10.Text = choix.ElementAt(3);
                Label11.Text = nchoix.ElementAt(3) + " Vote(s) "; ;
            }
            if (choix.Count > 4 & nchoix.Count > 4)
            {
                Label12.Text = choix.ElementAt(4);
                Label13.Text = nchoix.ElementAt(4) + " Vote(s) "; ;
            }
            if (choix.Count > 5 & nchoix.Count > 5)
            {
                Label14.Text = choix.ElementAt(5);
                Label15.Text = nchoix.ElementAt(5) + " Vote(s) "; ;
            }
            if (choix.Count > 6 & nchoix.Count > 6)
            {
                Label16.Text = choix.ElementAt(6);
                Label17.Text = nchoix.ElementAt(6) + " Vote(s) "; ;
            }
            if (choix.Count > 7 & nchoix.Count > 7)
            {
                Label18.Text = choix.ElementAt(7);
                Label19.Text = nchoix.ElementAt(7) + " Vote(s) "; ;
            }
            if (choix.Count > 8 & nchoix.Count > 8)
            {
                Label20.Text = choix.ElementAt(8);
                Label21.Text = nchoix.ElementAt(8) + " Vote(s) "; ;
            }
            if (choix.Count > 9 & nchoix.Count > 9)
            {
                Label22.Text = choix.ElementAt(9);
                Label23.Text = nchoix.ElementAt(9) + " Vote(s) "; ;
            }


            conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            conn.Open();

            command = new SqlCommand("select * from comment  where idpoll='" + idsondage + "' order by Id desc;", conn);
            //command.Parameters.AddWithValue("@zip", "india");
            // int result = command.ExecuteNonQuery();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {


                    Label24.Text += Convert.ToString(reader["utilisateur"]) + "                                   " + Convert.ToString(reader["dateheure"]) + "      <br/>" + Convert.ToString(reader["commentaire"]) + "<br/>******************************<br/>";
                    
                    //choix.AddLast(Convert.ToString(reader["choix"]));
                    //nchoix.AddLast(Convert.ToString(reader["nbpre"]));
                }
            }

            conn.Close();
            //************************************************************************************************************
            //************************************************************************************************************
            //************************************************************************************************************
            //************************************************************************************************************
            //************************************************************************************************************
            //************************************************************************************************************
            
   
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (String.IsNullOrEmpty((String)Session["nom"]))
            {
                Label26.Text = " Anonymous ";
                LinkButton2.Visible = false;
                Button4.Text = "Authentification";
                Button5.Text = "Inscription";
                

            }
            else
            {
                Label26.Text = " " + (String)Session["nom"] + " ";
                /*Button5.Text = "Gestion des sondages";
                Button4.Visible = false;
            }

            if (!String.IsNullOrEmpty((String)Session["admin"]))
            {
                Button4.Visible = true;
                Button4.Text = "Gestion des utilisateurs";

            }*/
        }

        protected void btSendRes_Click(object sender, EventArgs e)
        {
            if (comWrapRes.Visible)
            {
                SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");

                SqlCommand insert = new SqlCommand("insert into comment(idpoll,commentaire,utilisateur,dateheure) values (@ids,@comment,@utilisateur,@dateheure);", conn);
                insert.Parameters.AddWithValue("@comment", comAreaRes.InnerText);
                insert.Parameters.AddWithValue("@ids", idsondage);
                String dt = DateTime.Now.ToString();
                insert.Parameters.AddWithValue("@dateheure", dt);
                String commentuser = "";
                if (String.IsNullOrEmpty((String)Session["nom"])) { commentuser = " Anonymous "; }
                else { commentuser = " " + (String)Session["nom"] + " "; }
                insert.Parameters.AddWithValue("@utilisateur", commentuser);
                /* File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@choixs\", RadioButtonList1.Text);");
                        File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@ids\", " + title + ");");
                        File.AppendAllText(file1, " try  {conn.Open();insert.ExecuteNonQuery();conn.Close();}catch {}}}}");*/
                try
                {
                    conn.Open();
                    insert.ExecuteNonQuery();
                    comAreaRes.InnerText = "";
                    conn.Close();
                    Response.Redirect("Resultat.aspx", true);
                }
                catch (Exception ex)
                {
                    //panel1.eventStore.reload();
                }
            }
            else
            {
                //comWrapRes.Visible = true;
                comAreaRes.Visible = true;
                Timer1.Enabled = false;
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
        }

        protected void log_Click(object sender, EventArgs e)
        {
            Session["nom"] = "";
            Session["admin"] = "";
            Response.Redirect("login.aspx");
        }

        /*protected void Button5_Click(object sender, EventArgs e)
        {
            if (Button5.Text.Equals("Inscription"))
            {
                Response.Redirect("Sinscrire.aspx");

            }
            if (Button5.Text.Equals("Gestion des sondages"))
            {

                Response.Redirect("Gestion_sondages.aspx");
            }
        }*/

        /*protected void Button4_Click(object sender, EventArgs e)
        {
            if (Button4.Text.Equals("Authentification"))
            {

                Response.Redirect("login.aspx");
            }

            if (Button4.Text.Equals("Gestion des utilisateurs"))
            {

                Response.Redirect("Gestion_utilisateurs.aspx");
            }
        }*/

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("Resultat.aspx");
        }

        protected void btShowRes_Click(object sender, EventArgs e)
        {
            if (Timer1.Enabled == true)
            {
                Timer1.Enabled = false;
            }
            else
            {
                Timer1_Tick(sender, e);
            }
            //panel1.Visible = true;
            //comWrapRes.Visible = true;
            
        }

        protected void btComRes_Click(object sender, EventArgs e)
        {
            comAreaRes.Visible = true;
            sendWrapRes.Visible = true;
        }
        
    }
}
