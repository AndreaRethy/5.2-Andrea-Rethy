USE universidad;

/* 1. Return a list with the first last name, second last name and first name of all the students. The list must be ordered alphabetically from lowest to highest by first last name, second last name and first name. */
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_profesor IS NULL
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/* 2. Find out the first and last names of students who have not registered their phone number in the database. */
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_profesor IS NULL AND persona.telefono IS NULL
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/* 3. Return the list of students who were born in 1999. */
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre
FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_profesor IS NULL AND LEFT(persona.fecha_nacimiento, 4) = '1999'
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/* 4. Return the list of teachers who have not registered their phone number in the database and also their NIF ends in K. */
SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre, persona.id
FROM persona
RIGHT JOIN profesor ON persona.id = profesor.id_profesor
WHERE persona.telefono IS NULL AND RIGHT(persona.nif, 1) = 'K'
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/* 5. Return the list of subjects that are taught in the first semester, in the third year of the degree that has the identifier 7.
	Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7. */
SELECT *
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

/* 6. Return a list of professors along with the name of the department to which they are linked. The listing should return four columns, first last name, second last name, first name and department name. The result will be sorted alphabetically from lowest to highest by last name and first name.
	Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom. */
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS departamento
FROM profesor
INNER JOIN persona ON profesor.id_profesor = persona.id
INNER JOIN departamento ON profesor.id_departamento = departamento.id;

/* 7. Return a list with the name of the subjects, start year and end year of the student's school year with NIF 26902806M.
	Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M. */
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM alumno_se_matricula_asignatura
INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE persona.nif = '26902806M';

/* 8. Return a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (Plan 2015).
	Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). */
/* SELECT *
FROM departamento
INNER JOIN profesor ON departamento.id = profesor.id_departamento */

/* 9. Return a list of all students who have enrolled in a subject during the 2018/2019 school year
	Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019. */
SELECT DISTINCT persona.nombre
FROM alumno_se_matricula_asignatura
INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

/* 10. Return a list with the names of all the professors and the departments they are linked to. The list must also show those professors who do not have any associated department. The listing must return four columns, department name, first last name, second last name and teacher's name. The result will be sorted alphabetically from lowest to highest by department name, last name and first name.
	Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom. */
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre
FROM profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
LEFT JOIN persona ON profesor.id_profesor = persona.id
ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/* 11. Return a list of professors who are not associated with a department.
	Retorna un llistat amb els professors/es que no estan associats a un departament. */
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre
FROM profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
LEFT JOIN persona ON profesor.id_profesor = persona.id
WHERE profesor.id_departamento IS NULL
ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

/*
Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

Retorna un llistat amb els departaments que no tenen professors/es associats.
Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.


Consultes resum:

Retorna el nombre total d'alumnes que hi ha.
Calcula quants alumnes van néixer en 1999.
Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
Retorna totes les dades de l'alumne/a més jove.
Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
*/