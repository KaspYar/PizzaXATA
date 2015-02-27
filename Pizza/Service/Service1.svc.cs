using Pizza.Service.Entity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

namespace Pizza.Service
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service.svc or Service.svc.cs at the Solution Explorer and start debugging.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service1 : IService1
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        
        public PizzaEntity [] GetPizza()
        {
            LinkedList<PizzaEntity> lst = new LinkedList<PizzaEntity>();
            connection.Open();
            String selectPizza = "select * from [pizza]";
            SqlCommand command = new SqlCommand(selectPizza, connection);
            SqlDataReader data = command.ExecuteReader();
            while (data.Read())
            {
                lst.AddLast(new PizzaEntity(data.GetInt32(0),data.GetString(1).Trim(),data.GetString(2).Trim(),data.GetFloat(3)));
            }
            connection.Close();
            return lst.ToArray<PizzaEntity>();
        }


        public OrderEntity[] GetMyOrders(string id_user)
        {
            LinkedList<OrderEntity> lst = new LinkedList<OrderEntity>();
            connection.Open();
            String selectOrderToUser = "SELECT [order].[Id] AS id, email, "+
                "[pizza].[Id] AS id_pizza, name , ingridients, price,[user].[Id] AS id_user, amount, status "+
            "FROM  [order] INNER JOIN [user] ON [order].[id_user]=[user].[id] INNER JOIN [pizza] "+
            "ON [order].[id_pizza]=[pizza].[id] "+
            "WHERE [user].[Id]= @id_user ORDER BY [order].[Id] DESC";
            SqlCommand command = new SqlCommand(selectOrderToUser, connection);
            command.Parameters.AddWithValue("@id_user", Convert.ToInt32(id_user));
            SqlDataReader data = command.ExecuteReader();
            while (data.Read())
            {
                lst.AddLast(new OrderEntity(
                    data.GetInt32(0), new PizzaEntity(
                        data.GetInt32(2), data.GetString(3).Trim(), data.GetString(4).Trim(), data.GetFloat(5)),
                data.GetInt32(6),data.GetInt32(7), data.GetString(8).Trim()));
            }
            connection.Close();
            return lst.ToArray<OrderEntity>();
        }


        public void AddNewOrder(string id_user, string id_pizza, string amount)
        {
            connection.Open();
            String addNewOrder = "INSERT INTO [order]([id_pizza],[id_user],[amount]) VALUES (@id_pizza, @id_user,@amount)";
            SqlCommand command = new SqlCommand(addNewOrder, connection);
            command.Parameters.AddWithValue("@id_pizza", Convert.ToInt32(id_pizza));
            command.Parameters.AddWithValue("@id_user", Convert.ToInt32(id_user));
            command.Parameters.AddWithValue("@amount", Convert.ToInt32(amount));
            int result = command.ExecuteNonQuery();
            connection.Close();
            return;
        }


        public string Login(string userName, string password)
        {
            connection.Open();
            String doLogIn = "select [user].[Id] from  [user] " +
                    "where username = @userName and password = @password;";
            SqlCommand command = new SqlCommand(doLogIn, connection);
            command.Parameters.AddWithValue("@userName", userName);
            command.Parameters.AddWithValue("@password", password);
            SqlDataReader data = command.ExecuteReader();
            int result = 0;
            if (data.Read())
            {
                result = data.GetInt32(0);
            }
            connection.Close();
            return result.ToString();
        }
    }
}
