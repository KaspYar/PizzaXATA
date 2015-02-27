using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Pizza.Service.Entity
{
    [DataContract(Name = "UserEntity")]
    public class UserEntity
    {
        [DataMember(Name = "id")]
        private int id { get; set; }
        [DataMember(Name = "username")]
        private string username { get; set; }
        [DataMember(Name = "password")]
        private string password { get; set; }
        [DataMember(Name = "email")]
        private string email { get; set; }

        public UserEntity(int id, string username, string password, string email)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
        }
    }
}