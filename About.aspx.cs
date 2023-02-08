using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormVueExample
{
    public partial class About : Page
    {

        public class Employee
        {
            public int ID { get; set; }
            public string Name { get; set; }
        }

        //[WebMethod]
        //public List<Employee> GetEmpList()
        //{
        //    var empList = new List<Employee>(){
        // new Employee { ID=1, Name="Manas"},
        // new Employee { ID=2, Name="Tester"}};

        //    return empList;
        //}

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public Employee GetEmpl()
        {
            var empList = new List<Employee>(){
         new Employee { ID=1, Name="Manas"},
         new Employee { ID=2, Name="Tester"}};

            return empList[0];
        }




        protected void Page_Load(object sender, EventArgs e)
        {

        }





    }
}