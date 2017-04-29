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
    public partial class EnterBookingInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        SqlCommand cmd;
        List<TextBox> textboxes = new List<TextBox>();
        List<Label> labels = new List<Label>();
        List<TextBox> dobBoxes = new List<TextBox>();
        List<Label> dobLabels = new List<Label>();
        protected void Page_Load(object sender, EventArgs e)
        {
            int numPass = Convert.ToInt16(Session["numPassengers"]);
            textboxes.Add(textbox1);
            textboxes.Add(textbox2);
            textboxes.Add(textbox3);
            textboxes.Add(textbox4);
            textboxes.Add(textbox5);
            textboxes.Add(textbox6);
            textboxes.Add(textbox7);
            textboxes.Add(textbox8);
            textboxes.Add(textbox9);
            textboxes.Add(textbox10);
            textboxes.Add(textbox11);
            textboxes.Add(textbox12);
            textboxes.Add(textbox13);
            textboxes.Add(textbox14);
            textboxes.Add(textbox15);
            textboxes.Add(textbox16);
            textboxes.Add(textbox17);
            textboxes.Add(textbox18);
            textboxes.Add(textbox19);
            textboxes.Add(textbox20);
            labels.Add(lbl1);
            labels.Add(lbl2);
            labels.Add(lbl3);
            labels.Add(lbl4);
            labels.Add(lbl5);
            labels.Add(lbl6);
            labels.Add(lbl7);
            labels.Add(lbl8);
            labels.Add(lbl9);
            labels.Add(lbl10);
            labels.Add(lbl11);
            labels.Add(lbl12);
            labels.Add(lbl13);
            labels.Add(lbl14);
            labels.Add(lbl15);
            labels.Add(lbl16);
            labels.Add(lbl17);
            labels.Add(lbl18);
            labels.Add(lbl19);
            labels.Add(lbl20);
            dobBoxes.Add(DOBBox1);
            dobBoxes.Add(DOBBox2);
            dobBoxes.Add(DOBBox3);
            dobBoxes.Add(DOBBox4);
            dobBoxes.Add(DOBBox5);
            dobBoxes.Add(DOBBox7);
            dobBoxes.Add(DOBBox8);
            dobBoxes.Add(DOBBox9);
            dobBoxes.Add(DOBBox10);
            dobBoxes.Add(DOBBox11);
            dobBoxes.Add(DOBBox12);
            dobBoxes.Add(DOBBox13);
            dobBoxes.Add(DOBBox14);
            dobBoxes.Add(DOBBox15);
            dobBoxes.Add(DOBBox16);
            dobBoxes.Add(DOBBox17);
            dobBoxes.Add(DOBBox18);
            dobBoxes.Add(DOBBox19);
            dobBoxes.Add(DOBBox20);
            dobLabels.Add(DOBLbl1);
            dobLabels.Add(DOBLbl2);
            dobLabels.Add(DOBLbl3);
            dobLabels.Add(DOBLbl4);
            dobLabels.Add(DOBLbl5);
            dobLabels.Add(DOBLbl6);
            dobLabels.Add(DOBLbl7);
            dobLabels.Add(DOBLbl8);
            dobLabels.Add(DOBLbl9);
            dobLabels.Add(DOBLbl10);
            dobLabels.Add(DOBLbl11);
            dobLabels.Add(DOBLbl12);
            dobLabels.Add(DOBLbl13);
            dobLabels.Add(DOBLbl14);
            dobLabels.Add(DOBLbl15);
            dobLabels.Add(DOBLbl16);
            dobLabels.Add(DOBLbl17);
            dobLabels.Add(DOBLbl18);
            dobLabels.Add(DOBLbl19);
            dobLabels.Add(DOBLbl20);
            if (!Page.IsPostBack)
            {
                for (int i=0; i < numPass; i++)
                {
                    textboxes[i].Visible = true;
                    labels[i].Visible = true;
                    dobLabels[i].Visible = true;
                    dobBoxes[i].Visible = true;
                }
            }
        }

        protected void confirmBtn_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Confirm click was called");
            int numPass = Convert.ToInt16(Session["numPassengers"]);
            System.Diagnostics.Debug.WriteLine("numPass = " + numPass);
            System.Diagnostics.Debug.WriteLine("textboxes length = " + textboxes.Count);
            for (int i = 0; i < numPass; i++)
            {
                if (textboxes[i].Text == "")
                {
                    namesWarningLbl.Visible = true;
                }
                else
                {
                    TextBox tb = textboxes[i];
                    DateTime dob;
                    DateTime.TryParse(dobBoxes[i].Text, out dob);
                    System.Diagnostics.Debug.WriteLine("dob = " + dob);
                    addToDB(tb, dob);
                }
            }
        }

        // add to database
        private void addToDB(TextBox TB, DateTime dob)
        {
            int seatType = (int)Session["whichClass"];
            int rid = (int)Session["SelectedReturnFlight"];
            int id = (int)Session["SelectedFlight"];
            System.Diagnostics.Debug.WriteLine("rid = " + rid);
            DateTime depart = (DateTime)Session["DepartDateTime"];
            DateTime returnDate = (DateTime)Session["ReturnDateTime"];
            con.Open();
            cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into Reservations values('" + id + "' , '" + TB.Text + "' , '" + dob + "' , '" + depart + "' , '" + returnDate + "' , '" + DBNull.Value + "' , '" + DBNull.Value + "' , '" + DBNull.Value + "' , '" + rid + "' , '" + seatType + "')";
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}