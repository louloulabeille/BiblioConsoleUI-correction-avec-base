USE [Bibliotheque]
GO
/****** Object:  StoredProcedure [dbo].[Adherent_Delete]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.Adherent
-- =============================================

CREATE procedure [dbo].[Adherent_Delete]
(
@IdAdherent AS nchar(10)
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[Adherent]
WHERE
IdAdherent=@IdAdherent
END
GO
/****** Object:  StoredProcedure [dbo].[Adherent_Insert]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.Adherent
-- =============================================

CREATE procedure [dbo].[Adherent_Insert]
(
@IdAdherent AS nchar(10),
@NomAdherent AS nvarchar(50),
@PrenomAdherent AS nvarchar(50)=null
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[Adherent]
(
IdAdherent,
NomAdherent,
PrenomAdherent
)
VALUES
(
@IdAdherent,
@NomAdherent,
@PrenomAdherent	
)

SELECT @IdAdherent = IdAdherent,
@NomAdherent = NomAdherent,
@PrenomAdherent = PrenomAdherent FROM [dbo].[Adherent]
Where @IdAdherent = IdAdherent
END
GO
/****** Object:  StoredProcedure [dbo].[Adherent_Update]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.Adherent
-- =============================================
CREATE procedure [dbo].[Adherent_Update]
(
@IdAdherent AS nchar(10),
@NomAdherent AS nvarchar(50),
@PrenomAdherent AS nvarchar(50)=null
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[Adherent]
SET
NomAdherent=@NomAdherent,
PrenomAdherent=@PrenomAdherent
WHERE
IdAdherent=@IdAdherent
END
GO
/****** Object:  StoredProcedure [dbo].[Exemplaire_Delete]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.Exemplaire
-- =============================================

CREATE procedure [dbo].[Exemplaire_Delete]
(
@IdExemplaire AS int
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[Exemplaire]
WHERE
IdExemplaire=@IdExemplaire
END
GO
/****** Object:  StoredProcedure [dbo].[Exemplaire_Insert]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.Exemplaire
-- =============================================

CREATE procedure [dbo].[Exemplaire_Insert]
(
@IdExemplaire AS int OUT,
@Empruntable AS bit,
@ISBN AS nchar(10)
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[Exemplaire]
(
Empruntable,
ISBN
)
VALUES
(
@Empruntable,
@ISBN	
)
SET @IdExemplaire = SCOPE_IDENTITY() 

SELECT @IdExemplaire = IdExemplaire,
@Empruntable = Empruntable,
@ISBN = ISBN FROM [dbo].[Exemplaire]
Where @IdExemplaire = IdExemplaire
END
GO
/****** Object:  StoredProcedure [dbo].[Exemplaire_Update]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.Exemplaire
-- =============================================
CREATE procedure [dbo].[Exemplaire_Update]
(
@IdExemplaire AS int,
@Empruntable AS bit,
@ISBN AS nchar(10)
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[Exemplaire]
SET
Empruntable=@Empruntable,
ISBN=@ISBN
WHERE
IdExemplaire=@IdExemplaire
END
GO
/****** Object:  StoredProcedure [dbo].[Livre_Delete]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.Livre
-- =============================================

CREATE procedure [dbo].[Livre_Delete]
(
@ISBN AS nchar(10)
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[Livre]
WHERE
ISBN=@ISBN
END
GO
/****** Object:  StoredProcedure [dbo].[Livre_Insert]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.Livre
-- =============================================

CREATE procedure [dbo].[Livre_Insert]
(
@ISBN AS nchar(10),
@Titre AS nvarchar(150)
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[Livre]
(
ISBN,
Titre
)
VALUES
(
@ISBN,
@Titre	
)

SELECT @ISBN = ISBN,
@Titre = Titre FROM [dbo].[Livre]
Where @ISBN = ISBN
END
GO
/****** Object:  StoredProcedure [dbo].[Livre_Update]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.Livre
-- =============================================
CREATE procedure [dbo].[Livre_Update]
(
@ISBN AS nchar(10),
@Titre AS nvarchar(150)
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[Livre]
SET
Titre=@Titre
WHERE
ISBN=@ISBN
END
GO
/****** Object:  StoredProcedure [dbo].[Pret_Delete]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.Pret
-- =============================================

CREATE procedure [dbo].[Pret_Delete]
(
@IdAdherent AS nchar(10),
@IdExemplaire AS int,
@DateEmprunt AS date
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[Pret]
WHERE
IdAdherent=@IdAdherent AND IdExemplaire=@IdExemplaire AND DateEmprunt=@DateEmprunt
END
GO
/****** Object:  StoredProcedure [dbo].[Pret_Insert]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.Pret
-- =============================================

CREATE procedure [dbo].[Pret_Insert]
(
@IdAdherent AS nchar(10),
@IdExemplaire AS int,
@DateEmprunt AS date,
@DateRetour AS date=null
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[Pret]
(
IdAdherent,
IdExemplaire,
DateEmprunt,
DateRetour
)
VALUES
(
@IdAdherent,
@IdExemplaire,
@DateEmprunt,
@DateRetour	
)

SELECT @IdAdherent = IdAdherent,
@IdExemplaire = IdExemplaire,
@DateEmprunt = DateEmprunt,
@DateRetour = DateRetour FROM [dbo].[Pret]
Where @IdAdherent = IdAdherent AND @IdExemplaire = IdExemplaire AND @DateEmprunt = DateEmprunt
END
GO
/****** Object:  StoredProcedure [dbo].[Pret_Update]    Script Date: 08/02/2020 21:54:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: dimanche 22 septembre 2019
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.Pret
-- =============================================
CREATE procedure [dbo].[Pret_Update]
(
@IdAdherent AS nchar(10),
@IdExemplaire AS int,
@DateEmprunt AS date,
@DateRetour AS date=null
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[Pret]
SET
DateRetour=@DateRetour
WHERE
IdAdherent=@IdAdherent AND IdExemplaire=@IdExemplaire AND DateEmprunt=@DateEmprunt
END
GO
