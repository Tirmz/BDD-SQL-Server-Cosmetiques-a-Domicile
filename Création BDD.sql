/*==============================================================*/
/* Nom de SGBD :  Microsoft SQL Server 2008                     */
/* Date de création :  20/02/2014 15:59:10                      */
/*==============================================================*/


if exists (select 1
            from  sysindexes
           where  id    = object_id('CLIENTS')
            and   name  = 'APPARTIENT_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLIENTS.APPARTIENT_FK
go

alter table CLIENTS
   drop constraint PK_CLIENTS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTS')
            and   type = 'U')
   drop table CLIENTS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('COMMANDE')
            and   name  = 'PASSE_FK'
            and   indid > 0
            and   indid < 255)
   drop index COMMANDE.PASSE_FK
go

alter table COMMANDE
   drop constraint PK_COMMANDE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMMANDE')
            and   type = 'U')
   drop table COMMANDE
go

alter table COMPOSANT
   drop constraint PK_COMPOSANT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPOSANT')
            and   type = 'U')
   drop table COMPOSANT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSEILLERE')
            and   name  = 'FORMER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSEILLERE.FORMER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSEILLERE')
            and   name  = 'EMPLOIE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSEILLERE.EMPLOIE_FK
go

alter table CONSEILLERE
   drop constraint PK_CONSEILLERE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONSEILLERE')
            and   type = 'U')
   drop table CONSEILLERE
go

alter table CONTIENT
   drop constraint PK_CONTIENT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONTIENT')
            and   type = 'U')
   drop table CONTIENT
go

alter table FILIALE
   drop constraint PK_FILIALE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FILIALE')
            and   type = 'U')
   drop table FILIALE
go

alter table LABORATOIRE
   drop constraint PK_LABORATOIRE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LABORATOIRE')
            and   type = 'U')
   drop table LABORATOIRE
go

alter table PARTICIPE
   drop constraint PK_PARTICIPE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PARTICIPE')
            and   type = 'U')
   drop table PARTICIPE
go

alter table PATHOLOGIE
   drop constraint PK_PATHOLOGIE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PATHOLOGIE')
            and   type = 'U')
   drop table PATHOLOGIE
go

alter table POSSEDE
   drop constraint PK_POSSEDE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POSSEDE')
            and   type = 'U')
   drop table POSSEDE
go

alter table PREND
   drop constraint PK_PREND
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PREND')
            and   type = 'U')
   drop table PREND
go

alter table PREND_PART
   drop constraint PK_PREND_PART
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PREND_PART')
            and   type = 'U')
   drop table PREND_PART
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUITS')
            and   name  = 'CREE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUITS.CREE_FK
go

alter table PRODUITS
   drop constraint PK_PRODUITS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUITS')
            and   type = 'U')
   drop table PRODUITS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REUNION')
            and   name  = 'CATALOGUE_FK'
            and   indid > 0
            and   indid < 255)
   drop index REUNION.CATALOGUE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REUNION')
            and   name  = 'ACCUEILLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index REUNION.ACCUEILLE_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('REUNION')
            and   name  = 'ORGANISE_FK'
            and   indid > 0
            and   indid < 255)
   drop index REUNION.ORGANISE_FK
go

alter table REUNION
   drop constraint PK_REUNION
go

if exists (select 1
            from  sysobjects
           where  id = object_id('REUNION')
            and   type = 'U')
   drop table REUNION
go

alter table SASSOCIE
   drop constraint PK_SASSOCIE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SASSOCIE')
            and   type = 'U')
   drop table SASSOCIE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SEMINAIRE')
            and   name  = 'GERE_FK'
            and   indid > 0
            and   indid < 255)
   drop index SEMINAIRE.GERE_FK
go

alter table SEMINAIRE
   drop constraint PK_SEMINAIRE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEMINAIRE')
            and   type = 'U')
   drop table SEMINAIRE
go

alter table SOIGNE
   drop constraint PK_SOIGNE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SOIGNE')
            and   type = 'U')
   drop table SOIGNE
go

/*==============================================================*/
/* Table : CLIENTS                                              */
/*==============================================================*/
create table CLIENTS (
   ID_CLIENT            int                  not null,
   ID_CONSEILLERE      int                  not null,
   NOM_CLIENT           char(30)             not null,
   PRENOM_CLIENT        char(30)             not null,
   NUMEROTELEPHONEFIXE_CLIENT char(30)             not null,
   NUMERTELEPHONEPORTABLE_CLIENT char(30)             not null,
   EMAIL_CLIENT         char(30)             not null,
   ADRESSE1_CLIENT      char(30)             not null,
   ADRESSE2_CLIENT      char(30)             not null,
   CODEPOSTAL_CLIENT    char(30)             not null,
   VILLE_CLIENT         char(30)             not null,
   SEXE_CLIENT          bit                  not null,
   HOTE                 bit                  not null
   DATE_NAISSANCE_CLIENT char(30)					not null,
)
go

alter table CLIENTS
   add constraint PK_CLIENTS primary key nonclustered (ID_CLIENT)
go

/*==============================================================*/
/* Index : APPARTIENT_FK                                        */
/*==============================================================*/
create index APPARTIENT_FK on CLIENTS (
ID_CONSEILLERE ASC
)
go

/*==============================================================*/
/* Table : COMMANDE                                             */
/*==============================================================*/
create table COMMANDE (
   ID_CMDCLIENT         int                  not null,
   ID_CONSEILLERE      int                  not null,
   DATE_CMDCLIENT       datetime             not null,
   QUANTITE_CMDCLIENT   int                  not null,
   CODEPROMO_CMDCLIENT  int                  null
)
go

alter table COMMANDE
   add constraint PK_COMMANDE primary key nonclustered (ID_CMDCLIENT)
go

/*==============================================================*/
/* Index : PASSE_FK                                             */
/*==============================================================*/
create index PASSE_FK on COMMANDE (
ID_CONSEILLERE ASC
)
go

/*==============================================================*/
/* Table : COMPOSANT                                            */
/*==============================================================*/
create table COMPOSANT (
   ID_COMP              char(50)             not null,
   NOM_COMP             char(50)             null,
   NOMLATIN_COMP        char(50)             null,
   FAMILLE_COMP         char(30)             null
)
go

alter table COMPOSANT
   add constraint PK_COMPOSANT primary key nonclustered (ID_COMP)
go

/*==============================================================*/
/* Table : CONSEILLERE                                         */
/*==============================================================*/
create table CONSEILLERE (
   ID_CONSEILLERE      int                  not null,
   CON_ID_CONSEILLERE  int                  not null,
   NOM_SOCIETE_FILIALE  char(30)             not null,
   NOM_CONSEILLERE     char(30)             not null,
   PRENOM_CONSEILLERE  char(30)             not null,
   TEL_FIXE_CONSEILLERE varchar(15)             not null,
   TEL_PORTABLE_CONSEILLERE varchar(15)             not null,
   MAIL_CONSEILLERE    char(60)             not null,
   ADRESSE1_CONSEILLERE char(60)             not null,
   ADRESSE2_CONSEILLERE char(60)             not null,
   CODE_POSTAL_CONSEILLERE char(6)              not null,
   VILLE_CONSEILLERE   char(30)             not null,
   DATENAISSANCE_CONSEILLERE varchar(20)             not null,
   MARRAINE             bit                  not null
)
go

alter table CONSEILLERE
   add constraint PK_CONSEILLERE primary key nonclustered (ID_CONSEILLERE)
go

/*==============================================================*/
/* Table : MARRAINE                                             */
/*==============================================================*/
Create table Marraine (
	ID_MARRAINE	int			not null,
	ID_CONSEILLERE      int                  not null,
	PRIME_MARRAINE     int 				not null
)
alter table Marraine 
	add constraint PK_MARRAINE primary key nonclustered (ID_MARRAINE)
go

/*==============================================================*/
/* Index : EMPLOIE_FK                                           */
/*==============================================================*/
create index EMPLOIE_FK on CONSEILLERE (
NOM_SOCIETE_FILIALE ASC
)
go

/*==============================================================*/
/* Index : FORMER_FK                                            */
/*==============================================================*/
create index FORMER_FK on CONSEILLERE (
CON_ID_CONSEILLERE ASC
)
go

/*==============================================================*/
/* Table : CONTIENT                                             */
/*==============================================================*/
create table CONTIENT (
   REFERENCE_PRODUIT    char(8)              not null,
   ID_COMP              char(50)             not null
)
go

alter table CONTIENT
   add constraint PK_CONTIENT primary key (REFERENCE_PRODUIT, ID_COMP)
go

/*==============================================================*/
/* Table : FILIALE                                              */
/*==============================================================*/
create table FILIALE (
   NOM_SOCIETE_FILIALE  varchar(80)             not null,
   NOM_SOCIETEMERE_FILIALE varchar(80)             not null,
   DATE_CREATION_FILIALE date            not null,
   ADRESSE1_FILIALE     varchar(80)             not null,
   ADRESSE2_FILIALE     varchar(80)             not null,
   CODE_POSTAL_FILIALE  char(6)              not null,
   DIRECTEUR_LOCAL_FILIALE varchar(80)             not null,
   NOMBRE_CONSEILLERE_FILIALE int                  not null,
   NOMBRE_FORMATRICE_FILIALE int                  not null,
   TEL_FILIALE          varchar(80)             not null,
   FAX_FILIALE          varchar(80)             not null,
   MAIL_FILIALE         varchar(80)             not null,
   SECTEUR_FILIALE      varchar(80)             not null,
   VILLE_FILIALE        varchar(80)             not null
)
go

drop table filiale

alter table FILIALE
   add constraint PK_FILIALE primary key nonclustered (NOM_SOCIETE_FILIALE)
go

/*==============================================================*/
/* Table : LABORATOIRE                                          */
/*==============================================================*/
create table LABORATOIRE (
   ID_LABORATOIRE       int                  not null,
   NOM_LABORATOIRE      char(30)             not null,
   ADRESSE1_LABORATOIRE char(30)             not null,
   ADRESSE2_LABORATOIRE char(30)             not null,
   CODE_POSTAL_LABORATOIRE char(6)              not null,
   VILLE_LABORATOIRE    char(30)             not null,
   TEL_LABORATOIRE      char(10)             not null,
   MAIL_LABORATOIRE     char(30)             not null,
   SITEWEB_LABORATOIRE  char(30)             not null
)
go

alter table LABORATOIRE
   add constraint PK_LABORATOIRE primary key nonclustered (ID_LABORATOIRE)
go

/*==============================================================*/
/* Table : PARTICIPE                                            */
/*==============================================================*/
create table PARTICIPE (
   ID_CONSEILLERE      int                  not null,
   ID_SEMINAIRE         int                  not null
)
go

alter table PARTICIPE
   add constraint PK_PARTICIPE primary key (ID_CONSEILLERE, ID_SEMINAIRE)
go

/*==============================================================*/
/* Table : PATHOLOGIE                                           */
/*==============================================================*/
create table PATHOLOGIE (
   ID_PAT               numeric              not null,
   NOM_PAT              char(50)             null,
   DESCRIPTION_PAT      char(256)            null
)
go

alter table PATHOLOGIE
   add constraint PK_PATHOLOGIE primary key nonclustered (ID_PAT)
go

/*==============================================================*/
/* Table : POSSEDE                                              */
/*==============================================================*/
create table POSSEDE (
   REFERENCE_PRODUIT    char(8)              not null,
   NOM_SOCIETE_FILIALE  char(30)             not null
)
go

alter table POSSEDE
   add constraint PK_POSSEDE primary key (REFERENCE_PRODUIT, NOM_SOCIETE_FILIALE)
go

/*==============================================================*/
/* Table : PREND                                                */
/*==============================================================*/
create table PREND (
   ID_CLIENT            int                  not null,
   ID_CMDCLIENT         int                  not null,
   REFERENCE_PRODUIT    char(8)              not null
)
go

alter table PREND
   add constraint PK_PREND primary key (ID_CLIENT, ID_CMDCLIENT, REFERENCE_PRODUIT)
go

/*==============================================================*/
/* Table : PREND_PART                                           */
/*==============================================================*/
create table PREND_PART (
   ID_CLIENT            int                  not null,
   ID_REUNION           int                  not null
)
go

alter table PREND_PART
   add constraint PK_PREND_PART primary key (ID_CLIENT, ID_REUNION)
go

/*==============================================================*/
/* Table : PRODUITS                                             */
/*==============================================================*/
create table PRODUITS (
   REFERENCE_PRODUIT    char(8)              not null,
   ID_LABORATOIRE       int                  not null,
   NOM_PRODUIT          char(30)             not null,
   COMPOSITION_PRODUIT  char(256)            not null,
   CONTENANCE_PRODUIT   char(30)             not null,
   VOIE_ADMINISTRATION_PRODUIT char(30)             not null,
   EFFET_PRODUIT        char(256)            not null,
   MISE_EN_GARDE_PRODUIT char(256)            not null,
   FORME_PHARMACEUTIQUE_PRODUIT char(30)             not null,
   INDICATION_THERAPEUTIQUE_PRODUIT char(256)            not null,
   PROBLEME_TRAITE_PRODUIT char(256)            not null,
   DATECREATION_PRODUIT date             not null
)
go

alter table PRODUITS
   add constraint PK_PRODUITS primary key nonclustered (REFERENCE_PRODUIT)
go

/*==============================================================*/
/* Index : CREE_FK                                              */
/*==============================================================*/
create index CREE_FK on PRODUITS (
ID_LABORATOIRE ASC
)
go

/*==============================================================*/
/* Table : REUNION                                              */
/*==============================================================*/
create table REUNION (
   ID_REUNION           int                  not null,
   REFERENCE_PRODUIT    char(8)              not null,
   ID_CONSEILLERE      int                  not null,
   ID_CLIENT            int                  not null,
   DATE_REUNION         date            null,
   STATUT_REUNION       char(256)            null,
)
go

drop table reunion


alter table REUNION
   add constraint PK_REUNION primary key nonclustered (ID_REUNION)
go

/*==============================================================*/
/* Index : ORGANISE_FK                                          */
/*==============================================================*/
create index ORGANISE_FK on REUNION (
ID_CONSEILLERE ASC
)
go

/*==============================================================*/
/* Index : ACCUEILLE_FK                                         */
/*==============================================================*/
create index ACCUEILLE_FK on REUNION (
ID_CLIENT ASC
)
go

/*==============================================================*/
/* Index : CATALOGUE_FK                                         */
/*==============================================================*/
create index CATALOGUE_FK on REUNION (
REFERENCE_PRODUIT ASC
)
go

/*==============================================================*/
/* Table : SASSOCIE                                             */
/*==============================================================*/
create table SASSOCIE (
   REFERENCE_PRODUIT    char(8)              not null,
   ID_PAT               numeric              not null,
   PRO_REFERENCE_PRODUIT char(8)              not null
)
go

alter table SASSOCIE
   add constraint PK_SASSOCIE primary key (REFERENCE_PRODUIT, ID_PAT, PRO_REFERENCE_PRODUIT)
go

/*==============================================================*/
/* Table : SEMINAIRE                                            */
/*==============================================================*/
create table SEMINAIRE (
   ID_SEMINAIRE         int                  not null,
   NOM_SOCIETE_FILIALE  char(30)             not null,
   DATE_SEMINAIRE       varchar(20)             null
)
go

alter table SEMINAIRE
   add constraint PK_SEMINAIRE primary key nonclustered (ID_SEMINAIRE)
go

/*==============================================================*/
/* Index : GERE_FK                                              */
/*==============================================================*/
create index GERE_FK on SEMINAIRE (
NOM_SOCIETE_FILIALE ASC
)
go

/*==============================================================*/
/* Table : SOIGNE                                               */
/*==============================================================*/
create table SOIGNE (
   ID_PAT               numeric              not null,
   REFERENCE_PRODUIT    char(8)              not null,
   TRAITEMENT           char(50)             null
)
go

alter table SOIGNE
   add constraint PK_SOIGNE primary key (ID_PAT, REFERENCE_PRODUIT)
go

alter table CLIENTS
	add constraint FK_CLIENTS_CONSEILLERE foreign key (ID_CONSEILLERE) references CONSEILLERE(ID_CONSEILLERE)
go
-------------
alter table CLIENTS drop constraint FK_CLIENTS_CONSEILLERE
go
------------

alter table COMMANDE
   add constraint FK_COMMANDE_CONSEILLERE foreign key (ID_CONSEILLERE) references CONSEILLERE(ID_CONSEILLERE)
go
alter table CONSEILLERE
	add constraint FK_CONSEILLERE_MARRAINE foreign key (CON_ID_CONSEILLERE) references MARRAINE(ID_MARRAINE)
go
alter table CONSEILLERE
	add constraint FK_CONSEILLERE_FILIALE foreign key (NOM_SOCIETE_FILIALE) references FILIALE(NOM_SOCIETE_FILIALE)
go

alter table MARRAINE
	add constraint FK_MARRAINE_CONSEILLERE foreign key (ID_CONSEILLERE) references CONSEILLERE

alter table conseillere
	drop constraint FK_CLIENTS_CONSEILLERE
go
alter table conseillere
	drop constraint FK_CONSEILLERE_MARRAINE
go
alter table conseillere
	drop constraint FK_CONSEILLERE_FILIALE
go




-- INSERTION TABLE CLIENT
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(1,6,'Love','Adara','04 15 00 29 69','04 95 58 41 98','et.nunc.Quisque@tempus.co.uk','Ap #458-1685 Pede. Avenue','TN3522596590669407543672','93852','Oberpullendorf',1,3652,'27-11-1988');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(2,3,'Bender','Keith','04 78 36 27 88','04 08 83 68 39','augue.ac.ipsum@Aliulla.ca','Ap #579-3703 Faucibus. Av.','PS787049161098047183958299049','6280','Annapolis',1,392,'28-10-1989');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(3,9,'Bowers','Kyra','04 59 65 95 91','04 07 15 65 04','metus@estNuncullamcorper.net','6447 Dolor. Road','FO5154759787071719','64452','Sundrie',0,2374,'22-09-1978');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(4,19,'Dale','Talon','04 98 92 39 92','04 15 40 21 70','Fusce.aliquet@sit.co.uk',' 3588 Laoreet Avenue','HU78365541499622613116950121','23250','Lachine',0,5705,'22-08-1979');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(5,15,'Matthews','Brynne','04 46 41 08 97','04 62 50 19 71','eu.turpis@prequeMorbi.com','460-8728 Natoque Street','CH4042869840733935989','17872','Durg',0,5364,'28-07-1977');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(6,1,'Dillon','Idola','04 64 19 55 84','04 20 12 28 70','Quisque@vehila.org','610-4779 Urna Street','LV20UBGO2362208044875','37396','Cimitile',0,2972,'23-06-1976');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(7,10,'Elliott','Athena','04 28 86 98 84','04 08 96 98 72','eu.enim.Etiam@sapn.org','707-1959 Lectus Avenue','MD8431519589776907217797','31593','Bokaro Steel City',1,7742,'22-05-1975');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(8,18,'Rasmussen','Cain','04 38 77 32 72','04 06 41 86 97','rutrum.Fusce.dolor@Phallus.org','Ap #978-6084 Aenean Rd.','SM0263577458271044288329947','06723','Auvelais',1,37,'21-04-1974');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(9,16,'Reilly','Iola','04 23 40 18 71','04 41 68 80 33','ultricies@mollposuere.edu','Ap #390-4980 Nibh. St.','LB65678791450491142076976878','14297','Reana del Rojale',0,4999,'20-03-1973');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(10,3,'Cotton','Hannah','04 44 77 53 43','04 28 57 72 45','semper.auctor@placerat.com','1140 Dui. Rd.','KW8550333394339148238443362650','49846','Wilskerke',1,5081,'19-02-1972');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(11,15,'Horn','Ian','04 08 10 71 58','04 15 87 17 03','ligula.tortor@lectussociis.ca','Ap #572-399 Libero. Av.','RO82BRCL7477228660297904','48286','Bossiï¿½re',1,8894,'18-01-1966');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(13,17,'Whitney','Leigh','04 63 48 91 96','04 88 44 92 56','facilisis.eget@acmattis.net','Ap #146-9189 Luctus Av.','DK4152893740440277','82875','St. Albert',1,5384,'08-06-1967');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(14,3,'Beasley','Lysandra','04 98 18 47 55','04 04 24 70 81','venenatis@Crassedleo.net','542-1437 Id Street','CH8680177223323377068','15353','Ramsey',1,6023,'03-02-1965');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(15,12,'Cash','Abra','04 76 86 84 50','04 72 13 27 94','dolor.dolor@pedenonummy.ca','Ap #610-5899 In Rd.','RO71KZHL3358020228013739','98386','Anlier',1,2267,'17-03-1961');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(16,15,'Mccray','Lavinia','04 05 77 87 88','04 12 92 54 51','ultr.enim@faucibus.org','4147 Lorem St.','GB57VWLL18836840181492','49439','Lanark County',1,2555,'10-07-1962');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(17,11,'Pruitt','Shana','04 66 52 00 46','04 09 90 15 02','lectus.a@Quisque.co.uk','P.O. Box 802, 8175 Cum St.','SM4303690336123999934172767','76944','Orp-Jauche',1,4346,'20-10-1953');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(18,4,'Hines','Dean','04 18 22 24 43','04 27 50 13 87','dis@Duisvolutpat.ca','P.O. Box 154, 5664 Eu Rd.','LU800587187706998414','01604','New Haven',1,5257,'12-04-1959');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(19,14,'Joseph','Henry','04 86 83 83 89','04 12 96 59 80','odio@In.ca','Ap #802-4112 Eu Rd.','MR5780750660165296138946742','35918','Bath',1,4714,'14-01-1980');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(20,3,'Brady','Fatima','04 36 17 84 89','04 82 69 83 24','torquent@purus.org','4180 Parturient Street','MK46186144646272532','01145','Offida',1,170,'06-08-1979');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(21,12,'Peterson','Vernon','04 63 54 14 59','04 33 71 60 08','sem.ut@malesuager.net','491-2007 Eget Rd.','SM8456559288147999506440948','66464','Kapuskasing',1,9602,'08-12-1973');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(22,17,'Stevens','Patricia','04 01 31 27 38','04 71 44 30 95','elit@tellusNunclectus.net','190-6729 Fringilla Road','EE113705990165510340','88166','Loppem',0,8972,'17-09-1969');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(23,15,'Morrison','Stella','04 94 33 65 28','04 54 52 49 80','semper.egestas@duinec.net','Ap #912-7898 Egestas Street','EE802827463935457200','26254','Barbania',0,8631,'16-10-1968');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(24,6,'Ward','Aimee','04 14 79 71 43','04 72 07 09 14','est@sociis.ca','Ap #518-6558 Pharetra Ave','IS703369971814237645747166','55400','Kirkwall',0,3540,'20-11-1967');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(25,8,'Booth','Pandora','04 47 49 40 59','04 74 85 29 72','elit@nibhPhasellus.net','4725 Nunc Rd.','RS24281631908086879618','90502','Jonquiï¿½re',1,9041,'18-09-1965');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(26,11,'Holden','Henry','04 33 53 84 38','04 18 10 15 19','In.mi@sed.edu','513-8578 Suspendisse Rd.','GT34722392792490965041294014','91488','Austin',0,5204,'14-03-1963');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(27,13,'Pena','Darrel','04 05 38 47 32','04 08 16 17 93','mus.Proin.vel@tiuntnibh.edu','Ap #191-8876 Sit Street','SM1849789865611160773243534','05549','Linton',1,2835,'10-02-1971');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(28,20,'Tucker','Jolie','04 91 64 73 69','04 56 55 24 42','lorem.vitae.odio@lacinia.edu','Ap #856-3559 Amet, Road','BA262607425516116013','85132','Neuss',1,3232,'03-07-1971');
INSERT INTO CLIENTS(ID_CLIENT,ID_CONSEILLERE,NOM_CLIENT,PRENOM_CLIENT,NUMEROTELEPHONEFIXE_CLIENT,NUMERTELEPHONEPORTABLE_CLIENT,EMAIL_CLIENT,ADRESSE1_CLIENT,ADRESSE2_CLIENT,CODEPOSTAL_CLIENT,VILLE_CLIENT,SEXE_CLIENT,HOTE, DATE_NAISSANCE_CLIENT) VALUES(29,12,'Hill','Marshall','04 89 09 29 13','04 05 87 14 03','enim@sedfacilisis.org','P.O. Box 299, 8171 Eget, St.','IT079XXULI10966537373894202','73926','Mascalucia',1,8050,'18-09-1966');
 
select * from CLIENTS
drop table CLIENTS

--INSERTION CONSEILLERE

INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(1,2,'Nature Derm','Dunlap','Chastity','04 39 25 00 19','06 51 08 47 39','Nul@Nullam.co.uk','Ap #883-7630 Road','A Limited','57997','Siliguri','06/20/1951',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(2,0,'Nature Derm','Dillard','Quemby','04 62 49 08 60','06 05 78 18 34','dui@Phasellus.org','Ap #611-2291 Nec, St.','Amet Dapibus Id Foundation','72736','Penna in Teverina','11/23/1969',1);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(3,2,'Nature Derm','Herring','Scarlet','04 67 33 68 84','06 04 19 13 63','lorem.fringilla@enimnonnisi.edu','393-4746 Vitae, Av.','Sagittis Institute','03619','Corswarem','01/30/1957',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(4,0,'Nature Derm','Rhodes','Bertha','04 97 45 31 10','06 68 36 34 02','convallis.in.cursus@sapienNunc.edu','659-2015 Ipsum Ave','Aliquam Adipiscing Lobortis Foundation','48015','Campli','09/12/1980',1);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(5,4,'Nature Derm','Roth','Hadley','04 63 74 95 93','06 90 05 74 36','scelerisque.neque.Nullam@acmattissemper.edu','P.O. Box 549, 7690 Facilisis Street','Ac Institute','50827','Carstairs','05/07/1983',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(6,0,'Nature Derm','Gonzales','Hanae','04 60 21 19 32','06 26 95 70 47','Aliquam@insodaleselit.co.uk','405-1688 Est Road','Donec Est Mauris LLP','50736','Celle','01/11/1974',1);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(7,2,'Nature Derm','Goff','Hilda','04 69 22 80 56','06 08 25 20 45','turpis@SuspendisseduiFusce.edu','465-8897 Integer Avenue','Ipsum Consulting','05020','Harrogate','03/02/1980',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(8,24,'Nature Derm','Mcgowan','Aspen','04 35 96 47 09','06 57 95 31 13','dignissim@nonmassanon.edu','P.O. Box 250, 4523 Velit. Street','Donec Corporation','89083','Dijon','12/22/1988',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(9,2,'Nature Derm','Blackwell','Zorita','04 54 44 13 02','06 34 50 36 37','elit.Curabitur@diamvel.com','368-481 Auctor Road','Ullamcorper Corporation','15062','Sachs Harbour','06/17/1979',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(10,0,'Nature Derm','Travis','Aiko','04 66 85 60 53','06 02 29 38 39','elit@augueidante.org','P.O. Box 758, 6700 Risus Rd.','Amet Metus Aliquam Institute','75592','Wals-Siezenheim','08/06/1967',1);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(11,4,'Nature Derm','Clayton','Alma','04 50 04 10 45','06 39 31 19 54','Cras@velarcueu.edu','8706 Pede. St.','Tristique Senectus Et Associates','87202','Imperatriz','10/01/1958',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(12,24,'Nature Derm','Nicholson','Cassandra','04 83 93 53 36','06 14 97 71 94','dolor.Fusce.feugiat@volutpatornare.edu','P.O. Box 440, 2757 Nec Rd.','Nibh Inc.','91526','Paupisi','05/15/1983',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(13,14,'Nature Derm','Gibbs','Lysandra','04 46 39 85 38','06 12 88 63 21','euismod@luctusipsum.ca','Ap #994-3806 Integer Av.','Gravida Non Corp.','27578','Beaumaris','11/02/1954',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(14,0,'Nature Derm','Glover','Joan','04 16 29 07 56','06 77 20 41 14','eros.Proin@sedsapien.ca','901-9051 Pede, Avenue','Lacinia At Iaculis Industries','87041','Rouyn-Noranda','08/19/1969',1);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(15,14,'Nature Derm','Walker','Martha','04 38 70 81 90','06 14 03 60 78','odio.vel.est@modmauris.co.uk','5217 Egestas, St.','Dictum LLC','49842','Mellery','04/13/1961',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(16,14,'Nature Derm','Lindsay','Ria','04 72 42 45 09','06 62 87 06 07','senectus@aliquamiaculis.org','6537 Et Av.','Dictum Mi LLC','64491','Langford','06/29/1963',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(17,10,'Nature Derm','Hendricks','Bianca','04 48 32 40 74','06 27 07 88 95','odio@Nullamut.co.uk','586-5390 Libero Ave','Mauris Magna Ltd','45893','Builth Wells','07/02/1983',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(18,10,'Nature Derm','Mccall','Hadassah','04 00 73 15 71','06 27 27 94 41','ut@Proindolor.edu','P.O. Box 707, 8901 Et Road','Integer Id Corp.','80914','Introd','09/12/1961',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(19,6,'Nature Derm','Walker','Bianca','04 22 48 53 17','06 63 44 99 49','egestas.Duis@Duisrisus.net','539 Vitae, Road','Dui Institute','62471','Invercargill','04/25/1971',0);
INSERT INTO CONSEILLERE(ID_CONSEILLERE,CON_ID_CONSEILLERE,NOM_SOCIETE_FILIALE,NOM_CONSEILLERE,PRENOM_CONSEILLERE,TEL_FIXE_CONSEILLERE,TEL_PORTABLE_CONSEILLERE,MAIL_CONSEILLERE,ADRESSE1_CONSEILLERE,ADRESSE2_CONSEILLERE,CODE_POSTAL_CONSEILLERE,VILLE_CONSEILLERE,DATENAISSANCE_CONSEILLERE,MARRAINE) VALUES(20,4,'Nature Derm','Thomas','Petra','04 93 26 34 83','06 66 18 01 63','eget.tincidunt@ut.edu','P.O. Box 381, 1229 Erat Street','Dolor Quisque Tincidunt Inc.','80384','Degelis','05/09/1989',0);

drop table CONSEILLERE
drop table COMMANDE
drop table marraine
select * from conseillere


--INSERTION SEMINAIRE
INSERT INTO SEMINAIRE (ID_SEMINAIRE,NOM_SOCIETE_FILIALE,DATE_SEMINAIRE) VALUES (781,'Kapolei','07-05-13');
INSERT INTO SEMINAIRE (ID_SEMINAIRE,NOM_SOCIETE_FILIALE,DATE_SEMINAIRE) VALUES (370,'Froidchapelle','14-04-13');
INSERT INTO SEMINAIRE (ID_SEMINAIRE,NOM_SOCIETE_FILIALE,DATE_SEMINAIRE) VALUES (282,'Venezia','19-06-14');
INSERT INTO SEMINAIRE (ID_SEMINAIRE,NOM_SOCIETE_FILIALE,DATE_SEMINAIRE) VALUES (219,'Malartic','17-11-14');
INSERT INTO SEMINAIRE (ID_SEMINAIRE,NOM_SOCIETE_FILIALE,DATE_SEMINAIRE) VALUES (111,'Kitimat','09-01-14');
INSERT INTO SEMINAIRE (ID_SEMINAIRE,NOM_SOCIETE_FILIALE,DATE_SEMINAIRE) VALUES (706,'Diegem','09-02-15');

select * from SEMINAIRE
drop table SEMINAIRE


--INSERTION REUNION 
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(1,70952,17,1,'01-11-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(1001,57476,18,12,'25-01-15','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(2001,39102,9,9,'27-08-14','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(3001,48218,18,17,'27-04-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(4001,14518,24,25,'26-11-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(5001,86690,30,22,'30-04-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(6001,43250,21,15,'06-11-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(7001,2509,4,26,'07-07-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(8001,76712,18,16,'14-01-15','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(9001,88814,29,11,'19-07-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(10001,93386,4,21,'16-10-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(11001,9728,23,1,'03-05-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(12001,74912,21,16,'30-08-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(13001,81283,3,9,'15-08-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(14001,48029,15,26,'08-09-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(15001,29204,9,12,'07-12-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(16001,3119,17,26,'17-11-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(17001,22862,4,23,'15-04-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(18001,28850,15,17,'05-07-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(19001,97906,11,28,'19-10-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(20001,83072,1,20,'31-12-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(21001,23057,13,6,'09-05-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(22001,26220,2,23,'28-01-14','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(23001,52201,16,16,'15-09-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(24001,22237,3,24,'24-07-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(25001,16452,1,3,'09-11-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(26001,90392,22,21,'20-05-13','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(27001,33096,25,16,'29-05-14','prevue');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(28001,95353,27,13,'09-02-14','termine');
INSERT INTO REUNION(ID_REUNION,REFERENCE_PRODUIT,ID_CONSEILLERE,ID_CLIENT,DATE_REUNION,STATUT_REUNION) VALUES(29001,92099,9,21,'15-04-13','termine');

select * from reunion
drop table reunion


--INSERTION FILIALE


INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Elvis Cook','Ukraine','30-04-13','P.O. Box 991, 2424 Eget, Rd.','P.O. Box 125, 9758 Et Street','6692','Paraguay',17,2,'09 77 37 27 13','08 33 43 43 36','lectus.pede.ultrices@acmattis.edu','Lorraine','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Phelan Hall','Norway','22-09-13','3552 Id, Street','Ap #354-9975 Posuere Rd.','6693','Rwanda',16,4,'05 68 00 51 48','09 74 52 08 20','pharetra@Quisqueac.co.uk','Aquitaine','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Armando Pittman','Cocos (Keeling) Islands','04-05-13','9145 Semper Ave','592-3814 Lorem, St.','93872','Spain',5,5,'05 73 91 38 22','06 53 36 65 82','Cras.eget.nisi@Sedeu.com','Nord-Pas-de-Calais','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Warren Vega','Niger','19-08-14','728-5443 Tortor, Ave','Ap #247-1834 Massa Road','34000','Belize',6,3,'03 54 35 91 44','03 08 31 70 82','at.pede.Cras@nuncsed.ca','Ch','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Robert Lindsay','Swaziland','18-02-15','220-3593 Nisi. Avenue','Ap #307-7401 Sed, Road','60857','Fiji',8,5,'06 97 19 94 78','01 50 52 91 60','risus.at.fringilla@Pellentesque.org','Provence-Alpes-Cote d''Azur','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Elijah Washington','Saint Barthélemy','03-12-14','376-5324 Dignissim St.','Ap #544-1189 Lectus Ave','3656','Libya',2,6,'03 81 26 78 34','04 33 54 58 47','a.scelerisque.sed@enim.edu','Po','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Levi Moore','Saint Vincent and The Grenadines','19-01-15','4482 Eu Avenue','1719 Pellentesque Avenue','20694','Palestine, State of',5,3,'07 11 88 94 82','08 13 64 09 07','euismod.enim.Etiam@vel.ca','Pays de la Loire','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Kasper Hudson','Palau','20-07-14','6898 Convallis St.','Ap #611-6280 Mauris, Ave','6159','Oman',7,1,'07 11 83 42 51','01 50 72 94 34','dictum@Pellentesquetincidunt.com','Lorraine','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Walker Houston','Gibraltar','30-05-14','4841 Nec, Street','245-497 Egestas, Road','578520','Western Sahara',11,5,'05 76 23 30 72','03 12 65 28 22','et.euismod.et@Inatpede.co.uk','Provence-Alpes-Cote d''Azur','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Fuller Ware','Belarus','03-05-14','747-190 Egestas. Street','Ap #575-9794 Magna Av.','30004','Peru',3,1,'02 29 31 22 96','01 08 48 85 64','posuere.vulputate@leoelementum.org','Lo','');
INSERT INTO FILIALE(NOM_SOCIETE_FILIALE,NOM_SOCIETEMERE_FILIALE,DATE_CREATION_FILIALE,ADRESSE1_FILIALE,ADRESSE2_FILIALE,CODE_POSTAL_FILIALE,DIRECTEUR_LOCAL_FILIALE,NOMBRE_CONSEILLERE_FILIALE,NOMBRE_FORMATRICE_FILIALE,TEL_FILIALE,FAX_FILIALE,MAIL_FILIALE,SECTEUR_FILIALE,VILLE_FILIALE) VALUES('Samuel Kennedy','Greece','27-01-14','Ap #290-1811 Metus. Av.','Ap #397-6297 Amet, Rd.','59829','Palau',6,1,'05 94 28 62 18','08 98 17 20 60','Nulla@rutrumnonhendrerit.net','Br','');
select * from filiale





--INSERTION COMMANDE
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(35608,6,'01-11-14',1,7998);
																																				   
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(17211,18,'01-12-13',14,6344);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(90473,28,'08-08-13',7,3357);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(84980,9,'24-10-13',29,8241);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(55842,5,'06-06-13',2,7473);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(58869,29,'18-05-13',9,1680);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(52244,28,'08-06-13',17,6550);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(68002,23,'03-02-14',27,2648);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(1447,10,'22-06-14',2,2740);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(76782,8,'16-04-14',23,562);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(65903,15,'07-07-14',19,5544);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(32577,29,'18-07-14',23,1434);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(70700,9,'21-10-13',25,5097);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(24533,6,'12-11-14',2,7847);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(52285,2,'04-03-15',17,3960);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(1616,5,'21-08-13',4,3129);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(37145,13,'04-03-15',4,4438);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(80803,24,'18-01-15',16,9965);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(77881,3,'09-10-13',2,5607);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(89387,12,'16-11-13',17,6309);
INSERT INTO COMMANDE(ID_CMDCLIENT,ID_CONSEILLERE,DATE_CMDCLIENT,QUANTITE_CMDCLIENT,CODEPROMO_CMDCLIENT) VALUES(60286,20,'18-06-13',17,9309);

--INSERTION LABORATOIRE

INSERT INTO LABORATOIRE VALUES (0, 'PIERRE FABRE Medicament', '15 Rue du lardon', 'none', '92000', 'Nanterre', '0120356988', 'pierrefabre@labo.com', 'www.labofabre.com');
INSERT INTO LABORATOIRE VALUES (1, 'BOIRON Laboratoire', '255 Rue Youssef Majid', 'none', '250000', 'Besancon', '0156358963', 'boiron@labo.com', 'www.laboboiron.com');
INSERT INTO LABORATOIRE VALUES (2, 'BIODERMA Laboratoire', '33 Rue du Choco Bompard', 'none', '69000', 'Lyon', '0409658963', 'bioderma@labo.com', 'www.labobioderma.com');
INSERT INTO LABORATOIRE VALUES (3, 'AVENE Laboratoire', '55 Rue du couscous', 'none', '83700', 'Saint-Raphael', '0483659645', 'avene@labo.com', 'www.laboavene.com');
INSERT INTO LABORATOIRE VALUES (4, 'DUCRAY Laboratoire', '86 Rue du coco', 'Batiment C', '34170', 'Castelnau-le-lez', '0467895463', 'ducray@labo.com', 'www.laboducray.com');
select * from LABORATOIRE

--INSERTION PRODUIT

INSERT INTO PRODUITS VALUES ('00000001', 0, 'DEXERYL', 'Glycérol monostéarate-Stéarique acide (E570)-Polydiméthylcyclosiloxane - Huile de silicone - Macrogol - Trolamine - Parahydroxybenzoate de propyle (E216)- Eau purifiée','250g', 'Application cutanée', 'Crème émolliente et hydratante', 'Ne pas avaler', 'Crème', 'Aucune', 'Peau sèche, brulures', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000002', 2, 'Matriciane Serum', 'Aqua, isotridecyl stearate, glycerin, olea europaea (olive) fruit oil, glyceryl stearate, olea europaea oil unsaponifiables, lauroyl lysinen mannitol', '30ml', 'Application cutanée', 'Régénère la peau', 'Ne pas Avaler, Eloigner des enfants', 'Crème', 'Aucune', 'Peaux vieilles, manque de tonus', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000003', 1, 'Quiétude', 'Chamomilla recutita 9 CH, Datura stramonium 9 CH, Gelsemium sempervirens 9 CH, Hyoscyamus niger 9 CH, Kalii bromidum 9 CH', '200ml', 'Voie orale', 'Calme la nervosité la nuit', 'Eloigner des enfants, déconseillé femme enceinte', 'Sirop', 'Aucune', 'Pour les cauchemars', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000004', 3, 'Cold Cream', 'Cold cream à l´Eau thermale d´Avène 27%, sucralfate 23%, Vit E et F 2,4%', '4g', 'Application Cutanée', 'Rend les lèvres douces', 'Eloigner des enfants', 'Stick', 'Aucune', 'Pour les lèvres gercées', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000005', 4, 'Melascreen', 'Peroxyde de Benzoyle, Datura stranomium, olea europeae, glyceryl, Hysosscyamus niger 9 CH','600ml', 'Application Cutanée', 'Protège du soleil', 'Ne pas avaler, éloigner des enfants', 'Crème', 'Aucune', 'Pour peaux sensibles au soleil', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000006', 1, 'Keraknyl', 'Eau, Glyceryl Stearate, Hyoscyamus niger 9CH, Gelsium Sempervirens, Sulcralfate, ', '200ml', 'Application cutanée', 'Calme les boutons d''accné', 'Ne pas avaler, Eloigner des enfants ', 'gel', 'Aucune', 'Pour les peaux à problème', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000007', 4, 'Biafine', 'Huile de fruit, Nitrate de sodium, sauce blanche,sulfate de potasium, h2o ', '150ml', 'Voie orale', 'Hydrate la peau', 'Eloigner des enfants', 'Gelule', 'Aucune', 'Pour les peaux très sèches', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000008', 3, 'Fusidine', 'Acide fusidique, H2O, sodium, sauce algérienne, glycerin, olea jojoba, lardons', '350ml', 'Application cutanée', 'Réduit le nombre de boutons', 'Eloigner des enfants, ne pas avaler', 'crème', 'Aucune', 'Pour les peau pleines de boutons', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000009', 2, 'CicaCream', 'Eau, Coca Cola, sauce curry, Hyoscyamus niger 9 CH, Kalii bromidum 9 CH, lait de soja, ', '500ml', 'Voie anale', 'Calme l''anxieté', 'Eloigner des enfants, ne pas conduire', 'Suppositoire', 'Aucune', 'Pour les troubles de l''anxieté', '28-03-2014');
INSERT INTO PRODUITS VALUES ('00000010', 0, 'Bétadine', 'Eau, gelsium sempervirens, Peroxyde de Benzoyle,  Hyoscyamus niger 9 CH, Kalii bromidum 9 CH, safran, ', '200ml', 'Application cutanée', 'Aide à cotériser', 'Eloigner des enfants, ne pas avaler', 'liquide', 'Aucune', 'Egratinures', '28-03-2014');
select * from PRODUITS
drop table PRODUITS







--NOMBRE DE CLIENT AJOUTER ENTRE UNE CERTAINE PERIODE
create procedure frequenceClient
@dateDebut date = NULL
@dateFin date = NULL
AS
SELECT NOM_CLIENT,PRENOM_CLIENT
FROM CLIENTS
WHERE DATE_NAISSANCE_CLIENT > @dateDebut 
AND DATE_NAISSANCE_CLIENT < @dateFin;


--PROCEDURE QUI AFFICHE LA/LES REUNION(S) OU LE PRODUIT A ETE UTILISE
CREATE PROCEDURE reunionRefProd
@refProd char(8) = NULL
AS 
SELECT ID_REUNION, DATE_REUNION
FROM REUNION
WHERE @refProd = REFERENCE_PRODUIT;



-- lister tout les produits qui ont un effet combiné avec un produit passer en parametre
CREATE PROCEDURE prodCombine
@prodRecherche char(8) = NULL
AS 
SELECT PRO_REFERENCE_PRODUIT, ID_PAT
FROM SASSOCIE
WHERE  REFERENCE_PRODUIT = @prodRecherche;



--NOMBRE DE SEMINAIRE ORGANISE PAR LA FILIALE PASSE EN PARAMETRE
CREATE PROCEDURE seminaireFiliale
@filiale char(30) = NULL
AS
SELECT count (select*from seminaire WHERE @filiale = NOM_SOCIETE_FILIALE) 'nombre de seminaires'

