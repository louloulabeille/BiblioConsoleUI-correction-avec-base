﻿using System;
using System.Collections.Generic;

namespace Bibliotheque.BOL
{
    public partial class Categorie : EntityBase
    {
        public int IdCategorie { get; set; }
        public string LibelleCategorie { get; set; }
    }
}
