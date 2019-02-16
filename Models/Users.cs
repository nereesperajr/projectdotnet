using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SinglePageApp.Models
{
    public class Users
    {
        public int id { get; set; }
        public string userid { get; set; }
        public string fullname { get; set; }
        public string password { get; set; }
        public string contactno { get; set; }
        public int is_active { get; set; }
    }
}