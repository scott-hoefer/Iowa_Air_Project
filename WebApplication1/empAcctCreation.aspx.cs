using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication1.Models;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Web.Mail;
using System.Web.Security;

namespace WebApplication1
{
    public partial class empAcctCreation : Page
    { 

        protected void CreateEmployeeUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = newEmployeeEmail.Text, Email = newEmployeeEmail.Text };
            IdentityResult result = manager.Create(user, newEmployeePassword.Text);
            if (result.Succeeded)
            {
                // assign the default role of Employee
                ApplicationDbContext context = new ApplicationDbContext();
                var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                var addRole = UserManager.AddToRole(user.Id, "Employee");
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                Response.Redirect("~/EmailConfirmed.aspx");
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}