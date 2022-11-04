--JOIN
	SELECT Asi.Nombre AS Asignatura, Asi.tipo, Asi.Jornada, Ar.Nombre AS Area
	FROM [dbo].[Asignaturas] AS Asi
JOIN [dbo].[Area] AS Ar
	ON Asi.Area = Ar.AreaID;

--LEFT JOIN
SELECT Ar.Nombre AS Area, Asi.Nombre AS Asignatura
FROM [dbo].[Area] AS Ar
LEFT JOIN [dbo].[Asignaturas] AS Asi
	ON Ar.AreaID = Asi.Area;
		
--RIGHT JOIN
SELECT Ar.Nombre AS Area, Asi.Nombre AS Asignatura
FROM [dbo].[Asignaturas] AS Asi
RIGHT JOIN [dbo].[Area] AS Ar
	ON Ar.AreaID = Asi.Area;
		
SELECT Ar.Nombre AS Area, Asi.Nombre AS Asignatura
FROM [dbo].[Area] AS Ar
FULL OUTER JOIN [dbo].[Asignaturas] AS Asi
	ON Ar.AreaID = Asi.Area;

--DOUBLEJOIN
SELECT Es.Nombre AS Estudiante, Do.Nombre AS Docente, Pr.Profesion AS Profesion
FROM [dbo].[Estudiantes] AS Es
JOIN [dbo].[Staff] AS Do
	ON Es.Docente = Do.DocentesID
LEFT JOIN [dbo].[Estudiantes] AS Pr
	ON Es.Profesion = Pr.Profesion;



	/*1.Indicar por jornada la cantidad de docentes que dictan y sumar los costos.
Esta información solo se desea visualizar para las asignaturas de desarrollo web.
El resultado debe contener todos los valores registrados en la primera tabla,
Renombrar la columna del calculo de la cantidad de docentes como cant_docentes y
la columna de la suma de los costos como suma_total. Keywords: Asignaturas,Staff, DocentesID, Jornada, Nombre, costo*/


SELECT Asi.Jornada, COUNT(Do.DocentesID) AS CANT_DOCENTES, SUM(Asi.Costo) AS SUMA_TOTAL
FROM [dbo].[Asignaturas] AS Asi
INNER JOIN [dbo].[Staff] AS Do
    ON Asi.AsignaturasID = Do.Asignatura
WHERE Asi.Nombre LIKE '%WEB%'
GROUP BY Asi.Jornada

/*2. Se requiere saber el id del encargado, el nombre, el apellido y cuantos son los docentes
que tiene asignados cada encargado. Luego filtrar los encargados que tienen como resultado 0
ya que son los encargados que NO tienen asignado un docente. Renombrar el campo de la operación como Cant_Docentes.
Keywords: Docentes_id, Encargado, Staff, Nombre, Apellido,Encargado_ID. */


SELECT En.Encargado_ID, En.Nombre , En.Apellido , COUNT(St.DocentesID) AS CANT_DOCENTES
FROM [dbo].[Encargado] AS En
INNER JOIN  [dbo].[Staff] AS St
	ON En.Encargado_ID = St.Encargado
GROUP BY EN.Encargado_ID,EN.Nombre, EN.Apellido;

--3
	 
SELECT Asi.Nombre, COUNT(Do.DocentesID) AS Cant_docentes
FROM [dbo].[Staff] AS Do
RIGHT JOIN [dbo].[Asignaturas] AS Asi
	ON Do.Asignatura = Asi.AsignaturasID
GROUP BY Asi.Nombre
HAVING COUNT(Do.DocentesID)=0;




