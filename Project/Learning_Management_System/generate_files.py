import csv
from faker import Faker
import random

fake = Faker()

record_length = 100

# user data generation
users_path = r"users_data.csv"
headers_users = ["user_id", "user_name", "user_role", "user_email", "user_phone"]

role = ["student", "instructor"]

with open(users_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers_users)

    for i in range(1, record_length + 1):
        user_id = f"USR-{i:04d}"
        user_name = fake.name()
        user_role = random.choice(role)
        user_email = fake.email()
        user_phone = random.randint(6000000000, 9999999999)

        write.writerow([
            user_id,
            user_name,
            user_role,
            user_email,
            user_phone
        ])

# course data generation
courses_path = r"courses_data.csv"
headers_courses = ["course_id", "title", "description"]

prefixes = ["Basics", "Advance", "Introduction to", "Comprehensive Guide to", "Mastering"]
subjects = ["Python", "Data Science", "Machine Learning", "Web Development", "Cloud Computing"]

with open(courses_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers_courses)

    for i in range(1, record_length + 1):
        course_id = f"CRS-{i:04d}"
        title = f"{random.choice(prefixes)} {random.choice(subjects)}"
        description = fake.text(max_nb_chars=200)

        write.writerow([
            course_id,
            title,
            description
        ])

# lesson data generation
lessons_path = r"lessons_data.csv"
header_lessons = ["lesson_id", "course_id", "title", "content"]

verbs = ['Getting Started with', 'Understanding', 'Deep Dive into', 'Mastering', 'Debugging']
nouns = ['Arrays & Objects', 'Git Workflows', 'REST APIs', 'SQL Joins', 'State Management']

with open(lessons_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(header_lessons)

    for i in range(1, record_length + 1):
        lesson_id = f"LES-{i:04d}"
        random_num = random.randint(1, 100)
        course_id = f"CRS-{random_num:04d}"
        title = f"{random.choice(verbs)} {random.choice(nouns)}"
        content = fake.sentence(nb_words=12)

        write.writerow([
            lesson_id,
            course_id,
            title,
            content
        ])

# enrollment data generation
enrollment_path = r"enrollment_data.csv"
header_enrollment = ["enrollment_id", "user_id", "course_id", "enrollment_date"]

with open(enrollment_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(header_enrollment)

    for i in range(1, record_length + 1):
        enrollment_id = f"ENR-{i:04d}"
        user_num = random.randint(1, 100)
        user_id = f"USR-{user_num:04d}"
        course_num = random.randint(1, 100)
        course_id = f"CRS-{course_num:04d}"

        date_time = fake.date_time_between(start_date='-2y', end_date='now')
        enrollment_date = date_time.strftime("%Y-%m-%d %H:%M:%S")

        write.writerow([
            enrollment_id,
            user_id,
            course_id,
            enrollment_date
        ])

# user activity data generation
activity_path = r"user_activity_data.csv"
header_activity = ["activity_id", "user_id", "lesson_id", "activity_status"]

status = ["completed", "in_progress", "not_started"]

with open(activity_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(header_activity)

    for i in range(1, record_length + 1):
        activity_id = f"ACT-{i:04d}"
        user_num = random.randint(1, 100)
        user_id = f"USR-{user_num:04d}"
        lesson_num = random.randint(1, 100)
        lesson_id = f"LES-{lesson_num:04d}"
        activity_status = random.choice(status)

        write.writerow([
            activity_id,
            user_id,
            lesson_id,
            activity_status
        ])

# assessment data generation
assessment_path = r"assessment_data.csv"
header_assessment = ["assessment_id", "course_id", "max_score"]

with open(assessment_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(header_assessment)

    for i in range(1, record_length + 1):
        assessment_id = f"ASS-{i:04d}"
        course_num = random.randint(1, 100)
        course_id = f"CRS-{course_num:04d}"
        max_score = 100

        write.writerow([
            assessment_id,
            course_id,
            max_score
        ])

# assessment submission data generation
submission_path = r"assessment_submission_data.csv"
headers = ["submission_id", "assessment_id", "user_id", "submission_date"]

with open(submission_path, mode='w', newline='', encoding="utf-8") as f:
    write = csv.writer(f)
    write.writerow(headers)

    for i in range(1, record_length + 1):
        submission_id = f"SUB-{i:04d}"
        assessment_num = random.randint(1, 100)
        assessment_id = f"ASS-{assessment_num:04d}"
        user_num = random.randint(1, 100)
        user_id = f"USR-{user_num:04d}"

        date_obj = fake.date_time_between(start_date='-2y', end_date='now')
        submission_date = date_obj.strftime("%Y-%m-%d")

        write.writerow([
            submission_id,
            assessment_id,
            user_id,
            submission_date
        ])

print("Files generated successfully")