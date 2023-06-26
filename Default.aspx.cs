using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormVueExample
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Success_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
             "toastr_message", "toastr.success('Success Message here', 'Success Title')", true);
        }

        protected void Warning_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message", "toastr.warning('warning Message here', 'warning Title')", true);
        }

        protected void Error_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "toastr_message", "toastr.error('Error Message here', 'Error Title')", true);
        }

        protected void Info_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
             "toastr_message", "toastr.info('Info Message here', 'Info Title')", true);
        }
    }


}