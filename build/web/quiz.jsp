<%-- 
    Document   : quiz
    Created on : 19 Jul, 2025, 11:30:26 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quiz - TNP Application</title>

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
    <link href="styles.css" rel="stylesheet" />
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav
      class="navbar navbar-expand-lg navbar-light bg-white shadow-sm border-bottom"
    >
      <div class="container">
        <!-- Logo and App Name -->
        <div class="d-flex align-items-center">
          <div class="logo-container me-3">
            <i class="bi bi-mortarboard-fill"></i>
          </div>
          <a class="navbar-brand fw-bold text-primary" href="index.html"
            >TNP Application</a
          >
        </div>

        <!-- Mobile Toggle Button -->
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation Items -->
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item">
              <a class="nav-link fw-medium" href="index.html">Home</a>
            </li>
            <li class="nav-item">
              <a
                class="nav-link fw-medium d-flex align-items-center"
                href="notifications.html"
              >
                <i class="bi bi-bell me-1"></i>
                Notifications
              </a>
            </li>
            <li class="nav-item">
              <a
                class="nav-link fw-medium d-flex align-items-center"
                href="attendance.html"
              >
                <i class="bi bi-calendar-check me-1"></i>
                Attendance
              </a>
            </li>
            <li class="nav-item me-2">
              <a
                class="btn btn-outline-primary btn-sm d-flex align-items-center"
                href="login.html"
              >
                <i class="bi bi-person me-1"></i>
                Login
              </a>
            </li>
            <li class="nav-item">
              <a
                class="btn btn-primary btn-sm d-flex align-items-center"
                href="register.html"
              >
                <i class="bi bi-person-plus me-1"></i>
                Register
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <!-- Icon -->
          <div class="mb-4">
            <div
              class="d-inline-flex align-items-center justify-content-center bg-light rounded-circle"
              style="width: 120px; height: 120px"
            >
              <i class="bi bi-patch-question-fill text-primary fs-1"></i>
            </div>
          </div>

          <!-- Title -->
          <h1 class="display-4 fw-bold mb-4">Quiz Section</h1>

          <!-- Description -->
          <p class="lead text-muted mb-5">
            Interactive quizzes to test your knowledge across various subjects
            and topics. Practice and improve your understanding with our
            comprehensive quiz system.
          </p>

          <!-- Coming Soon Card -->
          <div class="card bg-light border-0 rounded-4 p-4 mb-5">
            <div class="card-body">
              <h3 class="text-primary mb-3">
                <i class="bi bi-tools me-2"></i>
                Coming Soon!
              </h3>
              <p class="text-muted mb-4">
                This section is currently under development. We're working hard
                to bring you the best educational resources and tools. Stay
                tuned for updates!
              </p>

              <!-- Action Buttons -->
              <div
                class="d-flex flex-column flex-sm-row gap-3 justify-content-center"
              >
                <a href="index.html" class="btn btn-outline-primary">
                  <i class="bi bi-arrow-left me-2"></i>
                  Back to Home
                </a>
                <a href="register.html" class="btn btn-primary">
                  Get Notified When Ready
                </a>
              </div>
            </div>
          </div>

          <!-- Features Preview -->
          <div class="row">
            <div class="col-md-4 mb-3">
              <div class="p-3">
                <i class="bi bi-clock-history text-primary fs-2 mb-3"></i>
                <h5>Timed Quizzes</h5>
                <p class="text-muted small">
                  Practice with time constraints to improve speed
                </p>
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <div class="p-3">
                <i class="bi bi-graph-up text-primary fs-2 mb-3"></i>
                <h5>Progress Tracking</h5>
                <p class="text-muted small">
                  Monitor your improvement over time
                </p>
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <div class="p-3">
                <i class="bi bi-trophy text-primary fs-2 mb-3"></i>
                <h5>Achievements</h5>
                <p class="text-muted small">
                  Earn badges for your accomplishments
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer class="footer bg-light py-5 mt-5">
      <div class="container">
        <div class="row">
          <!-- App Info -->
          <div class="col-md-4 mb-4">
            <h5 class="fw-semibold text-primary mb-3">TNP Application</h5>
            <p class="text-muted small">
              Empowering students with comprehensive training and placement
              resources. Your gateway to career success through quality
              education and skill development.
            </p>
          </div>

          <!-- Contact Information -->
          <div class="col-md-4 mb-4">
            <h5 class="fw-semibold text-primary mb-3">Contact Us</h5>
            <div class="contact-info">
              <div class="d-flex align-items-center mb-2">
                <i class="bi bi-envelope text-primary me-2"></i>
                <small class="text-muted">support@tnpapp.edu</small>
              </div>
              <div class="d-flex align-items-center mb-2">
                <i class="bi bi-telephone text-primary me-2"></i>
                <small class="text-muted">+91 98765 43210</small>
              </div>
              <div class="d-flex align-items-center">
                <i class="bi bi-geo-alt text-primary me-2"></i>
                <small class="text-muted"
                  >Educational Campus, Knowledge City</small
                >
              </div>
            </div>
          </div>

          <!-- Quick Links -->
          <div class="col-md-4 mb-4">
            <h5 class="fw-semibold text-primary mb-3">Quick Links</h5>
            <div class="quick-links">
              <a
                href="index.html"
                class="d-block text-muted text-decoration-none small mb-2"
                >Home</a
              >
              <a
                href="notes.html"
                class="d-block text-muted text-decoration-none small mb-2"
                >Notes</a
              >
              <a
                href="practice-pdf.html"
                class="d-block text-muted text-decoration-none small mb-2"
                >Practice PDFs</a
              >
              <a
                href="coding-platforms.html"
                class="d-block text-muted text-decoration-none small"
                >Coding Platforms</a
              >
            </div>
          </div>
        </div>

        <hr class="my-4" />

        <div class="row align-items-center">
          <div class="col-md-6">
            <small class="text-muted"
              >© 2024 TNP Application. All rights reserved.</small
            >
          </div>
          <div class="col-md-6 text-md-end mt-2 mt-md-0">
            <small
              class="text-muted d-flex align-items-center justify-content-md-end"
            >
              Designed with
              <i class="bi bi-heart-fill text-danger mx-1"></i> for education
            </small>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script src="script.js"></script>
  </body>
</html>
