/*==============================================================*/
/* Nom de SGBD :  SAP SQL Anywhere 17                           */
/* Date de création :  27/05/2025 16:52:00                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_AJOUTER_AJOUTER_PRODUCTS') then
    alter table AJOUTER
       delete foreign key FK_AJOUTER_AJOUTER_PRODUCTS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AJOUTER_AJOUTER2_ADMIN') then
    alter table AJOUTER
       delete foreign key FK_AJOUTER_AJOUTER2_ADMIN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMMANDE_COMMANDER_CLIENTS') then
    alter table COMMANDER
       delete foreign key FK_COMMANDE_COMMANDER_CLIENTS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMMANDE_COMMANDER_PRODUCTS') then
    alter table COMMANDER
       delete foreign key FK_COMMANDE_COMMANDER_PRODUCTS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OFFERS_P_OFFERS_PE_OFFER_AD') then
    alter table OFFERS_PERSONNALISEES
       delete foreign key FK_OFFERS_P_OFFERS_PE_OFFER_AD
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OFFERS_P_OFFERS_PE_ADMIN') then
    alter table OFFERS_PERSONNALISEES
       delete foreign key FK_OFFERS_P_OFFERS_PE_ADMIN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_OFFERS_P_OFFERS_PE_PRODUCTS') then
    alter table OFFERS_PERSONNALISEES
       delete foreign key FK_OFFERS_P_OFFERS_PE_PRODUCTS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PRODUCTS_CONTIEN_CATEGORI') then
    alter table PRODUCTS
       delete foreign key FK_PRODUCTS_CONTIEN_CATEGORI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROPOSE_PROPOSE_STORE') then
    alter table PROPOSE
       delete foreign key FK_PROPOSE_PROPOSE_STORE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PROPOSE_PROPOSE2_PRODUCTS') then
    alter table PROPOSE
       delete foreign key FK_PROPOSE_PROPOSE2_PRODUCTS
end if;

drop index if exists ADMIN.ADMIN_PK;

drop table if exists ADMIN;

drop index if exists AJOUTER.AJOUTER_FK;

drop index if exists AJOUTER.AJOUTER2_FK;

drop index if exists AJOUTER.AJOUTER_PK;

drop table if exists AJOUTER;

drop index if exists CATEGORIES.CATEGORIES_PK;

drop table if exists CATEGORIES;

drop index if exists CLIENTS.CLIENTS_PK;

drop table if exists CLIENTS;

drop index if exists COMMANDER.COMMANDER_FK;

drop index if exists COMMANDER.COMMANDER2_FK;

drop index if exists COMMANDER.COMMANDER_PK;

drop table if exists COMMANDER;

drop index if exists OFFERS_PERSONNALISEES.OFFERS_PERSONNALISEES_FK;

drop index if exists OFFERS_PERSONNALISEES.OFFERS_PERSONNALISEES3_FK;

drop index if exists OFFERS_PERSONNALISEES.OFFERS_PERSONNALISEES2_FK;

drop index if exists OFFERS_PERSONNALISEES.OFFERS_PERSONNALISEES_PK;

drop table if exists OFFERS_PERSONNALISEES;

drop index if exists OFFER_ADMIN.OFFER_ADMIN_PK;

drop table if exists OFFER_ADMIN;

drop index if exists PRODUCTS.CONTIEN_FK;

drop index if exists PRODUCTS.PRODUCTS_PK;

drop table if exists PRODUCTS;

drop index if exists PROPOSE.PROPOSE_FK;

drop index if exists PROPOSE.PROPOSE2_FK;

drop index if exists PROPOSE.PROPOSE_PK;

drop table if exists PROPOSE;

drop index if exists STORE.STORE_PK;

drop table if exists STORE;

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create or replace table ADMIN 
(
   ID_ADMIN             integer                        not null,
   NAME                 long varchar                   null,
   EMAIL                long varchar                   null,
   MODE_PASSE           long varchar                   null,
   ROLE                 long varchar                   null,
   constraint PK_ADMIN primary key clustered (ID_ADMIN)
);

/*==============================================================*/
/* Index : ADMIN_PK                                             */
/*==============================================================*/
create unique clustered index ADMIN_PK on ADMIN (
ID_ADMIN ASC
);

/*==============================================================*/
/* Table : AJOUTER                                              */
/*==============================================================*/
create or replace table AJOUTER 
(
   ID_ADMIN             integer                        not null,
   ID_PRODUIT           integer                        not null,
   constraint PK_AJOUTER primary key clustered (ID_ADMIN, ID_PRODUIT)
);

/*==============================================================*/
/* Index : AJOUTER_PK                                           */
/*==============================================================*/
create unique clustered index AJOUTER_PK on AJOUTER (
ID_ADMIN ASC,
ID_PRODUIT ASC
);

/*==============================================================*/
/* Index : AJOUTER2_FK                                          */
/*==============================================================*/
create index AJOUTER2_FK on AJOUTER (
ID_ADMIN ASC
);

/*==============================================================*/
/* Index : AJOUTER_FK                                           */
/*==============================================================*/
create index AJOUTER_FK on AJOUTER (
ID_PRODUIT ASC
);

/*==============================================================*/
/* Table : CATEGORIES                                           */
/*==============================================================*/
create or replace table CATEGORIES 
(
   ID_CATEGORIE         integer                        not null,
   NAME                 long varchar                   null,
   DESCRIPTION          long varchar                   null,
   constraint PK_CATEGORIES primary key clustered (ID_CATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIES_PK                                        */
/*==============================================================*/
create unique clustered index CATEGORIES_PK on CATEGORIES (
ID_CATEGORIE ASC
);

/*==============================================================*/
/* Table : CLIENTS                                              */
/*==============================================================*/
create or replace table CLIENTS 
(
   ID_CLIENT            integer                        not null,
   NAME                 long varchar                   null,
   PHONE                numeric(100)                   null,
   EMAIL                long varchar                   null,
   MODE_PASSE           long varchar                   null,
   LOCALISATION         long varchar                   null,
   constraint PK_CLIENTS primary key clustered (ID_CLIENT)
);

/*==============================================================*/
/* Index : CLIENTS_PK                                           */
/*==============================================================*/
create unique clustered index CLIENTS_PK on CLIENTS (
ID_CLIENT ASC
);

/*==============================================================*/
/* Table : COMMANDER                                            */
/*==============================================================*/
create or replace table COMMANDER 
(
   ID_PRODUIT           integer                        not null,
   ID_CLIENT            integer                        not null,
   DATE_DE_COMMANDE     timestamp                      null,
   SITUATION_DE_COMMANDE long varchar                   null,
   SITUATION_DE_PAYMENT smallint                       null,
   constraint PK_COMMANDER primary key clustered (ID_PRODUIT, ID_CLIENT)
);

/*==============================================================*/
/* Index : COMMANDER_PK                                         */
/*==============================================================*/
create unique clustered index COMMANDER_PK on COMMANDER (
ID_PRODUIT ASC,
ID_CLIENT ASC
);

/*==============================================================*/
/* Index : COMMANDER2_FK                                        */
/*==============================================================*/
create index COMMANDER2_FK on COMMANDER (
ID_PRODUIT ASC
);

/*==============================================================*/
/* Index : COMMANDER_FK                                         */
/*==============================================================*/
create index COMMANDER_FK on COMMANDER (
ID_CLIENT ASC
);

/*==============================================================*/
/* Table : OFFERS_PERSONNALISEES                                */
/*==============================================================*/
create or replace table OFFERS_PERSONNALISEES 
(
   ID_ADMIN             integer                        not null,
   ID_PRODUIT           integer                        not null,
   ID_OFFRE_ADMIN       integer                        not null,
   DATE_DE_OFFRE        timestamp                      null,
   constraint PK_OFFERS_PERSONNALISEES primary key clustered (ID_ADMIN, ID_PRODUIT, ID_OFFRE_ADMIN)
);

/*==============================================================*/
/* Index : OFFERS_PERSONNALISEES_PK                             */
/*==============================================================*/
create unique clustered index OFFERS_PERSONNALISEES_PK on OFFERS_PERSONNALISEES (
ID_ADMIN ASC,
ID_PRODUIT ASC,
ID_OFFRE_ADMIN ASC
);

/*==============================================================*/
/* Index : OFFERS_PERSONNALISEES2_FK                            */
/*==============================================================*/
create index OFFERS_PERSONNALISEES2_FK on OFFERS_PERSONNALISEES (
ID_ADMIN ASC
);

/*==============================================================*/
/* Index : OFFERS_PERSONNALISEES3_FK                            */
/*==============================================================*/
create index OFFERS_PERSONNALISEES3_FK on OFFERS_PERSONNALISEES (
ID_PRODUIT ASC
);

/*==============================================================*/
/* Index : OFFERS_PERSONNALISEES_FK                             */
/*==============================================================*/
create index OFFERS_PERSONNALISEES_FK on OFFERS_PERSONNALISEES (
ID_OFFRE_ADMIN ASC
);

/*==============================================================*/
/* Table : OFFER_ADMIN                                          */
/*==============================================================*/
create or replace table OFFER_ADMIN 
(
   ID_OFFRE_ADMIN       integer                        not null,
   NOME_DE_OFFRE        long varchar                   null,
   DESCRIPTION_DE_OFFRE long varchar                   null,
   OFFRE_PRIX           decimal(10,10)                 null,
   constraint PK_OFFER_ADMIN primary key clustered (ID_OFFRE_ADMIN)
);

/*==============================================================*/
/* Index : OFFER_ADMIN_PK                                       */
/*==============================================================*/
create unique clustered index OFFER_ADMIN_PK on OFFER_ADMIN (
ID_OFFRE_ADMIN ASC
);

/*==============================================================*/
/* Table : PRODUCTS                                             */
/*==============================================================*/
create or replace table PRODUCTS 
(
   ID_PRODUIT           integer                        not null,
   ID_CATEGORIE         integer                        not null,
   NAME                 long varchar                   null,
   DESCRIPTION          long varchar                   null,
   PRIX                 decimal(10,10)                 null,
   IMAGE_URL            long varchar                   null,
   constraint PK_PRODUCTS primary key clustered (ID_PRODUIT)
);

/*==============================================================*/
/* Index : PRODUCTS_PK                                          */
/*==============================================================*/
create unique clustered index PRODUCTS_PK on PRODUCTS (
ID_PRODUIT ASC
);

/*==============================================================*/
/* Index : CONTIEN_FK                                           */
/*==============================================================*/
create index CONTIEN_FK on PRODUCTS (
ID_CATEGORIE ASC
);

/*==============================================================*/
/* Table : PROPOSE                                              */
/*==============================================================*/
create or replace table PROPOSE 
(
   ID_PRODUIT           integer                        not null,
   ID_STORE             integer                        not null,
   DATE_DE_PROPOSE      date                           null,
   constraint PK_PROPOSE primary key clustered (ID_PRODUIT, ID_STORE)
);

/*==============================================================*/
/* Index : PROPOSE_PK                                           */
/*==============================================================*/
create unique clustered index PROPOSE_PK on PROPOSE (
ID_PRODUIT ASC,
ID_STORE ASC
);

/*==============================================================*/
/* Index : PROPOSE2_FK                                          */
/*==============================================================*/
create index PROPOSE2_FK on PROPOSE (
ID_PRODUIT ASC
);

/*==============================================================*/
/* Index : PROPOSE_FK                                           */
/*==============================================================*/
create index PROPOSE_FK on PROPOSE (
ID_STORE ASC
);

/*==============================================================*/
/* Table : STORE                                                */
/*==============================================================*/
create or replace table STORE 
(
   ID_STORE             integer                        not null,
   NAME                 long varchar                   null,
   ADRESS               long varchar                   null,
   PHONE                numeric(100)                   null,
   EMAIL                long varchar                   null,
   constraint PK_STORE primary key clustered (ID_STORE)
);

/*==============================================================*/
/* Index : STORE_PK                                             */
/*==============================================================*/
create unique clustered index STORE_PK on STORE (
ID_STORE ASC
);

alter table AJOUTER
   add constraint FK_AJOUTER_AJOUTER_PRODUCTS foreign key (ID_PRODUIT)
      references PRODUCTS (ID_PRODUIT)
      on update restrict
      on delete restrict;

alter table AJOUTER
   add constraint FK_AJOUTER_AJOUTER2_ADMIN foreign key (ID_ADMIN)
      references ADMIN (ID_ADMIN)
      on update restrict
      on delete restrict;

alter table COMMANDER
   add constraint FK_COMMANDE_COMMANDER_CLIENTS foreign key (ID_CLIENT)
      references CLIENTS (ID_CLIENT)
      on update restrict
      on delete restrict;

alter table COMMANDER
   add constraint FK_COMMANDE_COMMANDER_PRODUCTS foreign key (ID_PRODUIT)
      references PRODUCTS (ID_PRODUIT)
      on update restrict
      on delete restrict;

alter table OFFERS_PERSONNALISEES
   add constraint FK_OFFERS_P_OFFERS_PE_OFFER_AD foreign key (ID_OFFRE_ADMIN)
      references OFFER_ADMIN (ID_OFFRE_ADMIN)
      on update restrict
      on delete restrict;

alter table OFFERS_PERSONNALISEES
   add constraint FK_OFFERS_P_OFFERS_PE_ADMIN foreign key (ID_ADMIN)
      references ADMIN (ID_ADMIN)
      on update restrict
      on delete restrict;

alter table OFFERS_PERSONNALISEES
   add constraint FK_OFFERS_P_OFFERS_PE_PRODUCTS foreign key (ID_PRODUIT)
      references PRODUCTS (ID_PRODUIT)
      on update restrict
      on delete restrict;

alter table PRODUCTS
   add constraint FK_PRODUCTS_CONTIEN_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIES (ID_CATEGORIE)
      on update restrict
      on delete restrict;

alter table PROPOSE
   add constraint FK_PROPOSE_PROPOSE_STORE foreign key (ID_STORE)
      references STORE (ID_STORE)
      on update restrict
      on delete restrict;

alter table PROPOSE
   add constraint FK_PROPOSE_PROPOSE2_PRODUCTS foreign key (ID_PRODUIT)
      references PRODUCTS (ID_PRODUIT)
      on update restrict
      on delete restrict;

