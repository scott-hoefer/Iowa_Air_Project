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
    public partial class BookAFlight : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            int rid = (int)Session["SelectedReturnFlight"];
            int id = (int)Session["SelectedFlight"];
            if (!Page.IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Session id = " + id);
                //System.Diagnostics.Debug.WriteLine("Return Flight # = " + returnDay);
                //SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, Price, DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where FlightId='" + id + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                bookFlightGrd.DataSource = ds;
                bookFlightGrd.DataBind();
                // return flight
                SqlDataAdapter da2 = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, Price, DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where FlightId='" + rid + "' ", con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                returnFlightGrd.DataSource = ds2;
                returnFlightGrd.DataBind();
                con.Close();
            }
        }

        protected void bookBtn_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into Aircraft values('" + "Boeing 777" + "' , '" + 194 + "' , '" + 95 + "' , '" + 0 + "')";
            cmd.ExecuteNonQuery();
        }
    }
}