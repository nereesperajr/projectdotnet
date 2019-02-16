using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SinglePageApp.Controllers;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for AnnouncementSvc
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AnnouncementSvc : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic Announcements()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _announcement = db.Announcements
                                    .ToList()
                                    .OrderByDescending(x => x.create_date)
                                    .Select(x => new
                                    {
                                        x.id,
                                        x.subject,
                                        x.msg
                                    })
                                    .ToList();

                    //SMSController.SendSMSToClient("", "");                  


                    return new
                    {
                        isSuccess = true,
                        Announcement = _announcement
                    };
                }
            }

            catch (Exception ex)
            {
                return new
                {
                    isSuccess = false,
                    message = String.Format("Please refresh the browser, system encountered unexpected error: {0}", ex.Message)
                };
            }
        }

        [WebMethod]
        public dynamic SaveAnnouncement(Announcement anns)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    Announcement _anns = new Announcement();
                    _anns.subject = anns.subject;
                    _anns.msg = anns.msg;
                    _anns.create_date = DateTime.Now;

                    db.Announcements.InsertOnSubmit(_anns);
                    db.SubmitChanges();

                    var allinquiries = (from c in db.Inquiries
                                        select c)
                                        .Where(x => x.sendMeMsg == 1)
                                        .ToList()
                                        .Select(x => x.contactno)
                                        .ToList();

                    foreach (var c in allinquiries)
                    {
                        SMSController.SendSMSToClient((string)c, String.Join("\n", new string[] { "FROM: DMP", "MESSAGE: " + _anns.msg, "-\n\n" }));
                    }
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
        public dynamic DeleteAnnouncement(string annID)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    Announcement anns = db.Announcements.Where(x => x.id == int.Parse(annID)).SingleOrDefault();

                    db.Announcements.DeleteOnSubmit(anns);
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
