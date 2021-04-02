using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Bibliotheque.BOL
{
    public partial class Pret : EntityBase
    {
        [Required(ErrorMessage ="Le numéro de l'adrérent est obligatoire pour un prêt.")]
        public string IdAdherent { get; set; }
        [Required(ErrorMessage = "Le numéro de l'exemplaire du livre est obligatoire pour un prêt.")]
        public int IdExemplaire { get; set; }
        [Required(ErrorMessage ="La date du prêt doit être renseignée.")]
        public DateTime DateEmprunt { get; set; }
        public DateTime? DateRetour { get; set; }

        public virtual Adherent IdAdherentNavigation { get; set; }
        public virtual Exemplaire IdExemplaireNavigation { get; set; }
    }
}
