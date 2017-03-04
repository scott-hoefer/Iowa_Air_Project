using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;




namespace WebApplication1
{
    public partial class EmailConfirmed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var user = Membership.GetUser();
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userId = User.Identity.GetUserId();
            string code = manager.GenerateEmailConfirmationToken(userId);
            manager.ConfirmEmail(userId, code);
        }
    }
}