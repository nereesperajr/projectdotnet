using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SinglePageApp.Controllers;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for Events
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Events : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic EventList()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _events = db.Events
                                    .ToList()
                                    .OrderByDescending(x => x.create_date)
                                    .Select(x => new
                                    {
                                        x.id,
                                        x.eName,
                                        x.eDescription,
                                        x.eVenue,
                                        eDate = x.eDate.HasValue ? x.eDate.Value.ToString("dd/MM/yyyy") : string.Empty,
                                        eRemarks = String.IsNullOrEmpty(x.eRemarks) ? "" : x.eRemarks
                                    })
                                    .ToList();

                    return new
                    {
                        isSuccess = true,
                        Events = _events,
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
       public dynamic SaveEvents(Event evs)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    Event _evs = new Event();
                    _evs.eName = evs.eName;
                    _evs.eDescription = evs.eDescription;
                    _evs.eVenue = evs.eVenue;
                    _evs.eDate = evs.eDate;
                    _evs.eRemarks = evs.eRemarks;

                    db.Events.InsertOnSubmit(_evs);
                    db.SubmitChanges();

                    var allinquiries = (from c in db.Inquiries
                                        select c)
                                        .Where( x=> x.sendMeMsg == 1)
                                        .ToList()
                                        .Select(x => x.contactno)
                                        .ToList();

                    foreach (var c in allinquiries)
                    {
                        SMSController.SendSMSToClient((string)c, 
                            String.Join("\n",  new string[] { "FROM: DMP " , "WHAT: " + evs.eName, "WHEN: " + evs.eDate, "WHERE: " + evs.eVenue , "\n\n"}));
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
        public dynamic DeleteEvent(string eID)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    Event evs = db.Events.Where(x => x.id == int.Parse(eID)).SingleOrDefault();

                    db.Events.DeleteOnSubmit(evs);
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
