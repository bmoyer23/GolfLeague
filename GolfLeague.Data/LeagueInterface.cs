using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace GolfLeague.Data
{
    public class LeagueInterface
    {
        const string CONNECTION_STRING = @"Data Source=.\SQLEXPRESS;Initial Catalog=GolfLeague;Integrated Security=True";

        public bool DoesNameExist(string LeagueName)
        {
            SqlConnection conn = new SqlConnection(CONNECTION_STRING);
            SqlDataAdapter da = new SqlDataAdapter("select LeagueName from dbo.League where LeagueName=@name", conn);
            da.SelectCommand.Parameters.AddWithValue("@name", LeagueName);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
    }
}
