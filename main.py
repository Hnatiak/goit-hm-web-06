from faker import Faker
import random
import psycopg2
import logging

fake = Faker()

conn = psycopg2.connect(
    host="localhost",
    database="testthree",
    user="studentBase",
    password="goithmsix"
)

cur = conn.cursor()

# Заповнення таблиці груп
for _ in range(3):
    cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.word(),))
    
# Заповнення таблиці викладачів
for _ in range(3):
    cur.execute("INSERT INTO teachers (fullname) VALUES (%s)", (fake.name(),))

# Додавання предметів із вказівкою викладача
for teacher_id in range(1, 4):
    for _ in range(2):
        cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)", (fake.word(), teacher_id))
        
# Заповнення таблиці студентів і оцінок
for group_id in range(1, 4):
    for _ in range(10):
        cur.execute("INSERT INTO students (fullname, group_id) VALUES (%s, %s) RETURNING id",
                    (fake.name(), group_id))
        student_id = cur.fetchone()[0]
        for subject_id in range(1, 7):
            for _ in range(3):
                cur.execute("INSERT INTO grades (student_id, subject_id, grade, date_received) VALUES (%s, %s, %s, %s)", (student_id, subject_id, random.randint(0, 100), fake.date_this_decade()))

try:
    conn.commit()
except psycopg2.DatabaseError as e:
    logging.error(e)
    conn.rollback()
finally:
    cur.close()
    conn.close()