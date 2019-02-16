using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for IntermentSvc
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class IntermentSvc : System.Web.Services.WebService
    {
        [WebMethod]
        public dynamic IntermentList()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _list = db.getInterment(0, "").ToList()
                                .OrderByDescending(x => x.id)
                                .Select(x => new
                                {
                                    x.id,
                                    x.area,
                                    x.blk,
                                    x.lot,
                                    x.street,
                                    x.LAT,
                                    x.LONG,
                                    x.status
                                    //bday = x.bday.HasValue ? x.bday.Value.ToString("dd/MM/yyyy") : string.Empty,
                                    //x.address,
                                    //regDate = x.regDate.HasValue ? x.regDate.Value.ToString("dd/MM/yyyy") : string.Empty,
                                    //create_date = x.create_date.HasValue ? x.regDate.Value.ToString("dd/MM/yyyy") : string.Empty
                                }).ToList();

                    var _cremate = db.CremateInfos
                                    .ToList()
                                    .Select(x => new
                                    {
                                        x.id,
                                        cName = x.client_name,
                                        dob = x.dateOfBirth.HasValue ? x.dateOfBirth.Value.ToString("dd/MM/yyyy") : "N/S",
                                        location = x.location,
                                        dod = x.dateOfDeath.HasValue ? x.dateOfDeath.Value.ToString("dd/MM/yyyy") : "N/S",
                                        dateAdded = x.created_date.HasValue ? x.created_date.Value.ToString("dd/MM/yyyy") : "N/S"
                                    })
                                    .ToList();


                    //SMSController.SendSMSToClient("", "");                  


                    return new
                    {
                        isSuccess = true,
                        Interments = _list,
                        Cremates = _cremate
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
        public dynamic CremateList()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _list = db.getInterment(0, "").ToList()
                                .OrderByDescending(x => x.id)
                                .Select(x => new
                                {
                                    x.id,
                                    x.area,
                                    x.blk,
                                    x.lot,
                                    x.street,
                                    x.LAT,
                                    x.LONG,
                                    x.status
                                    //bday = x.bday.HasValue ? x.bday.Value.ToString("dd/MM/yyyy") : string.Empty,
                                    //x.address,
                                    //regDate = x.regDate.HasValue ? x.regDate.Value.ToString("dd/MM/yyyy") : string.Empty,
                                    //create_date = x.create_date.HasValue ? x.regDate.Value.ToString("dd/MM/yyyy") : string.Empty
                                }).ToList();

                    //SMSController.SendSMSToClient("", "");                  


                    return new
                    {
                        isSuccess = true,
                        Cremates = _list
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
        public dynamic SaveInterment(Interment interment)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    Interment _intermnet = new Interment();
                    _intermnet.code = interment.area;
                    _intermnet.area = interment.area;
                    _intermnet.blk = interment.blk;
                    _intermnet.lot = interment.lot;
                    _intermnet.street = interment.street;
                    _intermnet.LAT = interment.LAT;
                    _intermnet.LONG = interment.LONG;
                    _intermnet.status = "vacant";

                    db.Interments.InsertOnSubmit(_intermnet);
                    db.SubmitChanges();

                    return new
                    {
                        isSuccess = true,
                        msg = "Successfully saved"
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
        public dynamic SaveCremate(string name, string location, string dateOfDeath, string dateOfBirth)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    DateTime _dateOfDeath, _dateOfBirth;
                    DateTime.TryParse(dateOfDeath, out _dateOfDeath);
                    DateTime.TryParse(dateOfBirth, out _dateOfBirth);

                    if (_dateOfDeath == new DateTime())
                    {
                        return new
                        {
                            isSuccess = false,
                            msg = "Invalid Date of Death"
                        };
                    }

                    if (_dateOfBirth == new DateTime())
                    {
                        return new
                        {
                            isSuccess = false,
                            msg = "Invalid Date of Birth"
                        };
                    }


                    CremateInfo _cremate = new CremateInfo();
                    _cremate.client_name = name;
                    _cremate.dateOfBirth = _dateOfBirth;
                    _cremate.location = location;
                    _cremate.dateOfDeath = _dateOfDeath;
                    _cremate.created_date = DateTime.Now.Date;

                    db.CremateInfos.InsertOnSubmit(_cremate);
                    db.SubmitChanges();

                    return new
                    {
                        isSuccess = true,
                        msg = "Successfully saved"
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
        public dynamic DeleteInterment(string cID)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    Interment iF = db.Interments.Where(x => x.id == int.Parse(cID)).SingleOrDefault() ?? new Interment();
                    Deceased dd = db.Deceaseds.Where(x => x.location_id == int.Parse(cID)).SingleOrDefault() ?? new Deceased();                    
                    ClientInfo cF = db.ClientInfos.Where(x => x.id == dd.client_id).SingleOrDefault() ?? new ClientInfo();

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

        [WebMethod]
        public dynamic DeleteCremate(string cID)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    CremateInfo iF = db.CremateInfos.Where(x => x.id == int.Parse(cID)).SingleOrDefault();                    
                    db.CremateInfos.DeleteOnSubmit(iF);
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
