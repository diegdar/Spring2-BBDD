/*
NOTAS🗒️:
1: La primera consulta es menos eficiente. La función LIKE debe comparar cada carácter de la cadena "%1999%" con cada carácter de la fecha de nacimiento. Esto puede ser muy costoso si la tabla persona tiene muchos registros.
La segunda consulta es más precisa. La función LIKE puede devolver registros que no cumplan con el requisito de que el año de nacimiento sea 1999. Por ejemplo, la cadena "2019-12-31" devolvería un registro de la tabla persona con el año de nacimiento 2019.

 */
-- 1.	Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT  apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC , nombre ASC ;
-- 2.	Averigua el nombre y los dos apellidos de los/as alumnos/as que no han dado de alta su número de teléfono en la base de datos.
SELECT  nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL ;
-- 3.	Devuelve el listado de los alumnos/as que nacieron en 1999.	
SELECT  nombre, apellido1, apellido2 FROM persona WHERE fecha_nacimiento LIKE "%1999%" ; -- nota 1
SELECT  nombre, apellido1, apellido2 FROM persona WHERE YEAR(fecha_nacimiento)= 1999 ; -- nota 1
-- 4.	Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT  nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE "%K" ;
-- 5.	Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT a.nombre FROM asignatura a JOIN grado g ON a.id_grado = g.id  WHERE a.cuatrimestre= 1 AND a.curso= 3 AND g.id = 7;
-- 6.	Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados/as. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT per.apellido1, per.apellido2, per.nombre AS nom_profesor, dep.nombre AS departamento FROM persona per JOIN profesor prof ON per.id = prof.id_profesor JOIN departamento dep ON dep.id = prof.id_departamento ORDER BY per.apellido1 ASC, per.apellido2 ASC, per.nombre ASC;
-- 7.	Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT asig.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura asig JOIN alumno_se_matricula_asignatura am ON am.id_asignatura = asig.id JOIN persona per ON per.id = am.id_alumno JOIN curso_escolar ce ON ce.id = am.id_curso_escolar WHERE per.tipo = 'alumno' AND nif = '26902806M';
-- 8.	Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT dep.nombre AS departamento FROM departamento dep JOIN profesor prof ON prof.id_departamento = dep.id JOIN asignatura asig ON asig.id_profesor = prof.id_profesor JOIN grado g ON g.id = asig.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9.	Devuelve un listado con todos los alumnos/as que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT per.nombre, per.apellido1, per.apellido2, am.id_alumno FROM persona per JOIN alumno_se_matricula_asignatura am ON per.id = am.id_alumno JOIN asignatura asig ON asig.id = am.id_asignatura JOIN curso_escolar ce ON ce.id = am.id_curso_escolar WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin='2019';
	/*LEFT JOIN y RIGHT JOIN */
-- 1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados/as. El listado también debe mostrar aquellos profesores/as que NO tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
	SELECT dep.nombre AS departamento, per.apellido1, per.apellido2, per.nombre 
	FROM persona per 
	LEFT JOIN profesor prof 
		ON prof.id_profesor = per.id 
	LEFT JOIN departamento dep 
		ON dep.id = prof.id_departamento 
	WHERE per.tipo = "profesor"
	ORDER BY dep.nombre, per.apellido1, per.apellido2, per.nombre;
-- 2.	Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT per.apellido1, per.apellido2, per.nombre 
FROM persona per LEFT JOIN profesor prof 
	ON prof.id_profesor = per.id 
LEFT JOIN departamento dep 
	ON dep.id = prof.id_departamento 
WHERE prof.id_profesor IS NULL
	AND per.tipo = "profesor";
-- 3.	Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT dep.id, dep.nombre AS departamento 
FROM persona per JOIN profesor prof 
	ON prof.id_profesor = per.id 
RIGHT JOIN departamento dep 
	ON dep.id = prof.id_departamento 
WHERE prof.id_departamento IS NULL;
-- 4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT per.nombre, per.apellido1, per.apellido2, prof.id_profesor 
FROM persona per 
LEFT JOIN profesor prof 
	ON prof.id_profesor = per.id 
LEFT JOIN asignatura asig 
	ON asig.id_profesor = prof.id_profesor 
WHERE asig.id_profesor IS NULL
	AND per.tipo="profesor";
-- 5.	Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT a.nombre AS asignatura FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE p.id_profesor IS NULL; 
-- 6.	Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.nombre AS nombre_departamento
FROM departamento d
LEFT JOIN profesor pr 
	ON d.id = pr.id_departamento
LEFT JOIN asignatura a 
	ON pr.id_profesor = a.id_profesor
LEFT JOIN alumno_se_matricula_asignatura ama 
	ON a.id = ama.id_asignatura
WHERE ama.id_asignatura IS NULL
GROUP BY d.nombre;
	/*Consultas resumen: */
-- 1.	Devuelve el número total de alumnos que existen.
SELECT COUNT(pr.tipo) AS num_alumnos FROM persona pr WHERE pr.tipo = 'alumno';
-- 2.	Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(pr.tipo) AS num_alumnos FROM persona pr WHERE pr.fecha_nacimiento LIKE '%1999%';
-- 3.	Calcula cuántos/as profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y deberá estar ordenado de mayor a menor por el número de profesores/as.
SELECT dep.nombre AS nombre_departamento, COUNT(per.id) AS numero_profesores FROM departamento dep JOIN profesor prof ON prof.id_departamento = dep.id JOIN persona per ON per.id = prof.id_profesor GROUP BY dep.nombre ORDER BY numero_profesores DESC;
-- 4.	Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Ten en cuenta que pueden existir departamentos que no tienen profesores/as asociados/as. Estos departamentos también deben aparecer en el listado.
SELECT dep.nombre AS nom_departamento, COUNT(prof.id_departamento) AS num_profesores FROM departamento dep LEFT JOIN profesor prof  ON prof.id_departamento = dep.id GROUP BY nom_departamento;
-- 5.	Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre AS nombre_grado, COUNT(asig.id_grado) AS num_asignaturas FROM grado g LEFT JOIN asignatura asig ON asig.id_grado = g.id GROUP BY nombre_grado ORDER BY num_asignaturas DESC;
-- 6.	Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT grado.nombre, COUNT(asignatura.id) AS numero_asignaturas FROM grado JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id) > 40 ORDER BY numero_asignaturas DESC;
-- 7.	Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
SELECT g.nombre AS nom_grado, asig.tipo AS tipo_asignatura ,sum(asig.creditos) AS total_creditos FROM grado g JOIN asignatura asig ON g.id = asig.id_grado GROUP BY nom_grado, tipo_asignatura;
-- 8.	Devuelve un listado que muestre cuántos/as alumnos/as se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados/as.
SELECT c.anyo_inicio AS año_inicio_curso, COUNT(DISTINCT ama.id_alumno) AS alumnos_matriculados
FROM curso_escolar c
LEFT JOIN alumno_se_matricula_asignatura ama ON c.id = ama.id_curso_escolar
GROUP BY c.anyo_inicio
ORDER BY c.anyo_inicio;
-- 9.	Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT prof.id_profesor, per.nombre, per.apellido1, per.apellido2, COUNT(asig.id_profesor) num_asignaturas FROM profesor prof LEFT JOIN asignatura asig ON asig.id_profesor=prof.id_profesor JOIN persona per ON per.id = prof.id_profesor GROUP BY prof.id_profesor ORDER BY num_asignaturas DESC;
-- 10.	Devuelve todos los datos del alumno más joven.
SELECT * FROM persona 
WHERE tipo = 'alumno' 
ORDER BY fecha_nacimiento DESC LIMIT 1;
-- 11.	Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT per.id, per.nombre, per.apellido1, per.apellido2 FROM persona per JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN asignatura asig ON prof.id_profesor = asig.id_profesor JOIN departamento dep ON dep.id = prof.id_departamento WHERE asig.id IS NULL;
