/*==============================================================*/
/* Table: ACCIDENTE_LABORAL                                     */
/*==============================================================*/
create table ACCIDENTE_LABORAL (
   ID_ACCIDENTE         INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   DESCRIPCION__ACCIDENTE VARCHAR(200)         not null,
   FECHA_ACCIDENTE      DATE                 not null,
   constraint PK_ACCIDENTE_LABORAL primary key (ID_ACCIDENTE)
);

/*==============================================================*/
/* Index: ACCIDENTE_LABORAL_PK                                  */
/*==============================================================*/
create unique index ACCIDENTE_LABORAL_PK on ACCIDENTE_LABORAL (
ID_ACCIDENTE
);

/*==============================================================*/
/* Index: PRESENTA_FK                                           */
/*==============================================================*/
create  index PRESENTA_FK on ACCIDENTE_LABORAL (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: ADMINISTRADOR_TH                                      */
/*==============================================================*/
create table ADMINISTRADOR_TH (
   ID_ADMINISTRADOR     INT4                 not null,
   ID_EMPRESA           INT4                 not null,
   CEDULA_ADMINISTRADOR VARCHAR(10)          not null,
   NOMBRE_ADMINISTRADOR VARCHAR(100)         not null,
   APELLIDOS_ADMINISTRADOR VARCHAR(100)         not null,
   TELEFONO_ADMINISTRADOR VARCHAR(10)          not null,
   DIRECCION_ADMINISTRADOR VARCHAR(100)         not null,
   CORREO_ADMINISTRADOR VARCHAR(100)         not null,
   constraint PK_ADMINISTRADOR_TH primary key (ID_ADMINISTRADOR)
);

/*==============================================================*/
/* Index: ADMINISTRADOR_TH_PK                                   */
/*==============================================================*/
create unique index ADMINISTRADOR_TH_PK on ADMINISTRADOR_TH (
ID_ADMINISTRADOR
);

/*==============================================================*/
/* Index: INTEGRA_FK                                            */
/*==============================================================*/
create  index INTEGRA_FK on ADMINISTRADOR_TH (
ID_EMPRESA
);

/*==============================================================*/
/* Table: ATRASO                                                */
/*==============================================================*/
create table ATRASO (
   ID_ATRASO            INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   FECHA_ATRASO         DATE                 not null,
   TIPO_ATRASO          VARCHAR(100)         not null,
   CANTIDAD_ATRASO      INT4                 not null,
   constraint PK_ATRASO primary key (ID_ATRASO)
);

/*==============================================================*/
/* Index: ATRASO_PK                                             */
/*==============================================================*/
create unique index ATRASO_PK on ATRASO (
ID_ATRASO
);

/*==============================================================*/
/* Index: SURGE_FK                                              */
/*==============================================================*/
create  index SURGE_FK on ATRASO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: CALAMIDAD_DOMESTICA                                   */
/*==============================================================*/
create table CALAMIDAD_DOMESTICA (
   ID_CALAMIDAD         INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   DESCRIPCION_CALAMIDAD VARCHAR(200)         not null,
   FECHA_CALAMIDAD      DATE                 not null,
   constraint PK_CALAMIDAD_DOMESTICA primary key (ID_CALAMIDAD)
);

/*==============================================================*/
/* Index: CALAMIDAD_DOMESTICA_PK                                */
/*==============================================================*/
create unique index CALAMIDAD_DOMESTICA_PK on CALAMIDAD_DOMESTICA (
ID_CALAMIDAD
);

/*==============================================================*/
/* Index: PASA_FK                                               */
/*==============================================================*/
create  index PASA_FK on CALAMIDAD_DOMESTICA (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   ID_CONTRATO          INT4                 not null,
   FECHA_CONTRATO       DATE                 not null,
   DURACION_CONTRATO    VARCHAR(100)         not null,
   SUELDO_CONTRATO      MONEY                not null,
   constraint PK_CONTRATO primary key (ID_CONTRATO)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
ID_CONTRATO
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO (
   ID_DEPARTAMENTO      INT4                 not null,
   ID_JEFE              INT4                 null,
   NOMBRE_DEPARTAMENTO  VARCHAR(200)         not null,
   FECHA_INGRESO        DATE                 not null,
   TOTAL_EMPLEADO       INT4                 not null,
   SUELDO_ANUAL         MONEY                not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: DEPARTAMENTO_PK                                       */
/*==============================================================*/
create unique index DEPARTAMENTO_PK on DEPARTAMENTO (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on DEPARTAMENTO (
ID_JEFE
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          INT4                 not null,
   ID_ADMINISTRADOR     INT4                 not null,
   ID_CONTRATO          INT4                 not null,
   ID_DEPARTAMENTO      INT4                 not null,
   CEDULA_EMPLEADO      VARCHAR(10)          not null,
   NOMBRE_EMPLEADO      VARCHAR(100)         not null,
   APELLIDOS_EMPLEADO   VARCHAR(100)         not null,
   TELEFONO_EMPLEADO    VARCHAR(10)          not null,
   DIRECCION_EMPLEADO   VARCHAR(100)         not null,
   CORREO_EMPLEADO      VARCHAR(100)         not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: ENCARGA_FK                                            */
/*==============================================================*/
create  index ENCARGA_FK on EMPLEADO (
ID_ADMINISTRADOR
);

/*==============================================================*/
/* Index: ESTABLECE_FK                                          */
/*==============================================================*/
create  index ESTABLECE_FK on EMPLEADO (
ID_CONTRATO
);

/*==============================================================*/
/* Index: LABORA_FK                                             */
/*==============================================================*/
create  index LABORA_FK on EMPLEADO (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID_EMPRESA           INT4                 not null,
   NOMBRE_EMPRESA       VARCHAR(100)         not null,
   DIRECCION_EMPPRESA   VARCHAR(100)         not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
);

/*==============================================================*/
/* Index: EMPRESA_PK                                            */
/*==============================================================*/
create unique index EMPRESA_PK on EMPRESA (
ID_EMPRESA
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO (
   ID_HORARIO           INT4                 not null,
   ID_DEPARTAMENTO      INT4                 not null,
   HORA_ENTRADA         TIME                 not null,
   HORA_SALIDA          TIME                 not null,
   HORA_EXTRAS          TIME                 not null,
   constraint PK_HORARIO primary key (ID_HORARIO)
);

/*==============================================================*/
/* Index: HORARIO_PK                                            */
/*==============================================================*/
create unique index HORARIO_PK on HORARIO (
ID_HORARIO
);

/*==============================================================*/
/* Index: DISPONE_FK                                            */
/*==============================================================*/
create  index DISPONE_FK on HORARIO (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: JEFE                                                  */
/*==============================================================*/
create table JEFE (
   ID_JEFE              INT4                 not null,
   CEDULA_JEFE          VARCHAR(10)          not null,
   NOMBRE_JEFE          VARCHAR(100)         not null,
   NUM_JEFE             INT4                 not null,
   constraint PK_JEFE primary key (ID_JEFE)
);

/*==============================================================*/
/* Index: JEFE_PK                                               */
/*==============================================================*/
create unique index JEFE_PK on JEFE (
ID_JEFE
);

/*==============================================================*/
/* Table: LLAMADO                                               */
/*==============================================================*/
create table LLAMADO (
   ID_LLAMADO_ATENCION  INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   TIPO_LLAMADO         VARCHAR(200)         not null,
   FECHA_LLAMADO        DATE                 not null,
   constraint PK_LLAMADO primary key (ID_LLAMADO_ATENCION)
);

/*==============================================================*/
/* Index: LLAMADO_PK                                            */
/*==============================================================*/
create unique index LLAMADO_PK on LLAMADO (
ID_LLAMADO_ATENCION
);

/*==============================================================*/
/* Index: RECIBE_FK                                             */
/*==============================================================*/
create  index RECIBE_FK on LLAMADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: PERMISO                                               */
/*==============================================================*/
create table PERMISO (
   ID_PERMISO           INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   FECHA_PERMISO        DATE                 not null,
   TIPO_PERMISO         VARCHAR(100)         not null,
   CANTIDAD_PERMISO     INT4                 not null,
   DURACION_PERMISO     INT4                 not null,
   constraint PK_PERMISO primary key (ID_PERMISO)
);

/*==============================================================*/
/* Index: PERMISO_PK                                            */
/*==============================================================*/
create unique index PERMISO_PK on PERMISO (
ID_PERMISO
);

/*==============================================================*/
/* Index: SOLICITA_FK                                           */
/*==============================================================*/
create  index SOLICITA_FK on PERMISO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: SEGURO                                                */
/*==============================================================*/
create table SEGURO (
   ID_SEGURO            INT4                 not null,
   ID_CONTRATO          INT4                 not null,
   TIPO_SEGURO          VARCHAR(100)         not null,
   PAGO_MENSUAL         MONEY                not null,
   constraint PK_SEGURO primary key (ID_SEGURO)
);

/*==============================================================*/
/* Index: SEGURO_PK                                             */
/*==============================================================*/
create unique index SEGURO_PK on SEGURO (
ID_SEGURO
);

/*==============================================================*/
/* Index: INCLUYE_FK                                            */
/*==============================================================*/
create  index INCLUYE_FK on SEGURO (
ID_CONTRATO
);

/*==============================================================*/
/* Table: VACACION                                              */
/*==============================================================*/
create table VACACION (
   ID_VACACION          INT4                 not null,
   ID_CONTRATO          INT4                 not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_FIN            DATE                 not null,
   constraint PK_VACACION primary key (ID_VACACION)
);

/*==============================================================*/
/* Index: VACACION_PK                                           */
/*==============================================================*/
create unique index VACACION_PK on VACACION (
ID_VACACION
);

/*==============================================================*/
/* Index: DETERMINA_FK                                          */
/*==============================================================*/
create  index DETERMINA_FK on VACACION (
ID_CONTRATO
);