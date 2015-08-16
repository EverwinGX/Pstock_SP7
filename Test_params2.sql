/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN]
@cle int,
@N_user int,
@P1 varchar(100),
@P2 varchar(100),
@msg_err varchar(255) OUTPUT,
@msg_OK varchar(255) OUTPUT,
@Ouverture_Fiche int OUTPUT,
@Type_Fiche int OUTPUT,
@N_fiche int OUTPUT,
@Plusieurs_Fiches int OUTPUT,
@Choix_Before int,
@Param0 varchar (200), 
@Param1 varchar (200),
@Param2 varchar (200),
@Param3 varchar (200),
@Param4 varchar (200),
@Param5 varchar (200),
@Param6 varchar (200),
@Param7 varchar (200),
@Param8 varchar (200)
AS
/*-----------------Pour information V7-----------------
 
Paramètres du Magic-Button :
1:	$DB = Alias de la base de données renvoyé par Genesys
2:	$N = Clé primaire la fiche en cours renvoyé par Genesys
3:	$USER = N_user renvoyé par Genesys
4:	$HANDLE = [Ne fonctionne qu'avec la V11]
			  Handle de la fiche en cours renvoyé 
			  par Genesys => mise à jour de la fiche
			  qui a lancé la procédure
	0 = Pas de mise à jour de fiche ou pas de Handle
5:	Nom de la procédure stockée :
	- Si une Procédure de même nom mais avec en fin "_BEFORE" existe dans la base
	 celle-ci sera appelée avant. Pour la création de cette Procédure, il faut reprendre
	 les procédures BEFORE_OPEN de GENEsys en remplaçant le @N_... par @Cle )	
6:  1 = Affichage d'un message d'attente
	0 = Pas de message d'attente
7:  1 = Affichage d'un message de retour
	0 = Pas d'Affichage d'un message de retour
8:  1 = Pas de mise à jour de fiche appelante
	0 = Pas de mise à jour de fiche appelante
9:  WM_OPEN= 0
10:  Paramètre 1 Perso pour la procédure stockée
11:  Paramètre 2 Perso pour la procédure stockée
C:\Program Files\GENEsys\GENESYS_SP7.exe
Exemple: $DB $N $USER $HANDLE EGXS_SP_TEST_PARAMS2_BTN 0 1 1 0 

Paramètres de sortie de la procédure
@msg_OK          : Message à retourner en cas de succes de la procédure
					ATTENTION : Si la valeur de retour de @msg_OK est égal à '' alors il n'y aura pas de message					
@msg_err         : Message à retourner en cas d'échec de la procédure
					ATTENTION : Si la valeur de retour de @msg_err est égal à '' alors il n'y aura pas de message	
@Ouverture_Fiche :  1 = Ouverture d'une fiche de genesys
					0 = Pas d'ouverture de fiche 
@Type_Fiche      :  Type de la fiche à ouvrir :
					  CLIENT   = 0
					  CONTACT  = 1
					  PROJET   = 2
					  BL       = 3
					  CDE_CLI  = 4
					  FACT_CLI = 5
					  FOURNISS = 6
					  CONTFN   = 7
					  ORDREF   = 8
					  RF       = 9
					  STOCK    = 10
					  BR       = 11
					  CDE_FOUR = 12
					  FAC_FOUR = 13
					  TRESO    = 14
					  ITC      = 15

					  FCT_BASE = 17
					  PRODUIT  = 18
					  STAT     = 19
					  AFFAIRE  = 20
					  COMPTA   = 21
					  INVENTAIRE = 22
					  DEVIS      = 23
					  ABONNEMENT = 24
					  PLANNING = 25
					  TODO = 26
@N_fiche         :	Clé primaire de la fiche à ouvrir de la fiche à ouvrir
@Plusieurs_Fiches : 0 = 1 fiche a été créée
					1 = Plusieurs fiches ont été créées
					- Si une Procédure de même nom mais avec en fin "LISTE_FICHES" existe dans la base
					 celle-ci sera appelée après la procédure pour retourner la liste des fiches générées	
					- Si une Procédure de même nom mais avec en fin "BEFORE_FICHE" existe dans la base
					 celle-ci sera appelée après la procédure pour demander si l'on veut ouvrir les fiches 
					 généres. Pour la création de cette Procédure, il faut reprendre
					 les procédures BEFORE_OPEN de GENEsys en remplaçant le @N_... par @Cle )	
@Choix_Before : 		1 = OK
				2 = Annuler
				3 = Abandonner
				4 = Réessayer
				5 = Ignorer
				6 = Oui
				7 = Non

-----------------------------------------------------*/

BEGIN
SET NOCOUNT ON;


--fiche à ouvrir
SET @Ouverture_Fiche=0
SET @Type_Fiche=0
SET @N_fiche=0
SET @Plusieurs_Fiches=0

SET @msg_OK=@Param4
SET @msg_err=''

--Quitte la procédure si l'utilisateur annule
IF @Choix_Before in (2,3,7)
BEGIN
	GOTO Fin
END

Fin:
RETURN(0)

END

GO

/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN_BEFORE]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN_BEFORE]
@cle int,
@N_user int

AS

BEGIN

-- result = 0 alors erreur / result = 1 alors OK
-- si Msg <> '' alors on affiche.

/*
  { MessageBox() Flags }
  MB_OK = $00000000;
  MB_OKCANCEL = $00000001;
  MB_ABORTRETRYIGNORE = $00000002;
  MB_YESNOCANCEL = $00000003;
  MB_YESNO = $00000004;
  MB_RETRYCANCEL = $00000005;

  MB_ICONHAND = $00000010;
  MB_ICONQUESTION = $00000020;
  MB_ICONEXCLAMATION = $00000030;
  MB_ICONASTERISK = $00000040;
  MB_USERICON = $00000080;
  MB_ICONWARNING                 = MB_ICONEXCLAMATION;
  MB_ICONERROR                   = MB_ICONHAND;
  MB_ICONINFORMATION             = MB_ICONASTERISK;
  MB_ICONSTOP                    = MB_ICONHAND;

  MB_DEFBUTTON1 = $00000000;
  MB_DEFBUTTON2 = $00000100;
  MB_DEFBUTTON3 = $00000200;
  MB_DEFBUTTON4 = $00000300;

  MB_APPLMODAL = $00000000;
  MB_SYSTEMMODAL = $00001000;
  MB_TASKMODAL = $00002000;
  MB_HELP = $00004000;                          { Help Button }

  MB_NOFOCUS = $00008000;
  MB_SETFOREGROUND = $00010000;
  MB_DEFAULT_DESKTOP_ONLY = $00020000;

  MB_TOPMOST = $00040000;
  MB_RIGHT = $00080000;
  MB_RTLREADING = $00100000;

  MB_SERVICE_NOTIFICATION = $00200000;
  MB_SERVICE_NOTIFICATION_NT3X = $00040000;

  MB_TYPEMASK = $0000000F;
  MB_ICONMASK = $000000F0;
  MB_DEFMASK = $00000F00;
  MB_MODEMASK = $00003000;
  MB_MISCMASK = $0000C000;
*/

DECLARE 
	@index INT 
	,@n_Client  varchar (100)
	
SET @index=0
WHILE @index< 100
BEGIN
	SET @index = @index + 1
	
	SELECT 
		@n_Client=c.Nom
	FROM ville c
	
END
SELECT Result = 1, Msg = 'fin', Caption = 'Information ', Flags = 36

END















GO

/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2]
@cle int,
@N_user int,
@P1 varchar(100),
@P2 varchar(100),
@Choix_Before INT,
@ID_Session varchar (100),
@ID_Session_Temp varchar (100),
@Field_Name_Refresh varchar (100) -- Si <> '' alors cas du rafraichissement
AS
BEGIN

DECLARE 
	@Caption varchar (50),
	@Administrateur varchar (3),
	@TypeFiche INT,
	@N_Fiche INT,
	@N_Detail INT,
	@Nom_PS varchar (100),
	@N_Resizer INT,
	@ColorFond INT,
	@Top_Most INT, -- Si A 1 alors la fenetre param prend le premier plan sur windows
	@Timer INT, -- Si Timer >0 alors durée de vie de la fenetre Param ( objectif est de ne empiler les Applis bloquees sur cette fenetre )
	@N_Params INT 
	
IF @Choix_Before in (2,3,7) AND @Field_Name_Refresh=''
BEGIN
	RETURN
END	

SELECT 
	@TypeFiche = 120
	,@N_Fiche = ISNULL(@cle,0)
	,@N_Detail = 0
	,@Nom_PS = 'TEST_PARAMS2_BTN'

/*                                                                 
------------------------------------------------
 * Appui sur bouton
------------------------------------------------
*/
IF @Field_Name_Refresh like'Param12%'
BEGIN
	/*                                                                 
	------------------------------------------------
	 * Une sauvegarde est en attente et l'utilisateur a dit OK
	------------------------------------------------
	*/
	IF @Field_Name_Refresh='Param12-Validate'
	BEGIN
		IF @Choix_Before in (1,6)  
		BEGIN		
			SELECT Btn_Action='[OK][REFRESH]',Field_Name_Refresh='Param12'
			RETURN
		END	
		ELSE
		BEGIN
			SELECT Btn_Action='[CANCEL][REFRESH]',Field_Name_Refresh='Param12'
			RETURN		
		END	
	END
	

	SET @N_Fiche=@N_Fiche+1
	
END

/*                                                                 
------------------------------------------------
 * Gestion du resizer
------------------------------------------------
*/
SET @N_Resizer=ISNULL((SELECT t.N_Resizer
                  FROM EGXS_TB_CFG_PARAMS2_RESIZER T WHERE t.Nom_PS=@Nom_PS),0)
IF ISNULL(@N_Resizer,0)=0
BEGIN
	INSERT INTO EGXS_TB_CFG_PARAMS2_RESIZER
	  (
	    Nom_PS
	  )
	  SELECT 
		Nom_PS=@Nom_PS
	
	SET @N_Resizer=SCOPE_IDENTITY()  
END

/*                                                                 
------------------------------------------------
 * Création des lignes 
------------------------------------------------
*/
INSERT INTO EGXS_TB_TEST_PARAMS2_BTN_PARAMS2
  (
    TypeFiche
   ,N_Fiche
   ,N_Detail
   ,N_Modele
   ,Field_Name
   ,Field_Index
   ,Field_Form
  )
SELECT 
	TypeFiche = @TypeFiche
   ,N_Fiche = @N_Fiche
   ,N_Detail = @N_Detail
   ,t.N_Modele
   ,t.Field_Name
   ,t.Field_Index
   ,t.Field_Form
FROM 
(
	SELECT  N_Modele=0,Field_Name='Param0',Field_Index=0,Field_Form=1 UNION ALL
	SELECT  N_Modele=1,Field_Name='Param1',Field_Index=1,Field_Form=2 UNION ALL
	SELECT  N_Modele=2,Field_Name='Param2',Field_Index=2,Field_Form=3 UNION ALL
	SELECT  N_Modele=3,Field_Name='Param3',Field_Index=3,Field_Form=4 UNION ALL
	SELECT  N_Modele=4,Field_Name='Param4',Field_Index=4,Field_Form=5 UNION ALL
	SELECT  N_Modele=5,Field_Name='Param5',Field_Index=5,Field_Form=6 UNION ALL
	SELECT  N_Modele=6,Field_Name='Param6',Field_Index=6,Field_Form=7 UNION ALL
	SELECT  N_Modele=7,Field_Name='Param7',Field_Index=7,Field_Form=8 UNION ALL
	SELECT  N_Modele=8,Field_Name='Param8',Field_Index=8,Field_Form=9 UNION ALL
	SELECT  N_Modele=9,Field_Name='Param9',Field_Index=9,Field_Form=10 UNION ALL
	SELECT  N_Modele=10,Field_Name='Param10',Field_Index=10,Field_Form=11 UNION ALL
	SELECT  N_Modele=8,Field_Name='Param11',Field_Index=11,Field_Form=12 UNION ALL
	SELECT  N_Modele=8,Field_Name='Param12',Field_Index=12,Field_Form=13   UNION ALL
	SELECT  N_Modele=10,Field_Name='Param80',Field_Index=13,Field_Form=11
	
) AS T
WHERE NOT EXISTS (SELECT t2.N_Params
                    FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 T2 WHERE ISNULL(T2.TypeFiche,0)=ISNULL(@TypeFiche,0) AND ISNULL(T2.N_Fiche,0)=ISNULL(@N_Fiche,0) AND T2.Field_Name = T.field_Name)


/*                                                                 
------------------------------------------------
 * Initialisation de la table Temp
------------------------------------------------
*/
INSERT INTO EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP
  (
    N_Params
   ,DateCreate
   ,UserCreate
   ,Field_Name
   ,ID_Session_Temp
   ,Field_Value
   ,Field_Value_Txt
   ,Field_Value_Num
   ,Field_Value_Date
  )
SELECT 
    N_Params=t.N_Params
   ,DateCreate=GETDATE()
   ,UserCreate=@N_user
   ,Field_Name =t.Field_Name
   ,ID_Session_Temp=@ID_Session_Temp
   ,Field_Value=t.Field_Value
   ,Field_Value_Txt=t.Field_Value_Txt
   ,Field_Value_Num=t.Field_Value_Num
   ,Field_Value_Date=t.Field_Value_Date
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 T
WHERE T.TypeFiche = @TypeFiche
AND T.N_Fiche = @N_Fiche
AND T.N_Detail = @N_Detail
AND NOT EXISTS(SELECT tp.N_Params_Temp
                 FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP Tp WHERE tp.N_Params=t.N_Params AND tp.ID_Session_Temp=@ID_Session_Temp)


UPDATE T 
	SET T.Field_Value_Date = null
	,T.Field_Value = NULL
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP T
WHERE t.ID_Session_Temp=@ID_Session_Temp AND t.Field_Name='Param4'

UPDATE T 
	SET t.Rzr_List = '10;20;30;40'
	,t.Rzr_RefreshOnChange = 'Oui'
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP t
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = t.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
WHERE t.ID_Session_Temp =@ID_Session_Temp
AND t.Field_Name='Param10'

UPDATE T 
	SET t.Rzr_Item_Visible = 'Oui'
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP t
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = t.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
WHERE t.ID_Session_Temp =@ID_Session_Temp
AND t.Field_Name<>'Param80'

UPDATE T 
	SET t.Rzr_Item_Visible = 'Oui'
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP t
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = t.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
WHERE t.ID_Session_Temp =@ID_Session_Temp
AND t.Field_Name='Param80'

UPDATE T 
	SET t.Rzr_List = CASE t2.Field_Value_Txt WHEN '10' THEN '11;12;13;14;15' WHEN '20' THEN '21;22;23;24;25' ELSE '' END
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP t
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = t.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
LEFT OUTER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP t2 ON t2.ID_Session_Temp=@ID_Session_Temp AND T2.Field_Name='Param10'
WHERE t.ID_Session_Temp =@ID_Session_Temp
AND t.Field_Name='Param80'

UPDATE tp 
	SET tp.Rzr_Result =''
	,tp.Rzr_RefreshOnChange = 'Non'
	,tp.Rzr_ImgIdx = 1100
	,tp.Rzr_Validate='Oui'
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP tp
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = tp.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
WHERE tp.ID_Session_Temp=@ID_Session_Temp AND tp.Field_Name='Param12'

UPDATE tp 
	SET tp.Rzr_Obligatoire = 'Oui'
	,tp.Rzr_TxtColorFond = 0
	,tp.Rzr_TxtFonteTaille = 0
	,tp.Rzr_TxtFonte = ''
	,tp.Rzr_TxtColorTexte = 0
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP tp
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = tp.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
WHERE tp.ID_Session_Temp=@ID_Session_Temp 
AND tm.Field_Form NOT IN (13)


UPDATE tp 
	SET Rzr_Validate = 'Oui'
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP tp
INNER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = tp.N_Params AND tm.TypeFiche=@TypeFiche AND tm.N_Fiche=@N_Fiche AND tm.N_Detail=@N_Detail
WHERE tp.ID_Session_Temp=@ID_Session_Temp AND tp.Field_Name='Param5'

SELECT
	@Caption = 'Parametres'
	,@ColorFond = 16777215
	,@Top_Most = 0
	,@Timer = 0
	
	
SELECT 
	Administrateur = 'Oui'
   ,N_resizer = @N_Resizer
   ,Caption = @Caption
   ,@ColorFond
   
   ,t.N_Params
   ,t.TypeFiche
   ,t.N_Fiche
   ,t.N_Detail
   ,t.N_Modele
   ,t.Field_Name
   ,t.Field_Index
   ,t.Field_Form
   ,t.Field_Value
   ,tp.*
   
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 T
LEFT OUTER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP tp ON tp.N_Params = T.N_Params AND tp.ID_Session_Temp=@ID_Session_Temp 
WHERE ISNULL(T.TypeFiche,0)=ISNULL(@TypeFiche,0) AND ISNULL(t.N_Fiche,0)=ISNULL(@N_Fiche,0)
ORDER BY T.Field_Index


END



GO

/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_AFTER]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_AFTER]
@cle int,
@N_user int,
@P1 varchar(100),
@P2 varchar(100),
@Choix_Before int,
@Param0 varchar (200) OUTPUT, 
@Param1 varchar (200) OUTPUT,
@Param2 varchar (200) OUTPUT,
@Param3 varchar (200) OUTPUT,
@Param4 varchar (200) OUTPUT,
@Param5 varchar (200) OUTPUT,
@Param6 varchar (200) OUTPUT,
@Param7 varchar (200) OUTPUT,
@Param8 varchar (200) OUTPUT,
@ID_Session varchar (100),
@ID_Session_Temp varchar (100)
AS
BEGIN

/*                                                                 
------------------------------------------------
 * Récupération des paramètres qui seront retournés aux autres PS
------------------------------------------------
*/
SELECT
	@Param0 = CASE WHEN t.Field_Name = 'Param0' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param0 END
	,@Param1 = CASE WHEN t.Field_Name = 'Param1' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param1 END
	,@Param2 = CASE WHEN t.Field_Name = 'Param2' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param2 END
	,@Param3 = CASE WHEN t.Field_Name = 'Param3' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param3 END
	,@Param4 = CASE WHEN t.Field_Name = 'Param4' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param4 END
	,@Param5 = CASE WHEN t.Field_Name = 'Param5' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param5 END
	,@Param6 = CASE WHEN t.Field_Name = 'Param6' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param6 END
	,@Param7 = CASE WHEN t.Field_Name = 'Param7' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param7 END
	,@Param8 = CASE WHEN t.Field_Name = 'Param8' THEN CAST(t.Field_Value AS varchar (200)) ELSE @Param8 END
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP T
WHERE t.ID_Session_Temp=@ID_Session_Temp AND t.Field_Name LIKE 'Param%'


/*                                                                 
------------------------------------------------
 * Vide la table temporaire
------------------------------------------------
*/
DELETE FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP WHERE ID_Session_Temp=@ID_Session_Temp


END














GO

/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_CLOSE]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_CLOSE]
@cle int,
@N_user int,
@P1 varchar(100),
@P2 varchar(100),
@Choix_Before int,
@Param0 varchar (200), 
@Param1 varchar (200),
@Param2 varchar (200),
@Param3 varchar (200),
@Param4 varchar (200),
@Param5 varchar (200),
@Param6 varchar (200),
@Param7 varchar (200),
@Param8 varchar (200),
@ID_Session varchar (100),
@ID_Session_Temp varchar (100)
AS
BEGIN
/*                                                                  
================================================
 * Procédure appelé systématiquemtn même si l'utilisateur annule
================================================
*/

/*                                                                 
------------------------------------------------
 * Vide la table temporaire
------------------------------------------------
*/
DELETE FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP WHERE ID_Session_Temp=@ID_Session_Temp


END














GO

/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_CONTROL]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_CONTROL]
@cle int,
@N_user int,
@P1 varchar(100),
@P2 varchar(100),
@Choix_Before int,
@ID_Session varchar (100),
@ID_Session_Temp varchar (100),
@Field_Name_Refresh varchar (100)
AS

BEGIN

DECLARE 
	@Msg_oblig varchar(8000)

/*                                                                 
------------------------------------------------
 * Champ obligatoire
------------------------------------------------
*/
SELECT TOP 1
	@Msg_oblig = '{'+ISNULL(t.Field_Name,'')+'}' + ' est obligatoire'
FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP T
LEFT OUTER JOIN EGXS_TB_TEST_PARAMS2_BTN_PARAMS2 tm ON tm.N_Params = T.N_Params
WHERE t.ID_Session_Temp = @ID_Session_Temp AND ISNULL(t.Rzr_Obligatoire,'Non')='Oui'
AND ISNULL(t.Field_Value,'')=''
ORDER BY tm.Field_Index


/*                                                                 
------------------------------------------------
 * Pas de fermeture + Refresh
------------------------------------------------
*/
IF ISNULL(@Msg_oblig,'')<>''
BEGIN
	SELECT Result = 2, Msg = cast(@Msg_oblig AS varchar (100)), Caption = CAST('Information ' AS varchar (100)), Flags = 16
	RETURN
END

SELECT Result = 1, Msg = cast(''AS varchar (100)), Caption = CAST('Information ' AS varchar (100)), Flags = 64

END















GO

/****** Object:  StoredProcedure [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_VALIDATE]    Script Date: 02/07/2015 10:40:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[EGXS_SP_TEST_PARAMS2_BTN_PARAMS2_VALIDATE]
@cle int,
@N_user int,
@P1 varchar(100),
@P2 varchar(100),
@ID_Session varchar (100),
@ID_Session_Temp varchar (100),
@Field_Name_Refresh varchar (100),
@Value varchar(MAX) 
AS
BEGIN

IF @Field_Name_Refresh='Param12'
BEGIN
	IF EXISTS(SELECT t.N_Params_Temp
				FROM EGXS_TB_TEST_PARAMS2_BTN_PARAMS2_TEMP t WHERE t.ID_Session_Temp=@ID_Session_Temp AND ISNULL(t.Field_Update,'Non')='Oui')
	BEGIN
		SELECT Result = 2, Msg = CAST('Voulez vous sauvegardez' AS varchar (100)), Caption = CAST('Information ' AS varchar (100)), Flags = 36
		RETURN 

	END	
	ELSE
	BEGIN
		SELECT Result = 2, Msg = CAST('' AS varchar (100)), Caption = CAST('Information ' AS varchar (100)), Flags = 64
	END
END

IF @Field_Name_Refresh='Param5'
BEGIN
	IF CAST(@Value AS INT) NOT BETWEEN 1 AND 100
	BEGIN
		SELECT Result = 0, Msg = CAST('Saisie non conforme' AS varchar (100)), Caption = CAST('Erreur ' AS varchar (100)), Flags = 16
		RETURN 
	END	
	
END

IF @Field_Name_Refresh='CLOSE'
BEGIN
	
	SELECT Result = 2, Msg = CAST('Fermeture impossible' AS varchar (100)), Caption = CAST('Erreur ' AS varchar (100)), Flags = 16
	RETURN	 

END

SELECT Result = 1, Msg = CAST('' AS varchar (100)), Caption = CAST('Information ' AS varchar (100)), Flags = 64

END


GO


