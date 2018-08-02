
CREATE TABLE ACTIVIDAD 
(
   ID_ACTIVIDAD         int                           NOT NULL,
   NOMBRE_ACTIVIDAD     char(150)                       NOT NULL,
   LUGAR_ACTIVIDAD      char(150)                        NOT NULL,
   COSTEPP_ACTIVIDAD    decimal                        NOT NULL,
   DESCRIPCION_ACTIVIDAD char(150)                        NOT NULL,
   IMAGEN_ACTIVIDAD     char(150)                         NOT NULL,
   CONSTRAINT PK_ACTIVIDAD primary key  (ID_ACTIVIDAD)
);

CREATE TABLE ALOJAMIENTO 
(
   ID_ALOJAMIENTO       int                           NOT NULL,
   NOMBRE_ALOJAMIENTO   char(150)                        NOT NULL,
   TIPO_ALOJAMIENTO     char(150)                        NOT NULL,
   PRECIOTA_AD_ALOJAMIENTO decimal                       NOT NULL,
   PRECIOTB_AD_ALOJAMIENTO decimal                       NOT NULL,
   PRECIOTA_NI_ALOJAMIENTO decimal                       NOT NULL,
   PRECIOTB_NI_ALOJAMIENTO decimal                       NOT NULL,
   DIRECCION_ALOJAMIENTO char(150)                        NOT NULL,
   CIUDAD_ALOJAMIENTO   char(150)                        NOT NULL,
   PROVINCIA_ALOJAMIENTO char(150)                        NOT NULL,
   TELEFONO_ALOJAMIENTO char(150)                        NOT NULL,
   DESCRIPCION_ALOJAMIENTO char(150)                        NOT NULL,
   IMAGEN_ALOJAMIENTO   char(150)                        NOT NULL,
   CONSTRAINT PK_ALOJAMIENTO primary key  (ID_ALOJAMIENTO)
);

CREATE TABLE CLIENTE 
(
   ID_CLIENTE           int                           NOT NULL,
   CI_CLIENTE           char(150)                        NOT NULL,
   CONTRASENIA_CLIENTE  char(150)                        NOT NULL,
   NOMBRES_CLIENTE      char(150)                        NOT NULL,
   APELLIDOS_CLIENTE    char(150)                        NOT NULL,
   DIRECCION_CLIENTE    char(150)                       NOT NULL,
   CIUDAD_CLIENTE       char(150)                        NOT NULL,
   PROVINCIA_CLIENTE    char(150)                       NOT NULL,
   POSTAL_CLIENTE       char(150)                       NOT NULL,
   TELEFONO_CLIENTE     char(150)                       NOT NULL,
   FECHA_NACIMIENTO_CLIENTE DATE                          NOT NULL,
   EMAIL_CLIENTE        char(150)                       NOT NULL,
   BARRIO_CLIENTE       char(150)                       NOT NULL,
   CONSTRAINT PK_CLIENTE primary key  (ID_CLIENTE)
);

CREATE TABLE DESTINO 
(
   ID_DESTINO           int                           NOT NULL,
   DESTINO_DESTINO      char(150)                       NOT NULL,
   IMAGEN_DESTINO       char(150)                         NOT NULL,
   DESCRIPCION_DESTINO  char(150)                       NOT NULL,
   PRECIO_BASE          decimal                       NOT NULL,
   CONSTRAINT PK_DESTINO primary key  (ID_DESTINO)
);


CREATE TABLE DETALLE_VIAJE_ACTIVIDAD 
(
   ID_DETALLE_VIAJE_ACTIVIDAD int                           NOT NULL,
   ID_VIAJE             int                           NOT NULL,
   ID_ACTIVIDAD         int                           NOT NULL,
   PRECIO               decimal                       NOT NULL,
   CONSTRAINT PK_DETALLE_VIAJE_ACTIVIDAD primary key  (ID_DETALLE_VIAJE_ACTIVIDAD)
);

CREATE TABLE EMPLEADO 
(
   ID_EMPLEADO          int                           NOT NULL,
   CI_EMPLEADO          char(150)                       NOT NULL,
   CONTRASENIA_EMPLEADO char(150)                       NOT NULL,
   NOMBRES_EMPLEADO     char(150)                       NOT NULL,
   APELLIDOS_EMPLEADO   char(150)                       NOT NULL,
   CARGO_EMPLEADO       char(150)                       NOT NULL,
   DIRECCION_EMPLEADO   char(150)                       NOT NULL,
   CIUDAD_EMPLEADO      char(150)                       NOT NULL,
   PROVINCIA_EMPLEADO   char(150)                       NOT NULL,
   POSTAL_EMPLEADO      char(150)                       NOT NULL,
   EMAIL_EMPLEADO       char(150)                       NOT NULL,
   TELEFONO_EMPLEADO    char(150)                       NOT NULL,
   FECHA_NACIMIENTO_EMPLEADO DATE                          NOT NULL,
   FECHA_CONTRATACION_EMPLEADO DATE                          NOT NULL,
   SUELDO_EMPLEADO      decimal                       NOT NULL,
   CONSTRAINT PK_EMPLEADO primary key  (ID_EMPLEADO)
);

CREATE TABLE TRANSPORTE 
(
   ID_TRANSPORTE        int                           NOT NULL,
   DESTINO_TRANSPORTE   char(150)                       NOT NULL,
   TIPO_TRANSPORTE      char(150)                       NOT NULL,
   PRECIOTA_AD_TRANSPORTE decimal                       NOT NULL,
   PRECIOTB_AD_TRANSPORTE decimal                       NOT NULL,
   PRECIOTA_NI_TRANSPORTE decimal                       NOT NULL,
   PRECIOTB_NI_TRANSPORTE decimal                       NOT NULL,
   CONSTRAINT PK_TRANSPORTE primary key  (ID_TRANSPORTE)
);

CREATE TABLE VIAJE 
(
   ID_VIAJE             int                           NOT NULL,
   ID_CLIENTE           int                           NOT NULL,
   ID_EMPLEADO          int                           NOT NULL,
   ID_ALOJAMIENTO       int                           NOT NULL,
   PR_ALOJAMIENTO       decimal                       NOT NULL,
   ID_TRANSPORTE        int                           NOT NULL,
   PR_TRANSPORTE        decimal                       NOT NULL,
   ID_DESTINO           int                           NOT NULL,
   PR_DESTINO           decimal                       NOT NULL,
   FECHA_SALIDA         DATE                          NOT NULL,
   FECHA_VUELTA         DATE                          NOT NULL,
   TEMPORADA            char(150)                       NOT NULL,
   FORMA_PAGO           char(150)                       NOT NULL,
   NUMERO_ADULTOS       int                           NOT NULL,
   NUMERO_NINOS         int                           NOT NULL,
   CONFIRMADO           int                           NOT NULL,
   SUBTOTAL             decimal                       NOT NULL,
   DESCUENTO            decimal                       NOT NULL,
   PRESUPUESTO          decimal                       NOT NULL,
   PR_ACTIVIDAD         decimal                       NOT NULL,
   CONSTRAINT PK_VIAJE primary key  (ID_VIAJE)
);

ALTER TABLE DETALLE_VIAJE_ACTIVIDAD
   ADD CONSTRAINT FK_DETALLE__REFERENCE_VIAJE FOREIGN KEY (ID_VIAJE)
      REFERENCES VIAJE (ID_VIAJE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DETALLE_VIAJE_ACTIVIDAD
   ADD CONSTRAINT FK_DETALLE__REFERENCE_ACTIVIDA FOREIGN KEY (ID_ACTIVIDAD)
      REFERENCES ACTIVIDAD (ID_ACTIVIDAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE VIAJE
   ADD CONSTRAINT FK_VIAJE_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE VIAJE
   ADD CONSTRAINT FK_VIAJE_REFERENCE_EMPLEADO FOREIGN KEY (ID_EMPLEADO)
      REFERENCES EMPLEADO (ID_EMPLEADO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE VIAJE
   ADD CONSTRAINT FK_VIAJE_REFERENCE_DESTINO FOREIGN KEY (ID_DESTINO)
      REFERENCES DESTINO (ID_DESTINO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE VIAJE
   ADD CONSTRAINT FK_VIAJE_REFERENCE_ALOJAMIE FOREIGN KEY (ID_ALOJAMIENTO)
      REFERENCES ALOJAMIENTO (ID_ALOJAMIENTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE VIAJE
   ADD CONSTRAINT FK_VIAJE_REFERENCE_TRANSPOR FOREIGN KEY (ID_TRANSPORTE)
      REFERENCES TRANSPORTE (ID_TRANSPORTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;
