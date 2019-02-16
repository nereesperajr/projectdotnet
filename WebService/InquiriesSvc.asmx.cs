using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SinglePageApp.Controllers;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for InquiriesSvc
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class InquiriesSvc : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic Inquiries()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _inquiries = db.Inquiries
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
        public dynamic SaveInquiry(Inquiry inq)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    Inquiry _inq = new Inquiry();
                    _inq.subject = inq.subject;
                    _inq.msg = inq.msg;
                    _inq.senderName = inq.senderName;
                    _inq.contactno = inq.contactno;
                    _inq.email = inq.email;
                    _inq.sendDate = DateTime.Now;
                    _inq.status = 0;
                    _inq.is_deleted = 0;
                    _inq.sendMeMsg = inq.sendMeMsg != null || String.IsNullOrEmpty(inq.sendMeMsg.ToString()) ? 1 : 0;

                    db.Inquiries.InsertOnSubmit(_inq);
                    db.SubmitChanges();

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

        [WebMethod] 
        public dynamic SendMessage(string name, string msg)
        {
            try
            {
                var cNo = name.Split(' ').Reverse().ToArray()[0];

                SMSController.SendSMSToClient(cNo.ToString().Trim(), 
                        String.Join("\n", new string[] { "FROM: DMP", "MESSAGE: " + msg, "-\n\n" }));

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

        [WebMethod]
        public dynamic DeleteInquiry(string inqID)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    Inquiry inq = db.Inquiries.Where(x => x.id == int.Parse(inqID)).SingleOrDefault();

                    db.Inquiries.DeleteOnSubmit(inq);
                    db.SubmitChanges();                    

                }
                return new
                {
                    isSuccess = true,
                    msg = "Successfully deleted."
                };

            }

            catch (Exception ex)
            {
                return new { isSuccess = false, msg = String.Format("System encountered unexpected error: {0}", ex.Message) };
            }
        }
    }
}
