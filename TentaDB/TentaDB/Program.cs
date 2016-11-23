using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using TentaDB.Model;

namespace TentaDB
{
    class Program
    {
        public static string cns = ConfigurationManager.ConnectionStrings["cns"].ConnectionString;
        static void Main(string[] args)
        {
            Console.WriteLine("1. ProductsByCategoryName");
            Console.WriteLine("2. SalesByTerritory");
            Console.WriteLine("3. EmployeesPerRegion");
            Console.WriteLine("4. OrdersPerEmployee");
            Console.WriteLine("5. CustomersWithNamesLongerThan25Characters");
            Console.WriteLine("---------------------------");
            string val = Console.ReadLine();
            if (val == "1")
            {
                Console.WriteLine("---------------------------");
                Console.Write("Category name: ");
                ProductsByCategoryName(Console.ReadLine());
            }
            if (val == "2")
            {
                SalesByTerritory();
            }
            if (val == "3")
            {
                EmployeesPerRegion();
            }
            if (val == "4")
            {
                OrdersPerEmployee();
            }
            if (val == "5")
            {
                CustomersWithNamesLongerThan25Characters();
            }
            Console.ReadLine();
        }
        public static void ProductsByCategoryName(string CategoryName)
        {
            var cn = new SqlConnection(cns);
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandText = "SELECT p.ProductName, p.UnitPrice, p.UnitsInStock FROM Products p WHERE p.CategoryID = (SELECT c.CategoryID FROM Categories c WHERE CategoryName = @CategoryName)";
            cmd.Parameters.AddWithValue("@CategoryName", CategoryName);
            cn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Console.Clear();
            Console.WriteLine("Product name - Unit price - Units in stock\n----------------------------------");
            while (rd.Read())
            {
                Console.WriteLine("{0} - {1} - {2}", rd.GetString(0), rd.GetValue(1), rd.GetValue(2));
            }
            rd.Close();
            cn.Close();
        }
        public static void SalesByTerritory()
        {
            var cn = new SqlConnection(cns);
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandText = "SELECT TOP 5 COUNT([Order Details].OrderID) AS Sales, Territories.TerritoryDescription FROM Orders INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN EmployeeTerritories ON Employees.EmployeeID = EmployeeTerritories.EmployeeID INNER JOIN Territories ON EmployeeTerritories.TerritoryID = Territories.TerritoryID GROUP BY Territories.TerritoryDescription ORDER BY Sales DESC";
            cn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Console.Clear();
            Console.WriteLine("Territory - Number of Sales\n----------------------------------");
            while (rd.Read())
            {
                Console.WriteLine("{0} - {1}", rd.GetString(1).Trim(), rd.GetValue(0));
            }
            rd.Close();
            cn.Close();
        }
        public static void EmployeesPerRegion()
        {
            var cn = new SqlConnection(cns);
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandText = "SELECT r.RegionDescription, COUNT(e.EmployeeID) FROM Employees e INNER JOIN EmployeeTerritories et ON e.EmployeeID = et.EmployeeID INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID INNER JOIN Region r ON t.RegionID = r.RegionID GROUP BY r.RegionDescription";
            cn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Console.Clear();
            Console.WriteLine("Region - Number of Employees\n----------------------------------");
            while (rd.Read())
            {
                Console.WriteLine("{0} - {1}", rd.GetString(0).Trim(), rd.GetValue(1));
            }
            rd.Close();
            cn.Close();
        }
        public static void OrdersPerEmployee()
        {
            var cn = new SqlConnection(cns);
            SqlCommand cmd = cn.CreateCommand();
            cmd.CommandText = "SELECT e.FirstName + ' ' + e.LastName, COUNT(o.OrderID) FROM Employees e INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID GROUP BY e.LastName, e.FirstName";
            cn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Console.Clear();
            Console.WriteLine("Name - Number of orders\n----------------------------------");
            while (rd.Read())
            {
                Console.WriteLine("{0} - {1}", rd.GetString(0), rd.GetValue(1));
            }
            rd.Close();
            cn.Close();
            
        }
        public static void CustomersWithNamesLongerThan25Characters()
        {
            using (var db = new NORTHWNDContext())
            {
                Console.Clear();
                Console.WriteLine("Company name longer than 25 characters\n---------------------------------");
                var select = db.Customers.Where(x => x.CompanyName.Length > 25).Select(x => x.CompanyName);
                foreach (var companyName in select)
                {
                    Console.WriteLine(companyName);
                }
            }
        }
    }
}
