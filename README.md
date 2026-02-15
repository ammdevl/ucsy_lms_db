## ⛃ Database Design for UCSY LMS
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-ammdevl-181717?logo=github)](https://github.com/ammdevl)

## 📋 Table of Contents

- [About](#-about)
- [Repository Structure](#-repository-structure)
- [Technologies & Tools](#️-technologies--tools)
- [Getting Started](#-getting-started)
- [Details](#-database-design-details)
- [Contributing](#-contributing)
- [License](#-license)
- [Contact](#-contact)
## 📖 About
This repository documents the formal Database Design and Implementation for the University of Computer Studies, Yangon (UCSY) Learning Management System. It showcases a complete data modeling workflow—from initial requirement analysis and ER Diagramming to optimized SQL schema development.

## 📁 Repository Structure
```bash
├── ucsy_lms_db
│   ├── design
│   │   ├── ucsy_lms_db_erd.mdj
│   │   ├── ucsy_lms_db_erd_mysql.png
│   │   └── ucsy_lms_db_erd_staruml.png
│   ├── docs
│   │   ├── sem_III_dbms_project.pdf
│   │   ├── sem_III_dbms_project.tex
│   │   ├── ucsy_lms_db_erd_mysql.png
│   │   ├── ucsy_lms_db_erd_staruml.png
│   │   └── ucsy-logo.png
│   ├── .gitignore
│   ├── LICENSE
│   ├── README.md
│   └── sql_script
│       └── ucsy_lms_db.sql
```

The parent directory - /ucsy_lms_db contains:
- **design/**: Database design diagrams
- **docs/**: Documentation
- **sql_script/**: sql script to run on your MySQL Workbench
- **License**: MIT License
- **README.md**: Project specific documentation

## 🛠️ Technologies & Tools
Throughout my project, I used the following tools:
| Category | Tool | Purpose |
| --- | --- | --- |
| Design | StarUML | Conceptual & Logical ER Diagrams |
| Database | MySQL (Server/Workbench/Shell) | Schema Implementation & Query Execution |
| Publishing | LaTex | Academic Documentation & Formatting |
| Version Control | Git & Github | Track version and upload on the Github |

## 🚀 Getting Started

To explore any project in this repository:

1. **Clone the repository**
   ```bash
   git clone https://github.com/ammdevl/ucsy_lms_db.git
   ```

2. **Navigate to project**
   ```bash
   cd ucsy_lms_db
   ```

3. **Follow project-specific instructions**
   
   Read README.md.

## 📃 Database Design Details

In this section, I will provide the structured breakdown of the entities and their attributes:

### Entities and Attributes

The database design includes entities such as **Students, Instructors, Departments, Courses, Classes, Enrollments, Assessments, Resources, Attendance, Grades, Parents, and Announcements**.

#### 1. Students

This entity stores personal details and academic status for each student.

* **ykpt** (Primary Key): Unique student identifier.
* **first_name**: Student's first name.
* **middle_name**: Student's middle name.
* **last_name**: Student's last name.
* **dob**: Student's date of birth.
* **semester**: Current academic semester of the student.
* **edu_mail**: Official university email address.
* **telephone**: Contact phone number.
* **password**: Encrypted login credential.
* **created_at**: Timestamp of account creation.

#### 2. Instructors

This entity manages information for faculty members.

* **instructor_id** (Primary Key): Unique identifier for each instructor.
* **first_name**: Instructor's first name.
* **middle_name**: Instructor's middle name.
* **last_name**: Instructor's last name.
* **department_id** (Foreign Key): Links to the instructor's primary department.
* **edu_mail**: Official faculty email address.
* **telephone**: Contact phone number.
* **password**: Login credential.
* **created_at**: Account registration timestamp.

#### 3. Courses

Represents the various subjects offered within the system.

* **course_id** (Primary Key): Unique code for the course.
* **instructor_id** (Foreign Key): Links to the primary instructor for the course.
* **department_id** (Foreign Key): Links to the offering department.
* **course_name**: Full title of the course.
* **course_description**: Detailed overview of the course content.
* **start_date / end_date**: The duration of the course term.

#### 4. Classes

Manages specific scheduled sessions or sections of a course.

* **class_id** (Primary Key): Unique identifier for the specific class session.
* **course_id** (Foreign Key): Links to the parent course.
* **department_id** (Foreign Key): Links to the department.
* **class_name**: Specific name or section of the class.
* **class_description**: Details regarding the session.
* **class_date**: Scheduled date for the class.
* **start_time / end_time**: Precise timing for the session.

#### 5. Enrollments

Tracks the registration of students into specific courses.

* **enrollment_id** (Primary Key): Unique record for the enrollment.
* **ykpt** (Foreign Key): Links to the specific student.
* **course_id** (Foreign Key): Links to the chosen course.
* **enrolled_at**: Date and time of registration.
* **completion_status**: Boolean indicator (0/1) showing if the student finished the course.

#### 6. Assessments

Stores details for assignments, quizzes, or exams.

* **assessment_id** (Primary Key): Unique identifier for the assessment.
* **course_id** (Foreign Key): Links to the associated course.
* **assessment_type**: Category (e.g., Quiz, Final Exam).
* **assessment_name**: Title of the assignment.
* **due_date**: Submission deadline.
* **assessment_score**: Maximum possible points.

#### 7. Grades

Contains the results of student assessments.

* **grade_id** (Primary Key): Unique identifier for the grade entry.
* **ykpt** (Foreign Key): Links to the student.
* **assessment_id** (Foreign Key): Links to the specific assessment.
* **earned_score**: Actual points achieved by the student.
* **feedback**: Qualitative comments from the instructor.

#### 8. Attendance

Tracks student presence in specific class sessions.

* **attendance_id** (Primary Key): Unique record for each attendance entry.
* **ykpt** (Foreign Key): Links to the student.
* **class_id** (Foreign Key): Links to the specific class session.
* **time_arrived / time_left**: Timestamps for student entry and exit.

#### 9. Resources

Stores academic materials related to courses.

* **resource_id** (Primary Key): Unique identifier for the resource.
* **course_id** (Foreign Key): Links to the course.
* **lecture_slide_url**: Digital link to presentation files.
* **lecture_video_url**: Link to recorded lecture content.
* **textbook_url**: Link to associated reading materials.

#### 10. Parents

Contains contact information for student guardians.

* **parent_id** (Primary Key): Unique identifier for the parent/guardian.
* **ykpt** (Foreign Key): Links to the student.
* **father_name / mother_name**: Full names of parents.
* **email / telephone**: Contact details for communication.

### **Database Relationship - Cardinality**

| Relationship | Type | Description |
| --- | --- | --- |
| **Students — Parents** | Many-to-One | Multiple students can be linked to one parent record (e.g., siblings). |
| **Students — Enrollments** | One-to-Many | One student can enroll in multiple courses over time. |
| **Courses — Enrollments** | One-to-Many | One course can have many student enrollments. |
| **Students — Attendance** | One-to-Many | One student will have many attendance records (one for each class session). |
| **Classes — Attendance** | One-to-Many | One specific class session has many student attendance entries. |
| **Courses — Classes** | One-to-Many | One course (e.g., Math 101) consists of multiple individual class sessions. |
| **Instructors — Classes** | One-to-Many | One instructor can be assigned to lead multiple class sessions. |
| **Instructors — Courses** | One-to-Many | One instructor can be the primary lead for multiple courses. |
| **Departments — Instructors** | One-to-Many | One department employs many different instructors. |
| **Departments — Courses** | One-to-Many | One department (e.g., Science) offers multiple different courses. |
| **Courses — Resources** | One-to-Many | One course can have multiple learning resources (slides, videos, etc.). |
| **Courses — Announcements** | One-to-Many | One course can have many different announcements posted to it. |
| **Instructors — Announcements** | One-to-Many | One instructor can create and post many announcements. |
| **Courses — Assessments** | One-to-Many | One course contains multiple assessments (quizzes, exams, projects). |
| **Assessments — Grades** | One-to-Many | One assessment type has many grade entries (one for every student). |
| **Students — Grades** | One-to-Many | One student receives many grades across their various assessments. |

## 🤝 Contributing

While this is primarily a personal academic portfolio, I'm open to:
- Suggestions for improvements
- Bug reports
- Code reviews and feedback

If you'd like to provide feedback, please open an issue or reach out directly.

## 📄 License

This repository is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📧 Contact

**Aung Myint Myat**
- GitHub: [@ammdevl](https://github.com/ammdevl)
- Discord: [@ammdevl](https://discord.com/ammdevl)
- Repository: [ucsy_lms_db](https://github.com/ammdevl/ucsy_lms_db)

---

<div align="center">
  <sub>Built with ❤️ during my academic journey</sub>
</div>
