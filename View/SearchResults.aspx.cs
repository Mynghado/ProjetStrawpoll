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
            if (PreviousPage != null)
            {
                TextBox txtSearch = (TextBox)PreviousPage.FindControl("TextBox4");
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

            conn.Close();
        }
    }
}