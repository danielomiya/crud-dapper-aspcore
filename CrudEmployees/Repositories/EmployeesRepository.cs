using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CrudEmployees.Models;
using Dapper;

namespace CrudEmployees.Repositories
{
    public class EmployeesRepository : IRepository<Employee>
    {
        private const string TableName = "Employees";
        protected readonly string ConnectionString;

        public EmployeesRepository(string connectionString)
        {
            ConnectionString = connectionString;
        }

        protected virtual IDbConnection Connection => new SqlConnection(ConnectionString);

        public IEnumerable<Employee> GetAll()
        {
            using (var connection = Connection)
            {
                return connection.Query<Employee>($"SELECT Id, Name, Phone, Rg, Cpf, RegistrationNumber FROM {TableName}");
            }
        }

        public Employee GetById(int id)
        {
            using (var connection = Connection)
            {
                return connection.QueryFirstOrDefault<Employee>($"SELECT * FROM {TableName} WHERE Id=@Id",
                    new { Id = id });
            }
        }

        public void Create(Employee employee)
        {
            using (var connection = Connection)
            {
                connection.Execute(
                    $"INSERT INTO {TableName}(Name, Address, Phone, Birthday, Admission, Rg, Cpf, RegistrationNumber, Education) VALUES(@Name, @Address, @Phone, @Birthday, @Admission, @Rg, @Cpf, @RegistrationNumber, @Education)",
                    employee);
            }
        }

        public void Update(Employee employee)
        {
            using (var connection = Connection)
            {
                connection.Execute(
                    $"UPDATE {TableName} SET Name=@Name, Address=@Address, Phone=@Phone, Birthday=@Birthday, Admission=@Admission, Rg=@Rg, Cpf=@Cpf, RegistrationNumber=@RegistrationNumber, Education=@Education WHERE Id=@Id",
                    employee);
            }
        }

        public void Delete(Employee employee)
        {
            Delete(employee.Id);
        }

        public void Delete(int id)
        {
            using (var connection = Connection)
            {
                connection.Execute($"DELETE FROM {TableName} WHERE Id=@Id", new { Id = id });
            }
        }
    }
}
