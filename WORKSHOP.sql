/*1.- Análisis de docentes por camada:
- Numero de documento, nombre de docente y camada para identificar la camada mayor y la menor según el numero de la camada.
- Numero de documento, nombre de docente y camada para identificar la camada con fecha de ingreso Mayo 2021.
- Agregar un campo indicador  que informe  cuales son los registros mayor o menor y los que son de mayo 2021 
	y ordenar el listado de menor a mayor por cada*/ 

	
	--1
SELECT STA.Documento, STA.Nombre, REPLACE (STA.Camada,'camada',' ') as Camada
FROM [dbo].[Staff] AS STA
WHERE (STA.CAMADA =(SELECT MAX(STA2.CAMADA) FROM  [dbo].[Staff] as STA2)
OR STA.CAMADA =(SELECT MIN(STA3.CAMADA) FROM  [dbo].[Staff] as STA3))
ORDER BY STA.Camada DESC


--2
SELECT STA.Documento, STA.Nombre, REPLACE (STA.Camada,'camada',' ') as Camada, STA.[Fecha Ingreso]
FROM [dbo].[Staff] AS STA
WHERE STA.[Fecha Ingreso] between '2021-05-01' and '2021-05-31'
ORDER BY STA.Camada ASC 

--3
SELECT STA.Documento, STA.Nombre, REPLACE (STA.Camada,'camada',' ') as Camada, STA.[Fecha Ingreso], 'Mayor o menor' AS INDICADOR
FROM [dbo].[Staff] AS STA
WHERE (STA.CAMADA =(SELECT MAX(STA2.CAMADA) FROM  [dbo].[Staff] as STA2)
OR STA.CAMADA =(SELECT MIN(STA3.CAMADA) FROM  [dbo].[Staff] as STA3))
UNION
SELECT STA.Documento, STA.Nombre, REPLACE (STA.Camada,'camada',' ') as Camada, STA.[Fecha Ingreso], 'MAYO 2021' AS INDICADOR
FROM [dbo].[Staff] AS STA
WHERE STA.[Fecha Ingreso] between '2021-05-01' and '2021-05-31'
ORDER BY Camada


/*2 .Analisis diario de estudiantes:
por medio de la fecha de ingreso de los estudiantes identificar: cantidad total de estudiantes
- mostrar los periodos de tiempo separados por año , mes y dia, y presentar la informacion ordenada 
por la fecha que mas ingresaron estudiantes*/

SELECT EST.[Fecha Ingreso], COUNT(*) AS Cantidad
FROM [dbo].[Estudiantes] AS EST
GROUP BY EST.[Fecha Ingreso]
ORDER BY 2 DESC

SELECT YEAR(EST.[Fecha Ingreso]) AS YEAR, MONTH(EST.[Fecha Ingreso]) AS MONTH, DAY(EST.[Fecha Ingreso]) AS DAY, COUNT(*) AS Cantidad
FROM [dbo].[Estudiantes] AS EST
GROUP BY EST.[Fecha Ingreso]
ORDER BY 4 DESC

/*3. ANALISIS DE ENCARGADOS CON MAS DOCENTES A CARGO:
-IDENTIFICAR EL TOP 10 DE LOS ENCARGADOS QUE TIENEN MAS DOCENTES A CARGO, FILTRAR SOLO LOS QUE TIENEN A CARGO DOCENTES
- ORDENAR DE MAYOR A MENOR PARA PODER	TENER EL LISTADO COMPLETO*/

--
SELECT TOP 10 ENC.Encargado_ID, COUNT(*) AS CANTIDAD
FROM [dbo].[Encargado] AS ENC
INNER JOIN  [dbo].[Staff] AS ST
	ON ENC.Encargado_ID=ST.Encargado
GROUP BY ENC.Encargado_ID
ORDER BY 2 DESC


--4

SELECT PR.Profesiones,COUNT(*) AS CANTIDAD
FROM  [dbo].[Estudiantes] AS EST, 
	[dbo].[Profesiones] AS PR
WHERE EST.Profesion=PR.ProfesionesID
GROUP BY PR.Profesiones
HAVING COUNT(*)>=5
ORDER BY 2 DESC


SELECT * FROM [dbo].[Profesiones]
SELECT * FROM [dbo].[Area]
SELECT * FROM [dbo].[Asignaturas]
SELECT * FROM  [dbo].[Estudiantes]
SELECT * FROM  [dbo].[Encargado]
SELECT * FROM  [dbo].[Staff]
--5
SELECT  AR.NOMBRE AS NOMBRE_AREA, ASI.TIPO, ASI.JORNADA, COUNT(EstudiantesID) as CANT_ESTUDIANTES, SUM(ASI.COSTO) AS TOTAL_COSTO
FROM [dbo].[Estudiantes] AS EST
LEFT JOIN  [dbo].[Staff] AS ST
 ON EST.Docente=ST.DocentesID 
LEFT JOIN [dbo].[Asignaturas] AS  ASI	
	ON ST.DocentesID=EST.Docente
INNER JOIN [dbo].[Area] AS AR
	ON ASI.Area=AR.AreaID
GROUP BY  AR.Nombre, asi.Tipo, asi.Jornada
ORDER BY 5 DESC;



SELECT AR.Nombre, ASI.Tipo, ASI.Jornada, COUNT([EstudiantesID]) as Cantidad_Estudiantes, SUM(ASI.[Costo]) As Total_Costo
FROM [dbo].[Asignaturas] as ASI
JOIN [dbo].[Area] as AR
ON ASI.Area = [AreaID]
LEFT JOIN [dbo].[Staff] as STA
ON ASI.[AsignaturasID] = STA.Asignatura
LEFT JOIN [dbo].[Estudiantes] as EST
ON Est.Docente = STA.[DocentesID]
GROUP BY Ar.Nombre, Asi.Tipo, Asi.Jornada
ORDER BY Total_Costo DESC

--6

SELECT ASI.AREA, CONCAT(YEAR(EST.[Fecha de Nacimiento]),MONTH(EST.[Fecha de Nacimiento])) AS Fecha , COUNT([EstudiantesID]) AS CANT_ESTUDIANTES, SUM([Costo]) as COSTO_TOTAL
FROM [dbo].[Asignaturas] as ASI
JOIN [dbo].[Staff] AS ST
	ON ST.Asignatura= ASI.AsignaturasID
JOIN [dbo].[Estudiantes] AS EST
	ON EST.Docente=ST.DocentesID
GROUP BY ASI.AREA , CONCAT(YEAR(EST.[Fecha de Nacimiento]),MONTH(EST.[Fecha de Nacimiento]))
ORDER BY Fecha DESC, CANT_ESTUDIANTES DESC

SELECT Asi.Area, CONCAT(YEAR(EST.[Fecha Ingreso]),MONTH(EST.[Fecha Ingreso])) AS Fecha, COUNT([EstudiantesID]) as Cantidad_Estudiantes, SUM([Costo])
FROM [dbo].[Asignaturas] as ASI
JOIN [dbo].[Staff] as STA
ON STA.Asignatura = ASI.AsignaturasID
JOIN [dbo].[Estudiantes] as EST
ON EST.Docente= STA.DocentesID
GROUP BY Asi.Area, CONCAT(YEAR(EST.[Fecha Ingreso]),MONTH(EST.[Fecha Ingreso]))
ORDER BY Fecha DESC, Cantidad_Estudiantes DESC


--7

SELECT ENC.Nombre, ENC.Apellido , ENC.Documento, REPLACE(STA.CAMADA,'CAMADA','') AS CAMADA, STA.[Fecha Ingreso]
FROM [dbo].[Encargado] AS ENC
JOIN [dbo].[Staff] AS STA
	ON STA.Encargado=ENC.Encargado_ID
ORDER BY CAMADA DESC

--8
SELECT ASI.Nombre, ASI.Jornada, ASI.Area, COUNT(ASI.AsignaturasID) AS ASIGNATURA
FROM [dbo].[Asignaturas] AS ASI
JOIN [dbo].[Staff] AS STA
ON STA.Asignatura=ASI.AsignaturasID
GROUP BY ASI.Nombre, ASI.Jornada, ASI.Area


