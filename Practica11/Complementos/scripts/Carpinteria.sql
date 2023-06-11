CREATE TABLE EMPLEADO(
  ID_EMPLEADO NUMBER(5) CONSTRAINT EMPLEADO_PK PRIMARY KEY,
  APATERNO VARCHAR2(50) CONSTRAINT EMP_AP_NN NOT NULL,
  AMATERNO VARCHAR2(50),
  NOMBRE VARCHAR2(50) CONSTRAINT EMP_NOM_NN NOT NULL,
  TELEFONO NUMBER(10) CONSTRAINT EMP_TELE_NN NOT NULL
);

INSERT INTO EMPLEADO VALUES(1,'IBARRA','AGUILAR','ALEXIS',1234576543);
INSERT INTO EMPLEADO VALUES(2,'SANCHEZ','BONILLA','JOSE',1235576553);

SELECT * FROM EMPLEADO;

CREATE TABLE DIRECTOR(
  ID_DIRECTOR NUMBER(5) CONSTRAINT DIRECTOR_PK PRIMARY KEY,
  APATERNO VARCHAR2(50) CONSTRAINT DIRE_AP_NN NOT NULL,
  AMATERNO VARCHAR2(50),
  NOMBRE VARCHAR2(50) CONSTRAINT DIRE_NOM_NN NOT NULL,
  TELEFONO NUMBER(10) CONSTRAINT DIRE_TELE_NN NOT NULL
);

INSERT INTO DIRECTOR VALUES(1,'MARTINEZ','FELIX','MARIA',1224576583);
INSERT INTO DIRECTOR VALUES(2,'PEREZ','MONTELLANO','ALEJANDRO',1275576553);

SELECT * FROM DIRECTOR;

CREATE TABLE SUCURSAL(
  ID_SUCURSAL NUMBER(5) CONSTRAINT SUCURSAL_PK PRIMARY KEY,
  NOMBRE VARCHAR(100) CONSTRAINT NOM_SUC_NN NOT NULL
);

INSERT INTO SUCURSAL VALUES(1,'SUCURSAL 1');
INSERT INTO SUCURSAL VALUES(2,'SUCURSAL 2');
SELECT * FROM SUCURSAL;

CREATE TABLE TRABAJO(
  NUM_TRABAJO NUMBER(8) CONSTRAINT TRABAJO_PK PRIMARY KEY,
  ESTADO VARCHAR(25) CONSTRAINT EST_TRAB_NN NOT NULL
);

INSERT INTO TRABAJO VALUES(1,'MESA');
INSERT INTO TRABAJO VALUES(2,'SILLA');
SELECT * FROM TRABAJO;

CREATE TABLE MAQUINARIA(
  NUM_MAQUINA NUMBER(5) CONSTRAINT MAQUINARIA_PK PRIMARY KEY,
  NOMBRE VARCHAR(50) CONSTRAINT NOM_MAQ_NN NOT NULL,
  ESTADO VARCHAR(25) CONSTRAINT EST_MAQ_NN NOT NULL
);

INSERT INTO MAQUINARIA VALUES(1,'CORTADORA','OCUPADA');
INSERT INTO MAQUINARIA VALUES(2,'CORTADORA 2','OCUPADA');

SELECT * FROM MAQUINARIA;

CREATE TABLE DIRIGE(
  ID_EMPLEADO NUMBER(5),
  ID_DIRECTOR NUMBER(5),
  ID_SUCURSAL NUMBER(5),
  NUM_TRABAJO NUMBER(8),
  CONSTRAINT DIRIGE_PK PRIMARY KEY (ID_EMPLEADO,ID_DIRECTOR,ID_SUCURSAL,NUM_TRABAJO),
  CONSTRAINT EMP_DIR_FK FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO),
  CONSTRAINT DIR_DIR_FK FOREIGN KEY (ID_DIRECTOR) REFERENCES DIRECTOR(ID_DIRECTOR),
  CONSTRAINT SUC_DIR_FK FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL),
  CONSTRAINT TRA_DIR_FK FOREIGN KEY (NUM_TRABAJO) REFERENCES TRABAJO(NUM_TRABAJO)
);

INSERT INTO DIRIGE VALUES(1,1,1,1);
INSERT INTO DIRIGE VALUES(2,2,2,2);

SELECT * FROM DIRIGE;

CREATE TABLE TRABAJA_EN(
  ID_EMPLEADO NUMBER(5),
  ID_SUCURSAL NUMBER(5),
  NUM_TRABAJO NUMBER(8),
  CONSTRAINT TRABAJA_EN_PK PRIMARY KEY (ID_EMPLEADO,ID_SUCURSAL,NUM_TRABAJO),
  CONSTRAINT EMP_TRA_FK FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO),
  CONSTRAINT SUC_TRA_FK FOREIGN KEY (ID_SUCURSAL) REFERENCES SUCURSAL(ID_SUCURSAL),
  CONSTRAINT TRA_TRA_FK FOREIGN KEY (NUM_TRABAJO) REFERENCES TRABAJO(NUM_TRABAJO)
);

INSERT INTO TRABAJA_EN VALUES(1,1,1);
INSERT INTO TRABAJA_EN VALUES(2,2,2);

SELECT * FROM TRABAJA_EN;

COMMIT;













