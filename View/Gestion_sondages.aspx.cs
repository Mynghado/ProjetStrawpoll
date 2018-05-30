﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Esondage2018.View
{
    public partial class Gestion_sondages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty((String)Session["admin"]))
            {

                GridView1.AutoGenerateEditButton = false;
                GridView1.AutoGenerateDeleteButton = false;
                Button4.Visible = false;

            }
            else
            {
                Button4.Visible = true;
                GridView1.AutoGenerateEditButton = true;
                GridView1.AutoGenerateDeleteButton = true;

            }
            if (String.IsNullOrEmpty((String)Session["nom"]))
            {
                Label15.Text = " Anonymous ";
                LinkButton2.Visible = false;
                Response.Redirect("login.aspx");

            }
            else
            {
                Label15.Text = " " + (String)Session["nom"] + " ";
            }
        }

        

        protected void Button7_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "";
            string query = "select * from poll where question like '%" + TextBox4.Text + "%'";
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "poll");


            DataView dvPerson = ds.Tables["poll"].DefaultView;






            GridView1.DataSource = dvPerson;


            GridView1.DataBind();
        }
