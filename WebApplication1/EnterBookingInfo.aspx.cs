using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class EnterBookingInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int numPass = Convert.ToInt16(Session["numPassengers"]);
            if (!Page.IsPostBack)
            {
                for (int i = 1; i <= numPass; i++)
                {
                    addControls(i);
                }
            }
        }

        private void addControls(int id)
        {
            var newPanel = new Panel();
            var newLabel = new Label();
            var newTextBox = new TextBox();

            newTextBox.ID = "TextBox" + id;
            newLabel.Text = "Enter Passenger number " + id + "'s name";

            newPanel.Controls.Add(newLabel);
            newPanel.Controls.Add(newTextBox);
            form1.Controls.Add(newPanel);
        }
    }
}