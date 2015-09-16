using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace GolfLeague.Data
{
    public class DivisionInterface
    {
        const string CONNECTION_STRING = @"Data Source=.\SQLEXPRESS;Initial Catalog=GolfLeague;Integrated Security=True";

        public bool DoesNameExist(object LeagueID, string DivisionName)
        {
            SqlConnection conn = new SqlConnection(CONNECTION_STRING);
            SqlDataAdapter da = new SqlDataAdapter("select DivisionName from dbo.Division where LeagueID=@id AND DivisionName=@name", conn);
            da.SelectCommand.Parameters.AddWithValue("@name", DivisionName);
            da.SelectCommand.Parameters.AddWithValue("@id", LeagueID);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
                return true;
            else
                return false;
        }
    }
}
