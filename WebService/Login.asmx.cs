using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SinglePageApp.Models;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for Login
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Login : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic CheckUsers(string uname, string upass)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var u = (from d in db.Users
                             select d)
                             .Where( x=> x.userid == uname && x.password == upass)
                             .ToList();                  

                    return new
                    {
                        isSuccess = u.Count > 0,
                        users = u
                        
                    };
                }
            }
            catch (Exception ex)
            {
                return new {
                    isSuccess = false,
                    message = String.Format("System Encountered error: {0}", ex.Message)
                };
            }
        }
    }
}
