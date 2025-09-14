# Placement-Hub

Placement Hub is a full-stack web application designed to streamline and automate various activities related to student training, quizzes, and preparation management in a college environment.

This project enables students and faculty to interact on a single platform with secure login, quiz management, study material sharing, and analytics.

🚀 Features
👨‍🎓 Student Module

Student registration & login (JWT-secured, passwords hashed with BCrypt)

Profile view and update

Attempt quizzes with section-wise questions

View results & past quiz attempts

Access subject notes and practice questions

👨‍🏫 Faculty Module

Faculty registration & login

Create and manage quizzes (with sections & questions)

Upload notes and practice question PDFs for students

Track student performance and results

📝 Quiz Module

Faculty creates quizzes with multiple sections & questions

Students attempt quizzes with timer & scoring

Section-wise scoring for detailed feedback

Redis caching for faster quiz loading (handles 3000+ concurrent users)

Prevents multiple attempts by the same student for the same quiz

📘 Notes & Practice Question Module

Faculty can upload subject-wise notes and practice questions in PDF format

Students can download and prepare for exams/placements

Organized subject-based material repository

🛠️ Technologies Used

Frontend: HTML, CSS, JavaScript

Backend: Java, Servlets, JSP

Database: Oracle 18c XE (via Docker)

Caching: Redis (via Docker, Jedis client in Java)

Authentication: JWT (JSON Web Tokens)

Password Security: BCrypt (secure password hashing)

Connection Pooling: Tomcat JDBC Pool (optimized DB connections)

JSON Handling: Gson (object ↔ JSON serialization)

Containerization: Docker (for Oracle DB and Redis services)

⚡ Optimizations

JDBC connection pooling for high concurrency (3000–4000 users)

Redis caching for quiz metadata and questions

Pagination for large quiz/result listings

PreparedStatement batching for bulk inserts

JWT-based stateless authentication

BCrypt password hashing

Docker-based environment isolation and reproducibility

📂 Project Structure

DAO Layer: Data access logic (optimized with pooling, caching)

POJOs: Java classes representing entities (Student, Faculty, Quiz, etc.)

Servlets: Handle HTTP requests/responses

JSPs: Frontend rendering dynamic content

Utility Classes: DBUtil, ConnectionManager, RedisManager, IDUtil, etc.

🎯 Conclusion

Placement Hub is a scalable, secure, and optimized Training & Placement Management System, built with modern Java technologies, Oracle 18c, Redis caching, and Docker-based deployment.
