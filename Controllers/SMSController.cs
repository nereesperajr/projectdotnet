using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nexmo.Api;
using SinglePageApp.Models;

namespace SinglePageApp.Controllers
{
    public class SMSController : Controller
    {
        // GET: SMS
        public static void SendSMSToClient(string cNo, string msg)
        {
            var client = new Client(creds: new Nexmo.Api.Request.Credentials
            {
                ApiKey = "f3c01d6e",
                ApiSecret = "1SYgZdSIG93JYApv"
            });
            var results = client.SMS.Send(request: new SMS.SMSRequest
            {
                from = Configuration.Instance.Settings["appsettings:NEXMO_FROM_NUMBER"],
                to = cNo,
                text = msg, //"Testing SMS",
                title = "DMP",
            });

            //string username = uname; // "projectdotnet01@gmail.com";
            //string password = pass; // "oo49w";
            //string msgsender = cNo; // "639172035502";
            //string destinationaddr = cNo; //"639172035502";
            //string message = msg; //"hello world";

            //// Create ViaNettSMS object with username and password
            //ViaNettSMS s = new ViaNettSMS(username, password);
            //// Declare Result object returned by the SendSMS function
            //ViaNettSMS.Result result;
            //try
            //{
            //    // Send SMS through HTTP API
            //    result = s.sendSMS(msgsender, destinationaddr, message);
            //    // Show Send SMS response
            //    if (result.Success)
            //    {
            //        Console.WriteLine("Message successfully sent");
            //    }
            //    else
            //    {
            //        Console.WriteLine("Received error: " + result.ErrorCode + " " + result.ErrorMessage);
            //    }
            //}
            //catch (System.Net.WebException ex)
            //{
            //    //Catch error occurred while connecting to server.
            //    Console.WriteLine(ex.Message);
            //}

        }

    }
}