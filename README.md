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
│   │   └── ucsy_lms_db_erd.mdj
│   ├── docs
│   │   ├── announcements.png
│   │   ├── assessments.png
│   │   ├── attendance.png
│   │   ├── classes.png
│   │   ├── courses.png
│   │   ├── departments.png
│   │   ├── enrollments.png
│   │   ├── grades.png
│   │   ├── instructors.png
│   │   ├── lectures.png
│   │   ├── parents.png
│   │   ├── query1.png
│   │   ├── query2.png
│   │   ├── query3.png
│   │   ├── query4.png
│   │   ├── query5.png
│   │   ├── query6.png
│   │   ├── query7.png
│   │   ├── query8.png
│   │   ├── resources.png
│   │   ├── room.png
│   │   ├── sections.png
│   │   ├── sem_III_dbms_project.tex
│   │   ├── students.png
│   │   ├── terms.png
│   │   ├── ucsy_lms_db_erd_mysql.png
│   │   ├── ucsy_lms_db_erd_staruml.png
│   │   └── ucsy-logo.png
│   ├── .git
│   ├── .gitattributes
│   ├── .gitignore
│   ├── LICENSE
│   ├── README.md
│   └── sql_script
│       └── ucsy_lms_db.sql
```

The parent directory - /ucsy_lms_db contains:
- **design/**: Database design diagrams
- **docs/**: Documentation
- **LICENSE**: MIT License
- **README.md**: Project specific documentation
- **sql_script/**: sql script to run on your MySQL Workbench

## 🛠️ Technologies & Tools
Throughout my project, I used the following tools:
| Category | Tool | Purpose |
| --- | --- | --- |
| Design | StarUML | Conceptual & Logical ER Diagrams |
| Database | MySQL (Server/Workbench/Shell) | Schema Implementation & Query Execution |
| Publishing | LaTex | Academic Documentation & Formatting |
| Version Control | Git & Github | Track version and upload on thwoe Github |

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

The database design includes entities such as **Departments, Room, Terms, Sections, Students, Parents, Instructors, Courses, Lectures, Classes, Enrollments, Assessments, Announcements, Attendance, Resources, and Grades**.

#### 1. Departments

This entity categorizes the various academic departments within the university.

* **department_id** (Primary Key): Unique identifier for the department.
* **department_name**: The official name of the department.

---

#### 2. Room

Stores information about physical locations where classes and lectures are held.

* **room_id** (Primary Key): Unique identifier for each room.
* **room_name**: Name or number of the room.
* **building_name**: The specific campus building (A, B, C, D, E, F, Ext1, or Ext2).

---

#### 3. Terms

Defines the academic periods, semesters, and their active status.

* **term_id** (Primary Key): Unique identifier for the academic term.
* **semester_name**: Roman numeral representation of the semester (I through X).
* **academic_year**: The school year (e.g., 2023-2024).
* **is_active**: Boolean flag indicating if the term is currently ongoing.
* **start_date**: The date the term begins.
* **end_date**: The date the term concludes.

---

#### 4. Sections

Represents specific student cohorts assigned to a particular room and term.

* **section_id** (Primary Key): Unique identifier for the section.
* **term_id**: Reference to the academic term.
* **section_name**: The name of the specific student group/section.
* **room_id**: Reference to the primary room assigned to this section.

---

#### 5. Students

This entity stores personal details and academic placement for each student.

* **ykpt** (Primary Key): Unique student identifier.
* **term_id**: Reference to the student's assigned term.
* **first_name**: Student's first name.
* **middle_name**: Student's middle name.
* **last_name**: Student's last name.
* **dob**: Student's date of birth.
* **edu_mail**: Official university email (Unique).
* **telephone**: Contact phone number (Unique).
* **password**: Encrypted login credential.
* **created_at**: Timestamp of account creation.

---

#### 6. Parents

Stores contact information for the parents or guardians of students.

* **parent_id** (Primary Key): Unique identifier for the parent record.
* **ykpt**: Reference to the student (Foreign Key).
* **father_name**: Name of the father.
* **mother_name**: Name of the mother.
* **email**: Parent's contact email.
* **telephone**: Parent's contact phone number.

---

#### 7. Instructors

Contains profiles for the faculty members teaching the courses.

* **instructor_id** (Primary Key): Unique identifier for the instructor.
* **first_name**: Instructor's first name.
* **middle_name**: Instructor's middle name.
* **last_name**: Instructor's last name.
* **department_id**: Reference to the instructor's home department.
* **edu_mail**: Official faculty email (Unique).
* **telephone**: Contact phone number (Unique).
* **password**: Encrypted login credential.
* **created_at**: Timestamp of account creation.

---

#### 8. Courses

Defines the individual subjects or modules offered by departments.

* **course_id** (Primary Key): Unique identifier for the course.
* **term_id**: Reference to the student's assigned term.
* **department_id**: Reference to the department offering the course.
* **course_name**: The title of the course.
* **course_description**: Detailed overview of the course content.
* **start_date**: Official start date of the course.
* **end_date**: Official end date of the course.

---

#### 9. Lectures

Links instructors, courses, and sections to specific teaching sessions.

* **lecture_id** (Primary Key): Unique identifier for the lecture series.
* **term_id**: Reference to the current term.
* **course_id**: Reference to the specific course.
* **instructor_id**: Reference to the instructor teaching the lecture.
* **section_id**: Reference to the student section attending.
* **lecture_name**: Title of the specific lecture.
* **lecture_description**: Summary of lecture topics.

---

#### 10. Classes

Tracks individual scheduled instances of lectures in specific rooms.

* **class_id** (Primary Key): Unique identifier for a single class session.
* **lecture_id**: Reference to the parent lecture.
* **room_id**: Reference to the room where the class is held.
* **class_date**: The date the class takes place.
* **start_time**: The scheduled start time.
* **end_time**: The scheduled end time.

---

#### 11. Enrollments

Manages the relationship between students and the courses they are taking.

* **enrollment_id** (Primary Key): Unique identifier for the enrollment.
* **ykpt**: Reference to the student.
* **term_id**: Reference to the term of enrollment.
* **course_id**: Reference to the enrolled course.
* **enrolled_at**: Timestamp of when the student joined.
* **completion_status**: Current progress (Not Started, In Progress, or Completed).

---

#### 12. Assessments

Details the various tasks and exams assigned within a course.

* **assessment_id** (Primary Key): Unique identifier for the assessment.
* **course_id**: Reference to the associated course.
* **assessment_type**: Type of work (Tutorial, Assignment, Lab Test, Quiz, etc.).
* **assessment_name**: Title of the assessment.
* **assessment_description**: Instructions or details.
* **due_date**: Deadline for submission.
* **assessment_score**: Maximum possible points.
* **completion_status**: General status of the assessment.

---

#### 13. Announcements

Used by instructors to broadcast information to specific courses.

* **announcement_id** (Primary Key): Unique identifier for the announcement.
* **course_id**: Reference to the relevant course.
* **instructor_id**: Reference to the instructor posting the update.
* **announcement_description**: The content of the announcement.
* **announced_at**: Timestamp of the post.

---

#### 14. Attendance

Records student presence during specific class sessions.

* **attendance_id** (Primary Key): Unique identifier for the attendance record.
* **ykpt**: Reference to the student.
* **class_id**: Reference to the specific class session.
* **time_arrived**: Timestamp of student arrival.
* **time_left**: Timestamp of student departure.

---

#### 15. Resources

Stores links and metadata for educational materials provided in courses.

* **resource_id** (Primary Key): Unique identifier for the resource.
* **course_id**: Reference to the course the resource belongs to.
* **resource_type**: Category of material (Video, Slides, TextBook, etc.).
* **url**: The web address or file path to the resource.
* **uploaded_time**: Timestamp of when the resource was added.

---

#### 16. Grades

Tracks the performance of students on specific assessments.

* **grade_id** (Primary Key): Unique identifier for the grade entry.
* **ykpt**: Reference to the student being graded.
* **assessment_id**: Reference to the specific assessment.
* **earned_score**: The actual points achieved by the student.
* **feedback**: Written comments from the instructor.
* **graded_at**: Timestamp of when the grade was recorded.

### **Database Relationship - Cardinality**

| Relationship | Type | Description |
| --- | --- | --- |
| **Departments — Instructors** | One-to-Many | One department employs multiple instructors. |
| **Departments — Courses** | One-to-Many | One department manages and offers multiple different courses. |
| **Room — Sections** | One-to-Many | One physical room can be assigned to multiple academic sections. |
| **Terms — Sections** | One-to-Many | One academic term contains multiple student sections. |
| **Terms — Enrollments** | One-to-Many | One academic term manages many student enrollments. |
| **Terms — Lectures** | One-to-Many | One academic term hosts various scheduled lecture series. |
| **Sections — Students** | One-to-Many | One section consists of multiple enrolled students. |
| **Sections — Lectures** | One-to-Many | One section is assigned to attend multiple different lectures. |
| **Students — Parents** | Many-to-One | Multiple students (such as siblings) can be linked to the same parent record. |
| **Students — Enrollments** | One-to-Many | One student can have multiple enrollment records across different courses or terms. |
| **Students — Attendance** | One-to-Many | One student generates multiple attendance entries across different class sessions. |
| **Students — Grades** | One-to-Many | One student receives multiple grades for various assessments. |
| **Instructors — Lectures** | One-to-Many | One instructor is responsible for conducting multiple lecture series. |
| **Instructors — Announcements** | One-to-Many | One instructor can post multiple announcements to their courses. |
| **Courses — Enrollments** | One-to-Many | One course can have many students enrolled in it. |
| **Courses — Lectures** | One-to-Many | One course can be broken down into multiple lecture series. |
| **Courses — Assessments** | One-to-Many | One course contains multiple assessments like quizzes and exams. |
| **Courses — Announcements** | One-to-Many | One course acts as a hub for multiple instructor announcements. |
| **Courses — Resources** | One-to-Many | One course provides multiple learning resources like slides or videos. |
| **Lectures — Classes** | One-to-Many | One lecture series consists of multiple individual class sessions. |
| **Room — Classes** | One-to-Many | One room hosts multiple individual class sessions over time. |
| **Classes — Attendance** | One-to-Many | One specific class session has an attendance record for every student present. |
| **Assessments — Grades** | One-to-Many | One assessment results in many grade entries (one for each student). |

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
