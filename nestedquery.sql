use waughjm;

drop table if exists courses;
drop table if exists instructor;

CREATE TABLE instructor(
      instructor_no INT PRIMARY KEY,
      instructor_name CHAR(20),
      phone CHAR(10)
);
CREATE TABLE courses(
      course_no INT PRIMARY KEY,
      course_number CHAR(6),
      course_name CHAR(50),
      credit_hours INT,
      instructor_no INT,
      FOREIGN KEY (instructor_no) REFERENCES instructor (instructor_no)
);

INSERT INTO instructor VALUES
      (1, 'Tom', '1111111111'), 
      (2, 'Jerry', '2222222222'), 
      (3, 'Mickey', '3333333333');
INSERT INTO courses VALUES
      (1, 'CS3430', 'Database', 3, 1), 
      (2, 'CS4755', 'Machine Learning', 3, 1), 
      (3, 'CS1440', 'Java', 3, 2),
      (4, 'CS2440', 'Adavanced Java', 3, null);

select * from instructor join courses on instructor.instructor_no = courses.course_no;
select instructor_no from instructor where instructor_no not in (select instructor_no from courses);
select * from instructor where instructor_no not in (select instructor_no from courses where instructor_no is not null);
