using System.Collections.Generic;

namespace CrudEmployees.Repositories
{
    internal interface IRepository<T>
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        void Create(T t);
        void Update(T t);
        void Delete(T t);
    }
}
