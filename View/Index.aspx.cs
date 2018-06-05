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
    public partial class Index : System.Web.UI.Page
    {
        public static String title;
        public static int mchoice;
        public static int nbchoice = 0;
        static int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty((String)Session["nom"]))
            {
                Label15.Text = " Anonymous ";
                Button4.Text = "Authentification";
                Button5.Text = "Inscription";


            }
            else
            {
                Label15.Text = " " + (String)Session["nom"] + " ";
                Button5.Text = "Gestion des sondages";
                Button4.Visible = false;
            }

            if (!String.IsNullOrEmpty((String)Session["admin"]))
            {
                Button4.Visible = true;
                Button4.Text = "Gestion des utilisateurs";

            }
            Panel1.BackColor = System.Drawing.Color.FromArgb(0, 0, 0, 0);

            csAns3.Visible = false;
            csAns4.Visible = false;
            csAns5.Visible = false;
            csAns6.Visible = false;
            csAns7.Visible = false;
            csAns8.Visible = false;
            csAns9.Visible = false;
            csAns10.Visible = false;

            /*if (csQues. == null && csAns1.InnerText == null
            && csAns2.InnerText == null && csAns3.InnerText == null
            && csAns4.InnerText == null && csAns5.InnerText == null
            && csAns6.InnerText == null && csAns7.InnerText == null
            && csAns8.InnerText == null && csAns9.InnerText == null
            && csAns10.InnerText == null) {
                i = 0;
            }*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            SqlCommand insert = new SqlCommand("insert into poll(utilisateur,question,choix1,choix2,choix3,choix4,choix5,choix6,choix7,choix8,choix9,choix10,ipduplication) values(@utilisateur,@question,@choix1,@choix2,@choix3,@choix4,@choix5,@choix6,@choix7,@choix8,@choix9,@choix10, @IPDUP)", conn);
            insert.Parameters.AddWithValue("@question", TextBox1.Text);
            insert.Parameters.AddWithValue("@choix1", TextBox2.Text);
            insert.Parameters.AddWithValue("@choix2", TextBox3.Text);
            insert.Parameters.AddWithValue("@choix3", TextBox4.Text);
            insert.Parameters.AddWithValue("@choix4", TextBox5.Text);
            insert.Parameters.AddWithValue("@choix5", TextBox6.Text);
            insert.Parameters.AddWithValue("@choix6", TextBox7.Text);
            insert.Parameters.AddWithValue("@choix7", TextBox8.Text);
            insert.Parameters.AddWithValue("@choix8", TextBox9.Text);
            insert.Parameters.AddWithValue("@choix9", TextBox10.Text);
            insert.Parameters.AddWithValue("@choix10", TextBox11.Text);
            insert.Parameters.AddWithValue("@IPDUP", DropDownList1.Text);
            if (String.IsNullOrEmpty((String)Session["nom"])) { insert.Parameters.AddWithValue("@utilisateur", " Anonymous "); }
            else { insert.Parameters.AddWithValue("@utilisateur", (String)Session["nom"]); }
            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                conn.Close();

                // SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
                conn.Open();

                SqlCommand command = new SqlCommand("Select id from poll", conn);
                //command.Parameters.AddWithValue("@zip", "india");
                // int result = command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        title = Convert.ToString(reader["id"]);
                    }
                }

                conn.Close();


                var dir = Server.MapPath("~\\view");
                var file = Path.Combine(dir, "v" + title + ".aspx");
                var file1 = Path.Combine(dir, "v" + title + ".aspx.cs");
                var file2 = Path.Combine(dir, "v" + title + ".aspx.designer.cs");
                Directory.CreateDirectory(dir);
                File.WriteAllText(file, "<%@ Page Language=\"C#\" AutoEventWireup=\"true\" CodeBehind=\"" + "v" + title + ".aspx.cs\" Inherits=\"Esondage2018.View.Vote\" %><!DOCTYPE html><html xmlns=\"http://www.w3.org/1999/xhtml\"><head runat=\"server\"><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><title>Esondage2018</title></head><body   background=\"images/bdsky.jpg\"><form id=\"form1\" runat=\"server\"><div>");
                File.AppendAllText(file, "<div><table align=\"right\" ID=\"Table1\" runat=\"server\"><tr><td class=\"auto-style9\"><asp:Button ID=\"Button4\" runat=\"server\" BorderColor=\"#FF9933\" BackColor=\"#660033\"  CausesValidation=\"false\" UseSubmitBehavior=\"false\" ForeColor=\"#FF9933\" Height=\"51px\" Text=\"S'inscrire\" Width=\"330px\" Font-Bold=\"True\" Font-Italic=\"True\" Font-Size=\"Large\"  OnClick=\"Button4_Click1\" /></td><td class=\"auto-style10\">");

                File.AppendAllText(file, "<asp:Button ID=\"Button5\" runat=\"server\" BorderColor=\"#FF9933\" BackColor=\"#660033\" ForeColor=\"#FF9933\" Height=\"51px\" Text=\"S'authentifier\" Width=\"330px\" style=\"margin-top: 0px; margin-bottom: 0px\"  Font-Bold=\"True\" Font-Italic=\"True\" Font-Size=\"Large\"  CausesValidation=\"false\" UseSubmitBehavior=\"false\"  OnClick=\"Button5_Click\"  /></td></tr>");
                File.AppendAllText(file, "</table>");
                File.AppendAllText(file, "<asp:Label ID=\"Label14\" runat=\"server\" ForeColor=\"#FFCC00\" Text=\"Bonjour \" style=\"text-align:left\"></asp:Label>");
                File.AppendAllText(file, "<asp:Label ID=\"Label15\" runat=\"server\" ForeColor=\"#FFCC00\" style=\"text-align:left\"></asp:Label>");
                File.AppendAllText(file, "<asp:LinkButton ID=\"LinkButton2\" runat=\"server\" ForeColor=\"Red\" OnClick=\"LinkButton2_Click\"> (D&eacute;connexion) </asp:LinkButton>");
                File.AppendAllText(file, "<br /><br /><br /><center><asp:Panel ID=\"Panel2\" runat=\"server\" BackImageUrl=\"images/SONDAGE.png\" Height=\"121px\" Width=\"1094px\"></asp:Panel></center></div>");

                File.AppendAllText(file, "<br/><br/><center><asp:Label ID=\"Label1\" runat=\"server\" Text=\"Question : \"  ForeColor=\"#FF9933\" Font-Bold=\"True\" Font-Italic=\"True\" Font-Size=\"X-Large\" ></asp:Label><asp:Label ID=\"Label2\" runat=\"server\" Text=\"" + TextBox1.Text + "\" ForeColor=\"#FF9933\" Font-Bold=\"True\" Font-Italic=\"True\" Font-Size=\"X-Large\" ></asp:Label><br /><br />");

                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                if (DropDownList2.Text.Equals("Choix multiple"))
                {
                    File.AppendAllText(file, "<asp:CheckBoxList id=\"checkboxlist1\" runat=\"server\"  ForeColor=\"#660033\" Font-Italic=\"True\" Font-Size=\"X-Large\">");
                    mchoice = 1;
                    if (!TextBox2.Text.Equals("") && !TextBox2.Text.Equals(" ") && !TextBox2.Text.Equals("  ") && !TextBox2.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox2.Text + "</asp:ListItem>");

                    }
                    if (!TextBox3.Text.Equals("") && !TextBox3.Text.Equals(" ") && !TextBox3.Text.Equals("  ") && !TextBox3.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox3.Text + "</asp:ListItem>");

                    }

                    if (!TextBox4.Text.Equals("") && !TextBox4.Text.Equals(" ") && !TextBox4.Text.Equals("  ") && !TextBox4.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox4.Text + "</asp:ListItem>");

                    }
                    if (!TextBox5.Text.Equals("") && !TextBox5.Text.Equals(" ") && !TextBox5.Text.Equals("  ") && !TextBox5.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox5.Text + "</asp:ListItem>");

                    }
                    if (!TextBox6.Text.Equals("") && !TextBox6.Text.Equals(" ") && !TextBox6.Text.Equals("  ") && !TextBox6.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox6.Text + "</asp:ListItem>");

                    }
                    if (!TextBox7.Text.Equals("") && !TextBox7.Text.Equals(" ") && !TextBox7.Text.Equals("  ") && !TextBox7.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox7.Text + "</asp:ListItem>");

                    }
                    if (!TextBox8.Text.Equals("") && !TextBox8.Text.Equals(" ") && !TextBox8.Text.Equals("  ") && !TextBox8.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox8.Text + "</asp:ListItem>");

                    }
                    if (!TextBox9.Text.Equals("") && !TextBox9.Text.Equals(" ") && !TextBox9.Text.Equals("  ") && !TextBox9.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox9.Text + "</asp:ListItem>");

                    }
                    if (!TextBox10.Text.Equals("") && !TextBox10.Text.Equals(" ") && !TextBox10.Text.Equals("  ") && !TextBox10.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox10.Text + "</asp:ListItem>");

                    }
                    if (!TextBox11.Text.Equals("") && !TextBox11.Text.Equals(" ") && !TextBox11.Text.Equals("  ") && !TextBox11.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem>" + TextBox11.Text + "</asp:ListItem>");

                    }
                    File.AppendAllText(file, "</asp:CheckBoxList>");
                }
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                else
                {
                    mchoice = 0;

                    File.AppendAllText(file, "<asp:RadioButtonList ID=\"RadioButtonList1\" runat=\"server\"  ForeColor=\"#660033\" Font-Italic=\"True\" Font-Size=\"X-Large\"><asp:ListItem Text=\"" + TextBox2.Text + "\" Value=\"" + TextBox2.Text + "\"></asp:ListItem>");
                    File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox3.Text + "\" Value=\"" + TextBox3.Text + "\"></asp:ListItem>");
                    if (!TextBox4.Text.Equals("") && !TextBox4.Text.Equals(" ") && !TextBox4.Text.Equals("  ") && !TextBox4.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox4.Text + "\" Value=\"" + TextBox4.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox5.Text.Equals("") && !TextBox5.Text.Equals(" ") && !TextBox5.Text.Equals("  ") && !TextBox5.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox5.Text + "\" Value=\"" + TextBox5.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox6.Text.Equals("") && !TextBox6.Text.Equals(" ") && !TextBox6.Text.Equals("  ") && !TextBox6.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox6.Text + "\" Value=\"" + TextBox6.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox7.Text.Equals("") && !TextBox7.Text.Equals(" ") && !TextBox7.Text.Equals("  ") && !TextBox7.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox7.Text + "\" Value=\"" + TextBox7.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox8.Text.Equals("") && !TextBox8.Text.Equals(" ") && !TextBox8.Text.Equals("  ") && !TextBox8.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox8.Text + "\" Value=\"" + TextBox8.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox9.Text.Equals("") && !TextBox9.Text.Equals(" ") && !TextBox9.Text.Equals("  ") && !TextBox9.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox9.Text + "\" Value=\"" + TextBox9.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox10.Text.Equals("") && !TextBox10.Text.Equals(" ") && !TextBox10.Text.Equals("  ") && !TextBox10.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox10.Text + "\" Value=\"" + TextBox10.Text + "\"></asp:ListItem>");
                    }
                    if (!TextBox11.Text.Equals("") && !TextBox11.Text.Equals(" ") && !TextBox11.Text.Equals("  ") && !TextBox11.Text.Equals("   "))
                    {
                        File.AppendAllText(file, "<asp:ListItem Text=\"" + TextBox11.Text + "\" Value=\"" + TextBox4.Text + "\"></asp:ListItem>");
                    }
                    File.AppendAllText(file, "</asp:RadioButtonList>");
















                }


                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                File.AppendAllText(file, "<br /><br /><asp:Button ID=\"Button1\" runat=\"server\" Text=\"Voter\"  BorderColor=\"#FF9933\" BackColor=\"#660033\" ForeColor=\"#FF9933\"  Width=\"181px\" Height=\"85px\" OnClick=\"Button1_Click\"  Font-Bold=\"True\" Font-Italic=\"True\" Font-Size=\"Large\"/><br/><br/><asp:Label ID=\"Label16\" runat=\"server\" ForeColor=\"Red\" Text=\"Label\" /><br/><asp:Button ID=\"Button2\"   BorderColor=\"#FF9933\" BackColor=\"#660033\" ForeColor=\"#FF9933\" runat=\"server\"   Text=\"Partager\" OnClick=\"Button2_Click\" /><asp:TextBox ID=\"TextBox2\" runat=\"server\" Width=\"322px\"></asp:TextBox></asp:Label></div><asp:Label ID=\"Label3\" runat=\"server\"  ForeColor=\"#6600CC\" Text=\"" + mchoice + "\"></asp:Label><asp:Label ID=\"Label4\" runat=\"server\"  ForeColor=\"#6600CC\" Text=\"" + title + "\"></asp:Label></center></form></body></html>");
                /*  File.WriteAllText(file1, "using System;using System.Collections.Generic;using System.Linq;using System.Web;using System.Web.UI;using System.Web.UI.WebControls;namespace Esondage2018.View{public partial class " + "v" + title + " : System.Web.UI.Page{protected void Page_Load(object sender, EventArgs e){}protected void Button1_Click(object sender, EventArgs e){");
                File.AppendAllText(file1, "protected void Button1_Click(object sender, EventArgs e){            SqlConnection conn = new SqlConnection(@\"Data Source=(LocalDB)\\v11.0;AttachDbFilename=c:\\users\\sony\\documents\\visual studio 2013\\Projects\\Esondage2018\\Esondage2018\\App_Data\\mydatabase.mdf;Integrated Security=True\");");
                File.AppendAllText(file1, "SqlCommand insert = new SqlCommand(\"insert into choice(ids,choixs);");*/


                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                if (DropDownList2.Text.Equals("Choix multiple"))
                {







                }
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------------------
                else
                {
                    /* File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@choixs\", RadioButtonList1.Text);");
                     File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@ids\", " + title + ");");
                     File.AppendAllText(file1, " try  {conn.Open();insert.ExecuteNonQuery();conn.Close();}catch {}}}}");*/
                    File.WriteAllText(file2, "101");

                }
            }
            catch (Exception ex)
            {
                Label13.Text = ex.Message;
                conn.Close();
            }

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            i = 0;
            Response.Redirect("v" + title + ".aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }




        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (i == 0)
            {
                csAns3.Visible = true;

            }
            if (i == 1)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;

            }
            if (i == 2)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;
                csAns5.Visible = true;

            }
            if (i == 3)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;
                csAns5.Visible = true;
                csAns6.Visible = true;

            }
            if (i == 4)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;
                csAns5.Visible = true;
                csAns6.Visible = true;
                csAns7.Visible = true;

            }
            if (i == 5)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;
                csAns5.Visible = true;
                csAns6.Visible = true;
                csAns7.Visible = true;
                csAns8.Visible = true;

            }
            if (i == 6)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;
                csAns5.Visible = true;
                csAns6.Visible = true;
                csAns7.Visible = true;
                csAns8.Visible = true;
                csAns9.Visible = true;

            }
            if (i >= 7)
            {
                csAns3.Visible = true;
                csAns4.Visible = true;
                csAns5.Visible = true;
                csAns6.Visible = true;
                csAns7.Visible = true;
                csAns8.Visible = true;
                csAns9.Visible = true;
                csAns10.Visible = true;

            }
            i++;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void log_Click(object sender, EventArgs e)
        {
            Session["nom"] = "";
            Response.Redirect("login.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

            if (Button5.Text.Equals("Inscription"))
            {
                Response.Redirect("Sinscrire.aspx");

            }
            if (Button5.Text.Equals("Gestion des sondages"))
            {

                Response.Redirect("Gestion_sondages.aspx");
            }

        }

        protected void Button4_Click1(object sender, EventArgs e)
        {

            if (Button4.Text.Equals("Authentification"))
            {

                Response.Redirect("login.aspx");
            }

            if (Button4.Text.Equals("Gestion des utilisateurs"))
            {

                Response.Redirect("Gestion_utilisateurs.aspx");
            }



        }
    }
}