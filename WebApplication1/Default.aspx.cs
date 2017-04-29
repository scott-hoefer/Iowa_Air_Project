using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        DateTime departDay, returnDay;
        int depDay, reDay;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void searchResultsGrd_SelectedIndexChanged(Object sender, EventArgs e)
        {
            String idText = searchResultsGrd.Rows[searchResultsGrd.SelectedIndex].Cells[1].Text;
            int id;
            int.TryParse(idText, out id);
            DateTime departDateTime;
            DateTime.TryParse(departDate.Text, out departDateTime);
            Session["DepartDateTime"] = departDateTime;
            //System.Diagnostics.Debug.WriteLine(id);
            Session["SelectedFlight"] = id;
            System.Diagnostics.Debug.WriteLine("round trip? " + (Boolean)ViewState["roundTrip"]);
            ViewState["departSelected"] = true;
            System.Diagnostics.Debug.WriteLine("depart selected = " + (Boolean)ViewState["departSelected"]);
            System.Diagnostics.Debug.WriteLine("return selected = " + (Boolean)ViewState["returnSelected"]);
            Session["DepartTime"] = searchResultsGrd.SelectedRow.Cells[7].Text;
            Session["DepartArrivalTime"] = searchResultsGrd.SelectedRow.Cells[9].Text;
            Session["DepartLayoverTimes"] = searchResultsGrd.SelectedRow.Cells[8].Text;
            System.Diagnostics.Debug.WriteLine("DepartTime = " + searchResultsGrd.SelectedRow.Cells[7].Text);
            System.Diagnostics.Debug.WriteLine("DepartArrivalTime = " + searchResultsGrd.SelectedRow.Cells[9].Text);
            System.Diagnostics.Debug.WriteLine("DepartLayoverTime = " + searchResultsGrd.SelectedRow.Cells[8].Text);
            if (!(Boolean)ViewState["roundTrip"])
            {
                Response.Redirect("BookAFlight.aspx");
            }
            if ((Boolean)ViewState["returnSelected"] && (Boolean)ViewState["departSelected"])
            {
                Response.Redirect("BookAFlight.aspx");
            }
        }

        // selecting a return flight
        protected void returnFlightGrd_SelectedIndexChanged(object sender, EventArgs e)
        {

            String idText = returnFlightGrd.Rows[returnFlightGrd.SelectedIndex].Cells[1].Text;
            int RId;
            int.TryParse(idText, out RId);
            DateTime returnDateTime;
            DateTime.TryParse(returnDate.Text, out returnDateTime);
            //System.Diagnostics.Debug.WriteLine(id);
            Session["SelectedReturnFlight"] = RId;
            ViewState["returnSelected"] = true;
            System.Diagnostics.Debug.WriteLine("depart selected = " + ViewState["returnSelected"]);
            System.Diagnostics.Debug.WriteLine("return selected = " + ViewState["departSelected"]);
            Session["ReturnTime"] = returnFlightGrd.SelectedRow.Cells[7].Text;
            Session["ReturnLayoverTimes"] = returnFlightGrd.SelectedRow.Cells[8].Text;
            Session["ReturnArrivalTime"] = returnFlightGrd.SelectedRow.Cells[9].Text;
            if ((Boolean)ViewState["returnSelected"] && (Boolean)ViewState["departSelected"])
            {
                Response.Redirect("BookAFlight.aspx");
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            ViewState["roundTrip"] = false;
            ViewState["returnSelected"] = false;
            ViewState["departSelected"] = false;
            int numTickets;
            int.TryParse(numPassengers.Text, out numTickets);
            if(numTickets < 1)
            {
                numTickets = 1;
            }
            Session["numPassengers"] = numTickets;
            // get the 2 days of the week, leaving and returning
            if (DateTime.TryParse(departDate.Text, out departDay))
            {
                depDay = (int)departDay.DayOfWeek;
                System.Diagnostics.Debug.WriteLine("depDay value =" + depDay);
                Session["DepartureDateTime"] = departDay;
                System.Diagnostics.Debug.WriteLine("DepartureDateTime = " + departDay);
            } else
            {
                noDepartDateLbl.Visible = true;
                return;
            }
            if (DateTime.TryParse(returnDate.Text, out returnDay))
            {
                ViewState["roundTrip"] = true;
                reDay = (int)returnDay.DayOfWeek;
                Session["ReturnDate"] = reDay;
                Session["ReturnDateTime"] = returnDay;
                System.Diagnostics.Debug.WriteLine("ReturnDateTime = " + returnDay);
            } else
            {
                reDay = 0;
                Session["ReturnDate"] = 0;
            }
            // destination cannot be same as departure city
            if (originCity.SelectedItem.Text == destinationCity.SelectedItem.Text)
            {
                warningLbl.Visible = true;
                return;
            }
            //search the DB 
            // depart is mon
            if (depDay == 1)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and M='"+ 1 +"' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }
            //tues
            if (depDay == 2)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and T='" + 1 + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }
            // wed
            if (depDay == 3)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and W='" + 1 + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }
            // thur
            if (depDay == 4)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and TH='" + 1 + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }
            // fri
            if (depDay == 5)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and F='" + 1 + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }
            // Sat
            if (depDay == 6)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and SA='" + 1 + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }
            // Sun
            if (depDay == 7)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + originCity.SelectedItem.Text + "' and Destination='" + destinationCity.SelectedItem.Text + "' and SU='" + 1 + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                searchResultsGrd.DataSource = ds;
                searchResultsGrd.DataBind();
                searchResultsGrd.Visible = true;
                searchResultsLbl.Visible = true;
            }

            if (reDay != 0)
            {
                //search the DB 
                // return day is mon
                if (reDay == 1)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and M='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
                //tues
                if (reDay == 2)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and T='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
                // wed
                if (reDay == 3)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and W='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
                // thur
                if (reDay == 4)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and TH='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
                // fri
                if (reDay == 5)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and F='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
                // Sat
                if (reDay == 6)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and SA='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
                // Sun
                if (reDay == 7)
                {
                    SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'Price First Class', PriceEcon as 'Price Economy', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where Origin= '" + destinationCity.SelectedItem.Text + "' and Destination='" + originCity.SelectedItem.Text + "' and SU='" + 1 + "' ", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    returnFlightGrd.DataSource = ds;
                    returnFlightGrd.DataBind();
                    returnFlightGrd.Visible = true;
                    returnFlightGrdLbl.Visible = true;
                }
            }

            warningLbl.Visible = false;
            noDepartDateLbl.Visible = false;
        }
    }
}