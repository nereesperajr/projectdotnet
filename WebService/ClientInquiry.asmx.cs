using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for Inquiries
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ClientInquiry : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic InquiriesList()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _inquiries = db.Inquiries
                                    .Where(x => x.is_deleted != 1)
                                    .ToList()
                                    .OrderByDescending(x => x.sendDate)
                                    .Select(x => new
                                    {
                                        x.id,
                                        x.senderName,
                                        x.contactno,
                                        x.email,
                                        x.subject,
                                        x.msg,
                                        sendDate = x.sendDate.HasValue ? x.sendDate.Value.ToString("dd/MM/yyyy") : string.Empty
                                    })
                                    .ToList();

                    //SMSController.SendSMSToClient("", "");                  


                    return new
                    {
                        isSuccess = true,
                        Inquiries = _inquiries
                    };
                }



            }

            catch (Exception ex)
            {
                return new
                {
                    isSuccess = false,
                    msg = String.Format("Please refresh the browser, system encountered unexpected error: {0}", ex.Message)
                };
            }
        }

        [WebMethod]
        public dynamic SaveInquiry()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                     
                }

                return new
                {
                    isSuccess = true,
                    msg = "Successfully saved."
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    isSuccess = false,
                    msg = String.Format("Please refresh the browser, system encountered unexpected error: {0}", ex.Message)
                };
            }
        }
    }
}
