CREATE TABLE CLIENTE(
  ID_CLIENTE NUMBER(5) CONSTRAINT CLIENTE_PK PRIMARY KEY,
  APATERNO VARCHAR2(35) CONSTRAINT CLI_AP_NN NOT NULL,
  AMATERNO VARCHAR2(35),
  NOMBRE VARCHAR2(50) CONSTRAINT CLI_NOM_NN NOT NULL,
  TELEFONO NUMBER(10) CONSTRAINT CLI_TELE_NN NOT NULL
);

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES(1,'FLORES','FELIX','JUAN',1234567893);
INSERT INTO CLIENTE VALUES(2,'MARTINEZ','TELLEZ','PEDRO',6749386725);

CREATE TABLE AUTOMOVIL(
  MATRICULA CHAR(8) CONSTRAINT AUTOMOVIL_PK PRIMARY KEY,
  MARCA VARCHAR2(50) CONSTRAINT AUT_MAR_NN NOT NULL,
  MODELO VARCHAR2(50) CONSTRAINT AUT_MOD_NN NOT NULL,
  COLOR VARCHAR2(30)
);

SELECT * FROM AUTOMOVIL;

INSERT INTO AUTOMOVIL VALUES('63SDF352','HONDA','CIVIC','NEGRO');
INSERT INTO AUTOMOVIL VALUES('82JHD832','NISSAN','CENTRA','BLANCO');

CREATE TABLE PERTENECE(
  ID_CLIENTE NUMBER(5),
  MATRICULA CHAR(8),
  FECHA DATE,
  CONSTRAINT PERTENECE_PK PRIMARY KEY(ID_CLIENTE,MATRICULA,FECHA),
  CONSTRAINT CLI_PER_FK FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
  CONSTRAINT AUT_PER_FK FOREIGN KEY (MATRICULA) REFERENCES AUTOMOVIL(MATRICULA)
);

SELECT * FROM PERTENECE;

INSERT INTO PERTENECE VALUES(1,'63SDF352','15/05/2020');
INSERT INTO PERTENECE VALUES(2,'82JHD832','15/05/2020');

CREATE TABLE MATERIAL(
  ID_MATERIAL NUMBER(5) CONSTRAINT MATERIAL_PK PRIMARY KEY,
  NOMBRE_MAT VARCHAR(50) CONSTRAINT NOM_MAT_NN NOT NULL
);

SELECT * FROM MATERIAL;

INSERT INTO MATERIAL VALUES(1,'TUERCA');
INSERT INTO MATERIAL VALUES(2,'BUJIA');

CREATE TABLE COMBUSTIBLE(
  ID_COMBUSTIBLE NUMBER(5) CONSTRAINT COMBUSTIBLE_PK PRIMARY KEY,
  NOMBRE_COM VARCHAR(50) CONSTRAINT NOM_COM_NN NOT NULL,
  PRECIO NUMBER(7,2) CONSTRAINT PRE_COM_NN NOT NULL,
  CANTIDAD NUMBER(5) CONSTRAINT CAN_COM_NN NOT NULL
);

SELECT * FROM COMBUSTIBLE;

INSERT INTO COMBUSTIBLE VALUES(1,'GASOLINA',20.20,1000);
INSERT INTO COMBUSTIBLE VALUES(2,'ACEITE MOTOR',80.45,200);

CREATE TABLE REPARACION(
  ID_REVISION NUMBER(8),
  FECHA_REP DATE CONSTRAINT FE_REP_NN NOT NULL,
  ID_MATERIAL NUMBER(5),
  ID_COMBUSTIBLE NUMBER(5),
  ID_CLIENTE NUMBER(5),
  MATRICULA CHAR(8),
  FECHA DATE,
  CONSTRAINT REPARACION_PK PRIMARY KEY(ID_REVISION,ID_MATERIAL,ID_COMBUSTIBLE,ID_CLIENTE,MATRICULA,FECHA),
  CONSTRAINT MAT_REP_FK FOREIGN KEY(ID_MATERIAL) REFERENCES MATERIAL(ID_MATERIAL),
  CONSTRAINT COM_REP_FK FOREIGN KEY(ID_COMBUSTIBLE) REFERENCES COMBUSTIBLE(ID_COMBUSTIBLE),
  CONSTRAINT PER_REP_FK FOREIGN KEY(ID_CLIENTE,MATRICULA,FECHA) REFERENCES PERTENECE(ID_CLIENTE,MATRICULA,FECHA)
);

INSERT INTO REPARACION VALUES(1,'15/01/15',1,1,1,'63SDF352','15/05/2020');
INSERT INTO REPARACION VALUES(2,'16/02/16',2,2,2,'82JHD832','15/05/2020');

SELECT * FROM REPARACION;

COMMIT;









