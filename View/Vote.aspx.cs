using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

namespace Esondage2018.View
{
    public partial class Vote : System.Web.UI.Page
    {
        public static String titlev;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            titlev = Label4.Text;
            Label16.Visible = false;
            TextBox2.Text = "http://localhost:54719/View/v" +titlev + ".aspx";
            TextBox2.Visible = false;
            if (String.IsNullOrEmpty((String)Session["nom"]))
            {
                Label15.Text = " Anonymous ";
                LinkButton2.Visible = false;
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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            IPHostEntry host=Dns.GetHostEntry(Dns.GetHostName());
            String ipad = "";
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                    ipad = ip.ToString();
            }
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");

            
            Boolean ipduplication = false;
            Boolean ipduplicationInChoice = false;
            conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            conn.Open();
            SqlCommand command = new SqlCommand("select * from poll  where id='" + titlev + "' ;", conn);
            //command.Parameters.AddWithValue("@zip", "india");
            // int result = command.ExecuteNonQuery();
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    if(Convert.ToString(reader["ipduplication"]).Equals("Ip not duplication")){
                        ipduplication=true;
                    }
                    
                }
            }
            conn.Close();
            if (ipduplication == true)
            {
                conn.Open();
                command = new SqlCommand("select * from choice  where id='" + titlev + "' ;", conn);
                //command.Parameters.AddWithValue("@zip", "india");
                // int result = command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (Convert.ToString(reader["ipadr"]).Equals(ipad))
                        {
                            ipduplicationInChoice = true;
                            
                        }

                        

                    }
                }
                conn.Close();
            }


            if (ipduplicationInChoice == true)
            {
                Label16.Visible = true;
                Label16.Text = "Cet ip : " + ipad + " ne peut pas revoter ";
            }
            else
            {

                if (Label3.Text.Equals("0"))
                {
                    SqlCommand insert = new SqlCommand("insert into choice values (@ids,@choixs,@ipad);", conn);
                    insert.Parameters.AddWithValue("@choixs", RadioButtonList1.Text);
                    insert.Parameters.AddWithValue("@ids", Label4.Text);
                    insert.Parameters.AddWithValue("@ipad", ipad);
                    /* File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@choixs\", RadioButtonList1.Text);");
                            File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@ids\", " + title + ");");
                            File.AppendAllText(file1, " try  {conn.Open();insert.ExecuteNonQuery();conn.Close();}catch {}}}}");*/
                    try
                    {
                        conn.Open();
                        insert.ExecuteNonQuery();
                        conn.Close();
                        RadioButtonList1.Text = "good";
                    }
                    catch (Exception ex)
                    {
                        Button1.Text = ex.Message;
                    }
                }
                else
                {

                    for (int i = 0; i < checkboxlist1.Items.Count; i++)
                    {

                        if (checkboxlist1.Items[i].Selected)
                        {
                            SqlCommand insert = new SqlCommand("insert into choice values (@ids,@choixs,@ipad);", conn);
                            insert.Parameters.AddWithValue("@choixs", checkboxlist1.Items[i].Text);
                            insert.Parameters.AddWithValue("@ids", Label4.Text);
                            insert.Parameters.AddWithValue("@ipad", ipad);
                            /* File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@choixs\", RadioButtonList1.Text);");
                                    File.AppendAllText(file1, "insert.Parameters.AddWithValue(\"@ids\", " + title + ");");
                                    File.AppendAllText(file1, " try  {conn.Open();insert.ExecuteNonQuery();conn.Close();}catch {}}}}");*/
                            try
                            {
                                conn.Open();
                                insert.ExecuteNonQuery();
                                conn.Close();
                            }
                            catch
                            {

                            }
                        }
                    }






                }



                titlev = Label4.Text;

                LinkedList<String> choix = new LinkedList<string>();
                LinkedList<String> nchoix = new LinkedList<string>();
                conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
                conn.Open();
                command = new SqlCommand("select distinct choix,count(choix) as nbpre from choice  where id='" + titlev + "' group by choix;", conn);
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
                File.Delete(Server.MapPath("~\\view\\piechart\\pie" + titlev + ".html"));
                File.Delete(Server.MapPath("~\\view\\piechart\\example" + titlev + ".js"));
                var dir = Server.MapPath("~\\view\\piechart");
                var file = Path.Combine(dir, "example" + titlev + ".js");
                var file1 = Path.Combine(dir, "pie" + titlev + ".html");

                Directory.CreateDirectory(dir);
                File.WriteAllText(file, "var idkikop=" + titlev + ";var kikop='Le pourcentage des sondages de \"" + Label2.Text + "\"';var jijop=" + choix.Count + ";");
                File.AppendAllText(file, "Ext.require(['Ext.data.*']);Ext.onReady(function() {window.generateData = function(n, floor){var data = [],p = (Math.random() *  11) + 1,i;floor = (!floor && floor !== 0)? 20 : floor;");
                File.AppendAllText(file, "var k =[");
                File.AppendAllText(file, nchoix.ElementAt(0));
                for (int i = 1; i < nchoix.Count; i++)
                {
                    File.AppendAllText(file, "," + nchoix.ElementAt(i));
                }
                File.AppendAllText(file, "];");
                File.AppendAllText(file, "var kiko =['");
                File.AppendAllText(file, choix.ElementAt(0) + "(" + nchoix.ElementAt(0) + ")" + "'");
                for (int i = 1; i < choix.Count; i++)
                {
                    File.AppendAllText(file, ",'" + choix.ElementAt(i) + "(" + nchoix.ElementAt(i) + ")" + "'");
                }
                File.AppendAllText(file, "];");
                File.AppendAllText(file, "		for (i = 0; i < (n || 12); i++) {data.push({name: kiko[i],data1: k[i],});}return data;};window.generateDataNegative = function(n, floor){var data = [],p = (Math.random() *  11) + 1,i;floor = (!floor && floor !== 0)? 20 : floor;");
                File.AppendAllText(file, "var k =[");
                File.AppendAllText(file, nchoix.ElementAt(0));
                for (int i = 1; i < nchoix.Count; i++)
                {
                    File.AppendAllText(file, "," + nchoix.ElementAt(i));
                }
                File.AppendAllText(file, "];");
                File.AppendAllText(file, "var kiko =['");
                File.AppendAllText(file, choix.ElementAt(0) + "(" + nchoix.ElementAt(0) + ")" + "'");
                for (int i = 1; i < choix.Count; i++)
                {
                    File.AppendAllText(file, ",'" + choix.ElementAt(i) + "(" + nchoix.ElementAt(i) + ")" + "'");
                }
                File.AppendAllText(file, "];");
                File.AppendAllText(file, "for (i = 0; i < (n || 12); i++) {data.push({name: kiko[i],data1: k[i],});}return data;};");
                File.AppendAllText(file, "window.store1 = Ext.create('Ext.data.JsonStore', {fields: ['name', 'data1'],data: generateData()});");
                File.AppendAllText(file, "window.storeNegatives = Ext.create('Ext.data.JsonStore', {fields: ['name', 'data1'],data: generateDataNegative()});");
                File.AppendAllText(file, "window.store3 = Ext.create('Ext.data.JsonStore', {fields: ['name', 'data1'],data: generateData()});");
                File.AppendAllText(file, "window.store4 = Ext.create('Ext.data.JsonStore', {fields: ['name', 'data1'],data: generateData()});");
                File.AppendAllText(file, "window.store5 = Ext.create('Ext.data.JsonStore', {fields: ['name', 'data1'],data: generateData()});    ");

                File.AppendAllText(file, "window.loadTask = new Ext.util.DelayedTask();});");

                File.WriteAllText(file1, "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"><link rel=\"stylesheet\" type=\"text/css\" href=\"ext-all.css\" /><link rel=\"stylesheet\" type=\"text/css\" href=\"example.css\" /><script type=\"text/javascript\" src=\"ext-all.js\"></script>");
                File.AppendAllText(file1, "<script type=\"text/javascript\" src=\"example" + titlev + ".js\"></script>");
                File.AppendAllText(file1, "<script type=\"text/javascript\" src=\"Pie.js\"></script></head><body ></body></html>");
                Response.Redirect("Resultat.aspx", true);
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["nom"] = "";
            Response.Redirect("login.aspx");
        }

        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox2.Visible = true;
        }
    }
}