using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SinglePageApp.WebService
{
    /// <summary>
    /// Summary description for Index
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Index : System.Web.Services.WebService
    {

        [WebMethod]
        public dynamic Dashboard()
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    var _deceasedList = db.Deceaseds.Select(x => x.client_id).ToList();

                    var _list = (from d in db.Deceaseds
                                 join c in db.ClientInfos on d.client_id equals c.id
                                 join l in db.Interments on d.location_id equals l.id
                                 select new { d, c, l })
                                 .ToList()
                                .Select(x => new
                                {
                                    x.c.id,
                                    clientName = x.c.clientName,
                                    bday = x.c.bday.HasValue ? x.c.bday.Value.ToString("dd/MM/yyyy") : string.Empty,
                                    location = "Area: " + x.l.area + ", Blk: " + x.l.blk + ", Lot: " + x.l.lot + ", " + x.l.street,
                                    dod = x.d.dateOfDeath.HasValue ? x.d.dateOfDeath.Value.ToString("dd/MM/yyyy") : string.Empty,
                                    create_date = x.c.create_date.HasValue ? x.c.regDate.Value.ToString("dd/MM/yyyy") : string.Empty
                                }).ToList();

                    var _events = db.Events.ToList()
                                   .OrderByDescending(x => x.create_date)
                                   .Select(x => new
                                   {
                                       x.id,
                                       x.eName,
                                       x.eDescription
                                   }).ToList();

                    var _inquiries = db.Inquiries
                                    .Where (x => x.is_deleted != 1)
                                    .ToList()
                                    .OrderByDescending(x => x.sendDate)
                                    .Select(x => new {
                                        x.id,
                                        x.senderName,
                                        x.contactno,
                                        x.email,
                                        x.subject,
                                        x.msg,
                                        sendDate = x.sendDate.HasValue ? x.sendDate.Value.ToString("dd/MM/yyyy") : string.Empty
                                    })
                                    .ToList()
                                    .Take(5);

                    var _deceased = (from d in db.Deceaseds
                                     join c in db.ClientInfos on d.client_id equals c.id
                                     join l in db.Interments on d.location_id equals l.id
                                     select new
                                     {
                                         id = c.id,
                                         name = c.clientName,
                                         location = new { LAT = l.LAT, LONG = l.LONG }
                                     })
                                    .ToList();




                    //SMSController.SendSMSToClient("", "");                  


                    return new
                    {
                        isSuccess = true,
                        Clients = _list,
                        Inquiries = _inquiries,
                        Deceased = _deceased,
                        Events = _events
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
        public dynamic GetInterments(int searchType, string searchKey)
        {
            try
            {
                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {
                    var _interment = (from i in db.getInterment(searchType, searchKey)
                                      select new {
                                          i.id,
                                          i.area,
                                          i.blk,
                                          i.lot,
                                          i.street,
                                          i.status,
                                          LAT = double.Parse(i.LAT),
                                          LONG = double.Parse(i.LONG),
                                          name = i.clientname ?? "",
                                          dateOfDeath = i.dateOfDeath.HasValue ? i.dateOfDeath.Value.ToString("dd/MM/yyyy") : "N/A" ,
                                          bday = i.bday.HasValue ? i.bday.Value.ToString("dd/MM/yyyy") : "N/S"
                                      }) 
                            .ToList();
                    
                    return new
                    {
                        isSuccess = true,
                        Interment = _interment
                    };
                }
            }
            catch (Exception ex)
            {
                return new
                {
                    isSuccess = true,
                    Interment = ""
                };
            }
        }
        [WebMethod]
        public dynamic SaveDeceased(string name, string dateOfBirth, string location, string dateOfDeath)
        {
            try
            {
                if (String.IsNullOrEmpty(name) || String.IsNullOrEmpty(location))
                {
                    return new
                    {
                        isSuccess = false,
                        msg = "Please fill-in all fields"
                    };
                }

                using (MyDataContextDataContext db = new MyDataContextDataContext())
                {

                    var _location = location.Split(' ')[0];                    
                    int _lID = 0;
                    int.TryParse(_location, out _lID);

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

                    ClientInfo _cl = new ClientInfo();
                    _cl.clientName = name;
                    _cl.address = "";
                    _cl.cellNo = "";
                    _cl.bday = _dateOfBirth;
                    _cl.regDate = DateTime.Now.Date;

                    db.ClientInfos.InsertOnSubmit(_cl);
                    db.SubmitChanges();


                    if (!(db.Interments.Select( x=> x.id == _lID).Any()))
                    {
                        return new
                        {
                            isSuccess = false,
                            msg = "Interment not found in the database. Please refresh you browser and try again."
                        };
                    }

                    var d = db.Deceaseds.Where(x=> x.location_id == _lID);

                    if (d.Any())
                    {
                        return new
                        {
                            isSuccess = false,
                            msg = "Location is already occupied."
                        };
                    }

                    var i = db.Interments.Where(x => x.id == _lID).First();
                    i.status = "occupied";

                    Deceased _deceased = new Deceased();
                    _deceased.client_id = _cl.id;
                    _deceased.location_id = _lID;
                    _deceased.dateOfDeath = _dateOfDeath;
                    db.Deceaseds.InsertOnSubmit(_deceased);
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
                    isSuccess = true,
                    msg = "System Encountered unexpected error: " + ex.Message
                };
            }
        }

        //[WebMethod]
        //public dynamic GetDeceasedInfo(string searchType, string searchKey)
        //{

        //    try
        //    {
        //        var _clientID = name.Split(' ')[0];                
        //        int _cID = 0;
        //        int.TryParse(_clientID, out _cID);

        //        using (MyDataContextDataContext db = new MyDataContextDataContext())
        //        {
        //            var _deceased = (from d in db.Deceaseds
        //                             join c in db.ClientInfos on d.client_id equals c.id
        //                             join l in db.Interments on d.location_id equals l.id
        //                             select new
        //                             {
        //                                 id = c.id,
        //                                 name = c.clientName,
        //                                 location = new { LAT = double.Parse(l.LAT), LONG = double.Parse(l.LONG) }
        //                             })
        //                          .Where(x => x.id == _cID)
        //                          .FirstOrDefault();

        //            return new
        //            {
        //                isSuccess = true,
        //                Deceased = _deceased
        //            };
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return new
        //        {
        //            isSuccess = true,
        //            msg = "System Encountered unexpected error: " + ex.Message
        //        };
        //    }

        //}
    }
}
