using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Nexmo.Api;
using SinglePageApp.Controllers;
using SinglePageApp.Models;
namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for Client
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Client : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic ClientList()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _list = db.getClientList()
                                .Select(x => new
                                {
                                    id = x.ClientID,
                                    x.clientname,
                                    bday = x.bday.HasValue ? x.bday.Value.ToString("dd/MM/yyyy") : "N/A",
                                    interment = "Area: " + x.area + ", Blk: " + x.blk + ", Lot: " + x.lot + ", " + x.street,
                                    dateOfDeath = x.dateOfDeath.HasValue ? x.dateOfDeath.Value.ToString("dd/MM/yyyy") : "N/S",
                                    regDate = x.regDate.HasValue ? x.regDate.Value.ToString("dd/MM/yyyy") : "N/S",
                                })
                                .ToList();


                    //SMSController.SendSMSToClient("", "");                  


                    return new
                    {
                        isSuccess = true,
                        Clients = _list
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
        public dynamic SaveClient(ClientInfo cl, string interment, string dateOfDeath)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    ClientInfo _cl = new ClientInfo();
                    _cl.clientName = cl.clientName;
                    _cl.address = cl.address ?? "";
                    _cl.cellNo = cl.cellNo ?? "";
                    _cl.bday = cl.bday;
                    _cl.regDate = cl.regDate;                    

                    db.ClientInfos.InsertOnSubmit(_cl);
                    db.SubmitChanges();

                    if (string.IsNullOrEmpty(interment) && string.IsNullOrEmpty(dateOfDeath))
                    {
                        Deceased ds = new Deceased();
                        ds.client_id = _cl.id;
                        ds.location_id = int.Parse(interment.Split(' ').ToArray()[0]);
                        ds.dateOfDeath = DateTime.Parse(dateOfDeath);

                        db.Deceaseds.InsertOnSubmit(ds);
                        db.SubmitChanges();
                    }

                    return new
                    {
                        isSuccess = true,
                        msg = "Successfully saved"
                    };
                }
            }
            catch (Exception ex)
            {
                return new { isSuccess = false, msg = String.Format("System encountered unexpected error: {0}", ex.Message)};
            }

            
        }

        [WebMethod]
        public dynamic DeleteClient(string cID)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    ClientInfo cF = db.ClientInfos.Where(x => x.id == int.Parse(cID)).SingleOrDefault() ?? new ClientInfo();
                    Deceased dd = db.Deceaseds.Where(x => x.client_id == int.Parse(cID)).SingleOrDefault() ?? new Deceased();
                    Interment iF = db.Interments.Where(x => x.id == dd.location_id).SingleOrDefault() ?? new Interment();

                    iF.status = "vacant";

                    if (cF.id != 0)
                    {
                        db.ClientInfos.DeleteOnSubmit(cF);
                    }

                    if (dd.id != 0)
                    {
                        db.Deceaseds.DeleteOnSubmit(dd);
                    }

                    if (iF.id != 0)
                    {
                        db.Interments.DeleteOnSubmit(iF);
                    }

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
            //[WebMethod]
            //public bool SendSMS(string to, string msg)
            //{
            //    var results = SMS.Send(new SMS.SMSRequest
            //    {
            //        from = Configuration.Instance.Settings["appsettings:NEXMO_FROM_NUMBER"],
            //        to = to,
            //        text = text
            //    });
            //}

        }
}
