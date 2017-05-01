using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace WebApplication1
{
    public partial class About : Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchPassGrd_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["ResId"] = searchPassGrd.SelectedRow.Cells[1].Text;
            flightIdTxt.Visible = true;
            flightIdTxtLbl.Visible = true;
            checkedLbl.Visible = true;
            checkedTxtbox.Visible = true;
            carryOnLbl.Visible = true;
            carryOnTxtbox.Visible = true;
            seatLbl.Visible = true;
            seatTxtbox.Visible = true;
            checkInBtn.Visible = true;
        }

        protected void searchPassBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select ResId as 'Reservation Number', FlightId as 'Flight Number', CusName as 'Name', CusDOB as 'DOB', DepartDate as 'Departure Date', ReturnDate as 'Return Date', ReturnFlightId as 'Return Flight Number', FirstClass as 'First Class' from Reservations where CusName = '" + searchPassTxt.Text + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            searchPassGrd.DataSource = ds;
            searchPassGrd.DataBind();

            searchPassGrd.Visible = true;
            searchPassGrdLbl.Visible = true;
        }

        protected void checkInBtn_Click(object sender, EventArgs e)
        {
            int resID, carryOn, checkedBags; 
            int.TryParse(ViewState["ResId"].ToString(), out resID);
            int.TryParse(carryOnTxtbox.Text, out carryOn);
            int.TryParse(checkedTxtbox.Text, out checkedBags);
            ViewState["checked"] = checkedBags;
            ViewState["carryOn"] = carryOn;
            // get section for the boarding pass
            using (con)
            {
                using (SqlCommand command = new SqlCommand("Select FirstClass from Reservations where ResId = '" + resID + "' ", con))
                {
                    con.Open();
                    using (SqlDataReader rdr = command.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            Session["section"] = rdr[0].ToString();
                        }
                    }
                }
            }
            SqlConnection con2 = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebApplication1-20170209101639;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            System.Diagnostics.Debug.WriteLine("section = " + Session["section"].ToString());
            // update database
            con2.Open();
            SqlCommand cmd2;
            SqlDataAdapter adapter = new SqlDataAdapter();
            String sql = " Update Reservations set CheckedBags = '" + checkedBags + "' , CarryOnBags = '"+ carryOn +"', SeatNum = '"+seatTxtbox.Text+"' where ResId = '"+ resID +"' ";
            cmd2 = new SqlCommand(sql, con2);
            adapter.UpdateCommand = new SqlCommand(sql, con2);
            adapter.UpdateCommand.ExecuteNonQuery();
            cmd2.Dispose();
            con.Close();
            generatePDF();
        }

        private void generatePDF()
        {
            string section;
            if (Session["section"].ToString() == "True")
            {
                section = "First Class";
            }
            else
            {
                section = "Economy";
            }
            try
            {
                string pdfText = "Iowa Air Boarding Pass. \nReservation Number: " + ViewState["ResId"].ToString() + "\nPassenger Name: " + searchPassGrd.SelectedRow.Cells[3].Text + "\nPassenger DOB: " + searchPassGrd.SelectedRow.Cells[4].Text + "\nFlight Number: " + flightIdTxt.Text + "\nDeparture Date: " + searchPassGrd.SelectedRow.Cells[5].Text + "\nNo. Of Checked Bags: " + ViewState["checked"].ToString() + "\nNo. Of Carry On Items: " + ViewState["carryOn"].ToString() + "\nSeat No.: " + seatTxtbox.Text + "\nSection: " + section;
                Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
                PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                Paragraph Text = new Paragraph(pdfText);
                pdfDoc.Add(Text);
                pdfWriter.CloseStream = false;
                pdfDoc.Close();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=FlightReceipt.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
            catch (Exception ex)
            { Response.Write(ex.Message); }
        }
    }
}