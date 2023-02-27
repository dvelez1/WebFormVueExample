using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormVueExample
{
    public partial class Contact : Page
    {

        public class Employee
        {
            public string firstName { get; set; }
            public string lastName { get; set; }
            public string email { get; set; }
            public string role { get; set; }
        }

        [WebMethod]
        public static List<Employee> GetEmpList()
        {

            var empList = new List<Employee>(){
         new Employee { firstName="Ramon", lastName="Pardo", email="ramon@email.com",role="HR"},
         new Employee { firstName="Luis", lastName="García", email="luisG@email.com",role="IT"}
            };

            return empList;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}