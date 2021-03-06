﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
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
        int rid;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                rid = (int)Session["SelectedReturnFlight"];
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: '{0}'", ex);
                rid = 0;
            }

            int id = (int)Session["SelectedFlight"];
            if (!Page.IsPostBack)
            {
                System.Diagnostics.Debug.WriteLine("Session id = " + id);
                //System.Diagnostics.Debug.WriteLine("Return Flight # = " + returnDay);
                //SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'First Class Price', PriceEcon as 'Economy Price', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where FlightId='" + id + "' ", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                bookFlightGrd.DataSource = ds;
                bookFlightGrd.DataBind();
                // return flight
                SqlDataAdapter da2 = new SqlDataAdapter("Select FlightId as 'Flight No.', Origin as 'Departure City', Layover, Destination, PriceFC as 'First Class Price', PriceEcon as 'Economy Price', DepartTime as 'Departure Time', LayoverTime as 'Layover Times', ArrivalTime as 'Arrival Time' from Routes where FlightId='" + rid + "' ", con);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);
                returnFlightGrd.DataSource = ds2;
                returnFlightGrd.DataBind();
                con.Close();
                int FCPrice1, EconPrice1, FCPrice2, EconPrice2, econTotal, FCTotal, numPass;
                numPass = Convert.ToInt16(Session["numPassengers"]);
                int.TryParse(returnFlightGrd.Rows[0].Cells[4].Text, out FCPrice1);
                int.TryParse(bookFlightGrd.Rows[0].Cells[4].Text, out FCPrice2);
                int.TryParse(returnFlightGrd.Rows[0].Cells[5].Text, out EconPrice1);
                int.TryParse(bookFlightGrd.Rows[0].Cells[5].Text, out EconPrice2);
                FCTotal = (FCPrice1 + FCPrice2) * numPass;
                econTotal = (EconPrice1 + EconPrice2) * numPass;
                FCTotalLbl.Text = "Total for " + numPass + " first class ticket(s): " + FCTotal;
                EconTotalLbl.Text = "Total for " + numPass + " economy ticket: " + econTotal;
                Session["FCTotal"] = FCTotal;
                Session["EconTotal"] = econTotal;
            }
        }

        protected void bookFCBtn_Click(object sender, EventArgs e)
        {
            string id = User.Identity.GetUserId();
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated && isEmailConfirmed())
            {
                Session["whichClass"] = 1;
                Response.Redirect("EnterBookingInfo.aspx");
            }
            else
            {
                warningLbl.Visible = true;
            }
        }

        protected void bookEconBtn_Click(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated && isEmailConfirmed())
            {
                Session["whichClass"] = 0;
                Response.Redirect("EnterBookingInfo.aspx");
            }
            else
            {
                warningLbl.Visible = true;
            }
        }

        protected bool isEmailConfirmed()
        {
            
            using (SqlConnection con2 = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=DefaultConnection;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"))
            {
                using (SqlCommand command = new SqlCommand("Select EmailConfirmed from AspNetUsers", con2))
                {
                    con2.Open();
                    using (SqlDataReader rdr = command.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            Session["isConfirmed"] = rdr["emailConfirmed"].ToString();
                            System.Diagnostics.Debug.WriteLine("isConfirmed = " + (string)Session["isConfirmed"]);

                        }
                    }
                }
            }
            if ((string)Session["isConfirmed"] == "True")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}