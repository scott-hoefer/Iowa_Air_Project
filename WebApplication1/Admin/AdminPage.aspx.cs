using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Admin
{
    public partial class AdminPage1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillDrops();
                updateDB();
            }
        }


        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            routesGridView.PageIndex = e.NewPageIndex;
            routesGridView.DataBind();
        }

        private void fillDrops()
        {
            // fill drop Down List for delete aircraft
            delAircraft.DataSource = getAircraftData();
            delAircraft.DataTextField = "delData";
            delAircraft.DataValueField = "AircraftId";
            delAircraft.DataBind();
            // fill drop down list for add route
            routeAircraft.DataSource = getAircraftData();
            routeAircraft.DataTextField = "delData";
            routeAircraft.DataValueField = "AircraftId";
            routeAircraft.DataBind();
        }

        public DataTable getAircraftData()
        {
            cmd = new SqlCommand("getAircraft", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public DataTable getRouteData()
        {
            cmd = new SqlCommand("getRoutes", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        protected void SendEmployeeLink_Click(object sender, EventArgs e)
        {
            string pGmailEmail = "iowaair06A@gmail.com";
            string pGmailPassword = "Pword1234!";
            string pTo = EmployeeEmail.Text; //abc@domain.com
            string pSubject = "Employee Account Creation";
            //string pBody = "Please click " + '<a runat='server' href='localhost:49384/EmailConfirmed'>Here</a>' + " to confirm your email."; //Body
            MailFormat pFormat = MailFormat.Html; //Text Message
            string pAttachmentPath = string.Empty; //No Attachments

            System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
            myMail.Fields.Add
                ("http://schemas.microsoft.com/cdo/configuration/smtpserver",
                              "smtp.gmail.com");
            myMail.Fields.Add
                ("http://schemas.microsoft.com/cdo/configuration/smtpserverport",
                              "465");
            myMail.Fields.Add
                ("http://schemas.microsoft.com/cdo/configuration/sendusing",
                              "2");
            //sendusing: cdoSendUsingPort, value 2, for sending the message using 
            //the network.

            //smtpauthenticate: Specifies the mechanism used when authenticating 
            //to an SMTP 
            //service over the network. Possible values are:
            //- cdoAnonymous, value 0. Do not authenticate.
            //- cdoBasic, value 1. Use basic clear-text authentication. 
            //When using this option you have to provide the user name and password 
            //through the sendusername and sendpassword fields.
            //- cdoNTLM, value 2. The current process security context is used to 
            // authenticate with the service.
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            //Use 0 for anonymous
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/sendusername",
                pGmailEmail);
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/sendpassword",
                 pGmailPassword);
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpusessl",
                 "true");
            myMail.From = pGmailEmail;
            myMail.To = pTo;
            myMail.Subject = pSubject;
            myMail.BodyFormat = pFormat;
            myMail.Body = "Please click <a href=\"http://localhost:49384/empAcctCreation.aspx\">here</a> to be redirected to the Employee Account Creation Page, where you will set up your log in info.";
            if (pAttachmentPath.Trim() != "")
            {
                MailAttachment MyAttachment =
                        new MailAttachment(pAttachmentPath);
                myMail.Attachments.Add(MyAttachment);
                myMail.Priority = System.Web.Mail.MailPriority.High;
            }

            SmtpMail.SmtpServer = "smtp.gmail.com:465";
            SmtpMail.Send(myMail);

            emailSentConfirmation.Visible = true;
        }

        protected void updateDB()
        {
            con.Open();
            SqlCommand cmd2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = "Update Aircraft set InUse='" + 0 + "' where AircraftId NOT IN (SELECT AircraftId FROM Routes)";
            cmd2 = new SqlCommand(sql, con);
            adapter.UpdateCommand = new SqlCommand(sql, con);
            adapter.UpdateCommand.ExecuteNonQuery();
            cmd2.Dispose();
            con.Close();
            fillDrops();
        }

        protected void addAircraft_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            if (addAircraft.SelectedValue == "1")
            {
                // value 1 was selected, Boeing 777
                cmd.CommandText = "insert into Aircraft values('"+"Boeing 777"+"' , '"+194+"' , '"+95+"' , '"+0+"')";
                cmd.ExecuteNonQuery();
                addSuccessful.Visible = true;
                noSelection.Visible = false;
            } else if (addAircraft.SelectedValue == "2") {
                // value 2
                cmd.CommandText = "insert into Aircraft values('"+ "Boeing 767" + "' , '"+188+"', '"+30+"', '"+0+"')";
                cmd.ExecuteNonQuery();
                addSuccessful.Visible = true;
                noSelection.Visible = false;
            } else if (addAircraft.SelectedValue == "3")
            {
                // value 3
                cmd.CommandText = "insert into Aircraft values('" + "Airbus 380" + "' , '" + 557 + "', '" + 58 + "', '" + 0 + "')";
                cmd.ExecuteNonQuery();
                addSuccessful.Visible = true;
                noSelection.Visible = false;
            } else if (addAircraft.SelectedValue == "4") {
                //value 4
                cmd.CommandText = "insert into Aircraft values('" + "Boeing 747" + "' , '" + 328 + "', '" + 48 + "', '" + 0 + "')";
                cmd.ExecuteNonQuery();
                addSuccessful.Visible = true;
                noSelection.Visible = false;
            } else if (addAircraft.SelectedValue == "0") { 
                // user failed to select an aircraft
                noSelection.Visible = true;
                addSuccessful.Visible = false;
            }

            con.Close();
            fillDrops();
        }
        protected void delAircraft_Click(object sender, EventArgs e)
        {
            int id;
            String x = delAircraft.SelectedValue;
            int.TryParse(x, out id);
            //System.Diagnostics.Debug.WriteLine(id);
            using (cmd = new SqlCommand(@"Delete from Aircraft where AircraftId = @id", con))
            {
                con.Open();
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                con.Close();
                fillDrops();
            }
            delSuccessful.Visible = true;
        }
        protected void addRoute_Click(object sender, EventArgs e)
        {
            int price;
            int.TryParse(priceTxtBox.Text, out price);
            int plane;
            int.TryParse(routeAircraft.SelectedItem.Value, out plane);
            int m, t, w, th, f, sa, su;
            // mondays
            if (frequency.Items[0].Selected)
            {
                m = 1;
            }
            else
            {
                m = 0;
            }
            //tues
            if (frequency.Items[1].Selected)
            {
                t = 1;
            }
            else
            {
                t = 0;
            }
            //wednesdays
            if (frequency.Items[2].Selected)
            {
                w = 1;
            }
            else
            {
                w = 0;
            }
            //thur
            if (frequency.Items[3].Selected)
            {
                th = 1;
            }
            else
            {
                th = 0;
            }
            // fri
            if (frequency.Items[4].Selected)
            {
                f = 1;
            }
            else
            {
                f = 0;
            }
            // sat
            if (frequency.Items[5].Selected)
            {
                sa = 1;
            }
            else
            {
                sa = 0;
            }
            // sun
            if (frequency.Items[6].Selected)
            {
                su = 1;
            }
            else
            {
                su = 0;
            }
            if (layoverCity.SelectedValue == "0")
            {
                using (cmd = new SqlCommand(@"insert into Routes values('" + plane + "' , '" + originCity.SelectedItem.Text + "' , '" + DBNull.Value + "' , '" + destinationCity.SelectedItem.Text + "' , '" + m + "' , '" + t + "' , '" + w + "' , '" + th + "' , '" + f + "' , '" + sa + "' , '" + su + "' , '" + price + "' , '" + departTimeTxtBox.Text + "' , '" + DBNull.Value + "' , '" + arrivalTimeTxtBox.Text + "' ,'" + 0 + "' , '" + 0 + "')", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                using (cmd = new SqlCommand(@"insert into Routes values('" + plane + "' , '" + originCity.SelectedItem.Text + "' , '" + layoverCity.SelectedItem.Text + "' , '" + destinationCity.SelectedItem.Text + "' , '" + m + "' , '" + t + "' , '" + w + "' , '" + th + "' , '" + f + "' , '" + sa + "' , '" + su + "' , '" + price + "' , '" + departTimeTxtBox.Text + "' , '" + layoverTimeTxtBox.Text + "' , '" + arrivalTimeTxtBox.Text + "' , '" + 0 + "' , '" + 0 + "')", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            con.Open();
            SqlCommand cmd2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = "Update Aircraft set InUse='" + 1 + "' where AircraftId= '" + plane + "'";
            cmd2 = new SqlCommand(sql, con);
            adapter.UpdateCommand = new SqlCommand(sql, con);
            adapter.UpdateCommand.ExecuteNonQuery();
            cmd2.Dispose();
            con.Close();
            fillDrops();
            Response.Redirect(Request.RawUrl);
        }
    }
}