-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`, `degrees`.`name`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `departments`.`name`, `degrees`.`name`
FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`, `teachers`.`name`, `teachers`.`surname`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`course_id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`name` = 'Fulvio' --option 1
AND `teachers`.`surname` = 'Amato' --option 1
AND `teachers`.`id` = 44; --option 2

/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea
      a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome */
SELECT `students`.`name`, `students`.`surname`, `departments`.`name`, `degrees`.*
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'degrees_name', `courses`.`name` AS 'courses_name', `teachers`.`name` AS 'teachers_name', `teachers`.`surname` AS 'teachers_surname'
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`degree_id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
ORDER BY `degrees`.`name`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name` AS 'teachers_name', `teachers`.`surname` AS 'teachers_surname', `departments`.`name`
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

/* 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto
      per superare ciascuno dei suoi esami */