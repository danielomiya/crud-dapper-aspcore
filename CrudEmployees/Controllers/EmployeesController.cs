using System;
using CrudEmployees.Models;
using CrudEmployees.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace CrudEmployees.Controllers
{
    [Route("Funcionarios")]
    public class EmployeesController : Controller
    {
        private readonly EmployeesRepository _repository;

        public EmployeesController(IConfiguration configuration)
        {
            _repository = new EmployeesRepository(configuration.GetConnectionString("Default"));
        }

        // GET: Funcionarios
        public ActionResult Index()
        {
            return View(_repository.GetAll());
        }

        // GET: Funcionarios/Detalhes/5
        [Route("Detalhes/{id}")]
        public ActionResult Details(int id)
        {
            return View(_repository.GetById(id));
        }

        // GET: Funcionarios/Criar
        [Route("Cadastrar")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Funcionarios/Criar
        [HttpPost, Route("Cadastrar")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([FromForm] Employee employee)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    _repository.Create(employee);
                    return RedirectToAction(nameof(Index));
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError(String.Empty, e.Message);
            }

            return View(employee);
        }

        // GET: Funcionarios/Editar/5
        [Route("Editar/{id}")]
        public ActionResult Edit(int id)
        {
            return View(_repository.GetById(id));
        }

        // POST: Funcionarios/Editar/5
        [HttpPost, Route("Editar/{id}")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([FromRoute] int id, [FromForm] Employee employee)
        { 
            if (id != employee.Id)
                return BadRequest();

            var temp = _repository.GetById(id);

            if (temp == null)
                return NotFound();

            try
            {
                if (ModelState.IsValid)
                {
                    _repository.Update(employee);
                    return RedirectToAction(nameof(Index)); 
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError(string.Empty, e.Message);
            }

            return View(temp);
        }

        // GET: Funcionarios/Deletar/5
        [Route("Deletar/{id}")]
        public ActionResult Delete(int id)
        {
            return View(_repository.GetById(id));
        }

        // POST: Funcionarios/Deletar/5
        [HttpPost, Route("Deletar/{id}")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, Employee employee)
        {
            if (id != employee.Id)
                return BadRequest();

            if (_repository.GetById(id) == null)
                return NotFound();

            try
            {
                _repository.Delete(employee);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View(employee);
            }
        }
    }
}