CREATE TABLE TABLE_HECHOS(
          ID_HECHO INT IDENTITY(1,1) PRIMARY KEY,
          ID_CUENTA INT,
          ID_CADENCIA INT,
          ID_ESTADO INT,
          ID_PROGRAMA INT,
          ID_INDUSTRIA INT,
          ID_REGION INT,
          ID CARGO INT,
          ID_TAMANO INT,
          ID_LISTA INT,
          CANT_PROSPECTOS INT,
          ENVIOS INT,
          APERTURA FLOAT,
          RESPUESTAS FLOAT,
          POSITIVAS FLOAT,
          NEUTRAS FLOAT,
          NEGATIVAS FLOAT,
          CITA_AGENDADA FLOAT


);


CREATE TABLE TABLA_LEAD(
          ID_LEAD INT IDENTITY(1,1) PRIMARY KEY,
          ID_LISTA INT,
          ID_CADENCIA INT,
          ID_INDUSTRIA INT,
          ID_REGION INT,
          ID_TAMANO INT,
          NOMBRE VARCHAR(255),
          APELLIDO VARCHAR(255),
          TITULO VARCHAR(255),
          COMPANIA VARCHAR(255),
          TAMANO VARCHAR(255),
          INDUSTRIA VARCHAR(255),
          EMAIL VARCHAR(255)
          
);

CREATE TABLE CUENTA(
	ID_CUENTA INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_CUENTA NVARCHAR(255)
                       );

CREATE TABLE CADENCIA(
	ID_CADENCIA INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_CADENCIA NVARCHAR(255)
                       );  

CREATE TABLE ESTADO_DE_CADENCIA(
	ID_ESTADO INT IDENTITY(1,1) PRIMARY KEY,
	ESTADO_CADENCIA NVARCHAR(255)
                       );             

CREATE TABLE PROGRAMA(
	ID_PROGRAMA INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_PROGRAMA NVARCHAR(255)
                       );  

CREATE TABLE INDUSTRIA(
	ID_INDUSTRIA INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_INDUSTRIA NVARCHAR(255)
                       );       


CREATE TABLE REGION(
	ID_REGION INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_REGION NVARCHAR(255)
                       );     

 
CREATE TABLE CARGO(
	ID_CARGO INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_CARGO NVARCHAR(255)
                       );  


CREATE TABLE TAMANO_DE_EMPRESA(
	ID_TAMANO INT IDENTITY(1,1) PRIMARY KEY,
	TAMANO_EMPRESA NVARCHAR(255)
                       );    

 
CREATE TABLE LISTA(
	ID_LISTA INT IDENTITY(1,1) PRIMARY KEY,
	NOMBRE_LISTA NVARCHAR(255)
                       );  



ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK1_TABLA_HECHOS
FOREIGN KEY (ID_CUENTA)
REFERENCES CUENTA(ID_CUENTA)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK2_TABLA_HECHOS
FOREIGN KEY (ID_CADENCIA)
REFERENCES CADENCIA(ID_CADENCIA)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK3_TABLA_HECHOS
FOREIGN KEY (ID_ESTADO)
REFERENCES ESTADO_DE_CADENCIA(ID_CADENCIA)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK4_TABLA_HECHOS
FOREIGN KEY (ID_PROGRAMA)
REFERENCES PROGRAMA(ID_PROGRAMA)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK5_TABLA_HECHOS
FOREIGN KEY (ID_INDUSTRIA)
REFERENCES INDUSTRIA(ID_INDUSTRIA)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK6_TABLA_HECHOS
FOREIGN KEY (ID_REGION)
REFERENCES REGION(ID_REGION)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK7_TABLA_HECHOS
FOREIGN KEY (ID_CARGO)
REFERENCES CARGO(ID_CARGO)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK8_TABLA_HECHOS
FOREIGN KEY (ID_TAMANO)
REFERENCES TAMANO_DE_EMPRESA(ID_TAMANO)
ALTER TABLE TABLA_HECHOS 
ADD CONSTRAINT FK9_TABLA_HECHOS
FOREIGN KEY (ID_LISTA)
REFERENCES LISTA(ID_LISTA)

ALTER TABLE TABLA_LEAD 
ADD CONSTRAINT FK1_TABLA_LEAD
FOREIGN KEY (ID_LISTA)
REFERENCES LISTA(ID_LISTA)
ALTER TABLE TABLA_LEAD 
ADD CONSTRAINT FK2_TABLA_LEAD
FOREIGN KEY (ID_CADENCIA)
REFERENCES CADENCIA(ID_CADENCIA)
ALTER TABLE TABLA_LEAD 
ADD CONSTRAINT FK3_TABLA_LEAD
FOREIGN KEY (ID_INDUSTRIA)
REFERENCES INDUSTRIA(ID_INDUSTRIA)
ALTER TABLE TABLA_LEAD 
ADD CONSTRAINT FK4_TABLA_LEAD
FOREIGN KEY (ID_REGION)
REFERENCES REGION(ID_REGION)
ALTER TABLE TABLA_LEAD 
ADD CONSTRAINT FK5_TABLA_LEAD
FOREIGN KEY (ID_TAMANO)
REFERENCES TAMANO_DE_EMPRESA(ID_TAMANO)





