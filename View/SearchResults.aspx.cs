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
    public partial class SearchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty((String)Session["admin"]))
            {
                mngRsh.Visible = false;
            }

            TextBox txtSearch;
            // Rajouter condition "si page = page de recherche ..."
            if (PreviousPage == null)
            {
                if (searchField.Text != null)
                {
                    lblSearch.Text = searchField.Text;
                }
            }
            else if (PreviousPage != null)
            {
                txtSearch = (TextBox)PreviousPage.FindControl("searchField");
                lblSearch.Text = txtSearch.Text;
            }

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=" + Server.MapPath("~\\App_Data\\mydatabase.mdf") + ";Integrated Security=True");
            GridView1.DataSourceID = "";
            
            String query = "select * from utilisateur where (nom like '%' + @search + '%')";
            SqlCommand sr = new SqlCommand(query, conn);
            sr.Parameters.Add("@search", SqlDbType.NVarChar).Value = lblSearch.Text;

            conn.Open();
            sr.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = sr;
            DataSet ds = new DataSet();
            da.Fill(ds, "nom");
            GridView1.DataSource = ds;
            GridView1.DataBind();

            query = "select * from poll where (question like '%' + @search + '%')";
            SqlCommand sr2 = new SqlCommand(query, conn);
            sr2.Parameters.Add("@search", SqlDbType.NVarChar).Value = lblSearch.Text;

            sr2.ExecuteNonQuery();
            SqlDataAdapter da2 = new SqlDataAdapter();
            da2.SelectCommand = sr2;
            DataSet ds2 = new DataSet();
            da2.Fill(ds2, "nom");
            GridView2.DataSource = ds2;
            GridView2.DataBind();

            lblSearch.Text = "Search results for : " + lblSearch.Text;

            conn.Close();
        }

        protected void log_Click(object sender, EventArgs e)
        {
            Session["nom"] = "";
            Session["admin"] = "";
            Response.Redirect("login.aspx");
        }

        protected void Button2_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("SearchResults.aspx");
        }
    }
}