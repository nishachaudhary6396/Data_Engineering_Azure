-- Users Table
CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_role VARCHAR(20) NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_phone BIGINT NOT NULL
);

-- Courses Table
CREATE TABLE courses (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT
);

-- Lessons Table
CREATE TABLE lessons (
    lesson_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10) NOT NULL REFERENCES courses(course_id),
    title VARCHAR(200) NOT NULL,
    content TEXT
);

-- Enrollments Table
CREATE TABLE enrollments (
    enrollment_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10) NOT NULL REFERENCES users(user_id),
    course_id VARCHAR(10) NOT NULL REFERENCES courses(course_id),
    enrollment_date TIMESTAMP NOT NULL
);

-- User Activity Table
CREATE TABLE user_activity (
    activity_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10) NOT NULL REFERENCES users(user_id),
    lesson_id VARCHAR(10) NOT NULL REFERENCES lessons(lesson_id),
    activity_status VARCHAR(20) NOT NULL
);

-- Assessments Table
CREATE TABLE assessments (
    assessment_id VARCHAR(10) PRIMARY KEY,
    course_id VARCHAR(10) NOT NULL REFERENCES courses(course_id),
    max_score INTEGER NOT NULL
);

-- Assessment Submissions Table
CREATE TABLE assessment_submissions (
    submission_id VARCHAR(10) PRIMARY KEY,
    assessment_id VARCHAR(10) NOT NULL REFERENCES assessments(assessment_id),
    user_id VARCHAR(10) NOT NULL REFERENCES users(user_id),
    submission_date DATE NOT NULL
);