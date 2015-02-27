using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic.FileIO;
using System.Data.SqlClient;

namespace ParseCSVToDB
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ParseCSVForFields("c:\\TEMP\\goa_expenses1.csv");
        }

        public void ParseCSVForFields(string dataFileName)
        {
            var boolSkipFirst = true;
            var sb = new StringBuilder();
            var line = new List<string>();
            using (TextFieldParser parser = new TextFieldParser(dataFileName))
            {
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");
                parser.HasFieldsEnclosedInQuotes = true;  // some of the fields have quotes

                SqlConnection myConnection = new SqlConnection("user id=sa;" +
                                       "password=ming12;server=HPDESKTOPWIN81\\SQLEXPRESS;" +
                                       "Trusted_Connection=yes;" +
                                       "database=Alberta3; " +
                                       "connection timeout=30");
                // Open database
                try
                {
                    myConnection.Open();

                    var iLineNo = 0;
                    while (!parser.EndOfData)
                    {
                        //Processing row
                        //string currentRow = parser.ReadLine();
                        // Now parse each line
                        string[] fields = parser.ReadFields();
                        if (boolSkipFirst)
                        {
                            boolSkipFirst = false;
                            continue;
                        }
                        LitInfo.Text = "Processing Line #" + ++iLineNo;

                        if (fields == null)
                        {
                            litError.Text += "ERROR : line empty on iLineNo#=" + iLineNo.ToString();
                            continue;   // skip over empty lines
                        }
                        else if (fields.Count() != 11)
                        {
                            litError.Text += "ERROR : # of field count error--" + fields.ToString();
                            break;
                        }
                        else
                        {
                            SqlCommand myCommand = new SqlCommand("INSERT INTO [goa_expenses3a] (Ministry, Position, Name, Category, Type, DateIncurred, Amount, Description, Receipt) VALUES(" +
                                         Quote(fields[0].ToString()) + "," +
                                         Quote(fields[1].ToString()) + "," +
                                         Quote(fields[2].ToString()) + "," +
                                         Quote(fields[3].ToString()) + "," +
                                         Quote(fields[4].ToString()) + "," +
                                         Quote(fields[5].ToString()) + "," +
                                         Quote(fields[6].ToString()) + "," +
                                         Quote(fields[7].ToString()) + "," +
                                         Quote(fields[8].ToString()) + ")", myConnection);
                            myCommand.ExecuteNonQuery();
                        }
                        /*
                        if (iLineNo > 10)
                            break;
                        
                        foreach (var field in fields)
                        {
                        
                            //    this is where i am stuck
                        }
                        */
                    }
                    LitInfo.Text = iLineNo.ToString() + " processed all successfully.";

                }
                catch (Exception ex)
                {
                    litError.Text += "Unable to open/execute ex.Message=" + ex.Message;
                }
            }
        }

        private string Quote(string str)
        {
            return "'" + str.Replace("'", "''") + "'";
        }
    }
}