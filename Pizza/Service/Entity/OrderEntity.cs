using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Pizza.Service.Entity
{
    [DataContract(Name = "Pizza")]
    public class OrderEntity
    {
        [DataMember(Name = "id")]
        private int id { get; set; }
        [DataMember(Name = "pizza")]
        private PizzaEntity pizza { get; set; }
        [DataMember(Name = "user")]
        private int id_user { get; set; }
        [DataMember(Name = "amount")]
        private int amount { get; set; }
        [DataMember(Name = "status")]
        private string status { get; set; }

        public OrderEntity(int id, PizzaEntity pizza, int id_user, int amount, string status)
        {
            this.id = id;
            this.pizza = pizza;
            this.id_user = id_user;
            this.amount = amount;
            this.status = status;
        }
    }
}