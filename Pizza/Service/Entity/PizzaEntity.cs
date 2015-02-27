using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace Pizza.Service.Entity
{
    [DataContract(Name = "Pizza")]
    public class PizzaEntity
    {
        [DataMember(Name = "id")]
        private int id { get; set; }
        [DataMember(Name = "name")]
        private string name { get; set; }
        [DataMember(Name = "ingridients")]
        private string ingridients { get; set; }
        [DataMember(Name = "price")]
        private float price { get; set; }
        public PizzaEntity(int id, string name, string ingridients, float price)
        {
            this.id = id;
            this.name = name;
            this.ingridients = ingridients;
            this.price = price;
        }
    }
}