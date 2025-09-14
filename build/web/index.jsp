<%-- 
    Document   : index
    Created on : 19 Jul, 2025, 11:20:50 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TNP Application - Training & Placement Platform</title>

    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Bootstrap Icons -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
      rel="stylesheet"
    />

    <!-- Custom CSS -->
    <link href="headerFooter.css" rel="stylesheet" />
    <link href="styles.css" rel="stylesheet" />
   
  </head>
  <body>
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <!-- Hero Section -->
    <section class="hero-section">
      <div class="container py-5">
        <div class="text-center">
          <div class="hero-content">
            <h1 class="display-4 fw-bold mb-4">
              Welcome to TNP Application
            </h1>
            <p class="lead mb-5 text-muted">
              Your comprehensive platform for Training and Placement success.<br />
              Build skills, practice, and excel in your career journey.
            </p>

            <div
              class="d-flex flex-column flex-sm-row gap-3 justify-content-center mb-5"
            >
              <a href="register.jsp" class="btn btn-primary btn-lg px-4">
                Get Started Today
                <i class="bi bi-arrow-right ms-2"></i>
              </a>
              <a href="about.jsp" class="btn btn-outline-primary btn-lg px-4">
                Learn More
              </a>
            </div>
          </div>

          <!-- Features Section -->
          <div class="row mt-5">
            <div class="col-md-4 mb-4">
              <div class="feature-item text-center">
                <div class="feature-icon">
                  <i class="bi bi-people-fill"></i>
                </div>
                <h5 class="fw-semibold mt-3">Expert Guidance</h5>
                <p class="text-muted">
                  Learn from industry professionals and experienced mentors
                </p>
              </div>
            </div>
            <div class="col-md-4 mb-4">
              <div class="feature-item text-center">
                <div class="feature-icon">
                  <i class="bi bi-award-fill"></i>
                </div>
                <h5 class="fw-semibold mt-3">Skill Development</h5>
                <p class="text-muted">
                  Comprehensive skill-building programs for career readiness
                </p>
              </div>
            </div>
            <div class="col-md-4 mb-4">
              <div class="feature-item text-center">
                <div class="feature-icon">
                  <i class="bi bi-bullseye"></i>
                </div>
                <h5 class="fw-semibold mt-3">Career Focus</h5>
                <p class="text-muted">
                  Targeted preparation for placement success
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Main Navigation Section -->
    <section class="navigation-section py-5 bg-light">
      <div class="container">
        <div class="text-center mb-5">
          <h2 class="display-5 fw-bold mb-3">Explore Our Platform</h2>
          <p class="lead text-muted">
            Access comprehensive resources designed to boost your academic and
            professional success
          </p>
        </div>

        <div class="row g-4">
          <!-- Quiz Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('quiz.jsp')">
              <div class="card-body text-center p-4">
                <div class="nav-icon quiz">
                  <i class="bi bi-patch-question-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Quiz</h5>
                <p class="card-text text-muted mb-4">
                  Test your knowledge with interactive quizzes
                </p>
                <button class="btn btn-primary w-100">
                  Explore Quiz
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Practice PDF Card -->
          <div class="col-lg-4 col-md-6">
            <div
              class="nav-card h-100"
              onclick="navigateTo('practice-pdf.jsp')"
            >
              <div class="card-body text-center p-4">
                <div class="nav-icon pdf">
                  <i class="bi bi-file-earmark-pdf-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Practice PDF</h5>
                <p class="card-text text-muted mb-4">
                  Download and practice with curated PDF materials
                </p>
                <button class="btn btn-primary w-100">
                  Explore Practice PDF
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Notes Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('notes.jsp')">
              <div class="card-body text-center p-4">
                <div class="nav-icon notes">
                  <i class="bi bi-journal-text"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Notes</h5>
                <p class="card-text text-muted mb-4">
                  Access comprehensive study notes and resources
                </p>
                <button class="btn btn-primary w-100">
                  Explore Notes
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Coding Platforms Card -->
          <div class="col-lg-4 col-md-6 offset-lg-2">
            <div
              class="nav-card h-100"
              onclick="navigateTo('codingPlatform.jsp')"
            >
              <div class="card-body text-center p-4">
                <div class="nav-icon coding">
                  <i class="bi bi-code-slash"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">
                  Coding Platforms
                </h5>
                <p class="card-text text-muted mb-4">
                  Connect to various coding practice platforms
                </p>
                <button class="btn btn-primary w-100">
                  Explore Coding Platforms
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Communication Skills Card -->
          <div class="col-lg-4 col-md-6">
            <div
              class="nav-card h-100"
              onclick="navigateTo('communication-skills.jsp')"
            >
              <div class="card-body text-center p-4">
                <div class="nav-icon communication">
                  <i class="bi bi-chat-dots-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">
                  Communication Skills
                </h5>
                <p class="card-text text-muted mb-4">
                  Improve your communication and interview skills
                </p>
                <button class="btn btn-primary w-100">
                  Explore Communication Skills
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    
   <section class="success-section py-5 text-white">
      <div class="container text-center">
        <h2 class="display-5 fw-bold mb-4">Student Success Stories</h2>
        <p class="lead mb-5">
          See how our students have achieved their career goals through our
          comprehensive training and placement program.
        </p>
        <div class="row">
          <div class="col-md-4 mb-4">
            <div class="success-card">
              <div class="success-icon">
                <i class="bi bi-briefcase-fill"></i>
              </div>
              <h4 class="fw-bold">95%</h4>
              <p class="mb-0">Placement Rate</p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="success-card">
              <div class="success-icon">
                <i class="bi bi-building"></i>
              </div>
              <h4 class="fw-bold">200+</h4>
              <p class="mb-0">Partner Companies</p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="success-card">
              <div class="success-icon">
                <i class="bi bi-people-fill"></i>
              </div>
              <h4 class="fw-bold">5000+</h4>
              <p class="mb-0">Students Placed</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    
    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script src="script.js"></script>
    
  </body>
</html>
