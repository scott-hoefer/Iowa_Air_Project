using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            // get the 2 days of the week, leaving and returning
            DateTime departDay, returnDay;
            int depDay, reDay;
            if (DateTime.TryParse(departDate.Text, out departDay))
            {
                depDay = (int)departDay.DayOfWeek;
            }
            if (DateTime.TryParse(returnDate.Text, out returnDay))
            {
                reDay = (int)returnDay.DayOfWeek;
            }
            // destination cannot be same as departure city
            if (originCity.SelectedItem.Text == destinationCity.SelectedItem.Text)
            {
                warningLbl.Visible = true;
            }
            //search the DB
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, Price, DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '"+originCity.SelectedItem.Text+"' and Destination='"+destinationCity.SelectedItem.Text+"' ", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            searchResultsGrd.DataSource = ds;
            searchResultsGrd.DataBind();
            searchResultsGrd.Visible = true;
            searchResultsLbl.Visible = true;
        }
    }
}