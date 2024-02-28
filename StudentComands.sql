DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(150) NOT NULL,
    group_id INTEGER REFERENCES groups(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(150) NOT NULL
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(175) NOT NULL,
    teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
    subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    grade INTEGER CHECK (grade >= 0 AND grade <= 100),
    date_received DATE NOT NULL
);