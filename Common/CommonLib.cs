using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public static class CommonLib
    {
        public static string ShowSQLData(string strSQL)
        {
            StringBuilder sb = new StringBuilder();
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            myConnection.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand();
                myCommand.Connection = myConnection;
                myCommand.CommandText = strSQL;
                using (SqlDataReader reader = myCommand.ExecuteReader())
                {
                    sb.Append("<b>SQL=" + strSQL + "</b><br/>");
                    sb.Append("<table border='1' cellspacing='0' cellpadding='0'><tr bgcolor='cornsilk'><td>#</td>");
                    // Show Column names
                    for (int i = 0; i < reader.FieldCount; i++)
                        sb.Append("<td align='center'><b>" + reader.GetName(i) + "</b></td>");

                    sb.Append("</tr><tr>");
                    // Now loop through the data set
                    int cnt = 1;
                    while (reader.Read())
                    {
                        sb.Append("<td align='center'>" + cnt++ + "</td>");
                        // Show the data for each column
                        for (int i = 0; i < reader.FieldCount; i++)
                            sb.Append("<td>" + reader[i].ToString() + "</td>");
                        sb.Append("</tr>");
                    }
                    sb.Append("</table>");
                }
            }
            catch (Exception ex)
            {
                sb.Append(ex.Message);
            }
            finally
            {
                myConnection.Close();
            }
            return sb.ToString();
        }
    }
}