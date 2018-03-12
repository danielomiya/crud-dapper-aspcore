using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using CrudEmployees.Validations;

namespace CrudEmployees.Models
{
    public class Employee
    {
        [Display(Name = "ID"), Key]
        public int Id { get; set; }

        [Display(Name = "Nome"), MaxLength(100), Required]
        public string Name { get; set; }

        [Display(Name = "Endereço"), MaxLength(200), Required]
        public string Address { get; set; }

        [Display(Name = "Telefone"), Phone, MaxLength(20), Required]
        public string Phone { get; set; }

        [Display(Name = "Nascimento"), BirthDay(14), DataType(DataType.Date),
         DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime Birthday { get; set; }

        [Display(Name = "Admissão"), DataType(DataType.Date),
         DatabaseGenerated(DatabaseGeneratedOption.Identity),
         DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime Admission { get; set; } = DateTime.Today;

        [Display(Name = "RG"), MaxLength(20), Required]
        public string Rg { get; set; }

        [Display(Name = "CPF"), MaxLength(14), Required]
        public string Cpf { get; set; }

        [Display(Name = "Matrícula"), MaxLength(20), Required]
        public string RegistrationNumber { get; set; }

        [Display(Name = "Formação")]
        public string Education { get; set; }

        [NotMapped]
        [Display(Name = "Idade")]
        public int Age => (DateTime.Today - Birthday).Days / 365;
    }
}
