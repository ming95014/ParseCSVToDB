using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public static class CommonLib
    {
        public static string ShowSQLData(string strSQL, bool boolShowSQL, bool boolShowLineNo)
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
                    if (boolShowSQL) sb.Append("<b>SQL=" + strSQL + "</b><br/>");
                    sb.Append("<table border='1' cellspacing='0' cellpadding='0'><tr bgcolor='cornsilk'>");
                    if (boolShowLineNo) sb.Append("<td>#</td>");
                    // Show Column names
                    for (int i = 0; i < reader.FieldCount; i++)
                        sb.Append("<td align='center'><b>" + reader.GetName(i) + "</b></td>");

                    sb.Append("</tr><tr>");
                    // Now loop through the data set
                    int cnt = 1;
                    while (reader.Read())
                    {
                        if (boolShowLineNo) sb.Append("<td align='center'>" + cnt++ + "</td>");
                        // Show the data for each column
                        //for (int i = 0; i < reader.FieldCount; i++)
                        //    sb.Append("<td>" + reader[i].ToString() + "</td>");
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            if (IsNumeric(reader[i].ToString()))
                                sb.Append("<td align='right'>" + Convert.ToInt32(reader[i].ToString()).ToString("N0") + "</td>");
                            else
                                sb.Append("<td align='center'>" + reader[i].ToString() + "</td>");
                        }     
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

        public static int GetCount(string strSQL)
        {
            int iRet = 0;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            myConnection.Open();
            try
            {
                SqlCommand myCommand = new SqlCommand();
                myCommand.Connection = myConnection;
                myCommand.CommandText = strSQL;
                iRet = (int)myCommand.ExecuteScalar();
            }
            catch (Exception ex)
            {
                //sb.Append(ex.Message);
            }
            finally
            {
                myConnection.Close();
            }
            return iRet;
        }

        public static string Quote(string str)
        {
            return "'" + str.Replace("'", "''") + "'";
        }

        public static bool IsNumeric(string str)
        {
            int result;
            return (int.TryParse(str, out result));
        }

        public static string TwoDigit(string str)
        {
            return str.Trim().Length == 2 ? str : "0" + str;
        }

        public static string GetYYYYMMDDHHMMSS()
        {
            return DateTime.Now.ToString("s");
        }

        public static DataTable fillDataTable(string strConStr, string strSQL)
        {
            //string query = "SELECT * FROM dstut.dbo." + table;
            SqlConnection sqlConn = new SqlConnection(strConStr);
            sqlConn.Open();
            SqlCommand cmd = new SqlCommand(strSQL, sqlConn);

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            sqlConn.Close();
            return dt;
        }
    }
}