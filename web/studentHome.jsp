<%-- 
    Document   : studentHome
    Created on : 22 Jul, 2025, 12:04:44 AM
    Author     : DELL
--%>
<%@page import="in.tnpManagement.pojo.*" %>
<%@page import="in.tnpManagement.utility.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Dashboard - <%=AppInfo.appName%></title>

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
  <body class="student-dashboard">
    <!-- Include Student Header -->
    <jsp:include page="header.jsp" />

    <%

        String enrollment =(String) session.getAttribute("enrollment");
        String firstName =(String) session.getAttribute("firstName");
        StudentPojo student = (StudentPojo) session.getAttribute("student");                                    
    %>
    <!-- Welcome Section -->
    <section class="welcome-section">
      <div class="container py-4">
        <div class="row align-items-center">
          <div class="col-md-8">
            <h2 class="fw-bold text-dark mb-2">
                Welcome back, <span class="text-primary"> <%= firstName%>               
                </span>! 👋
            </h2>
            <p class="text-muted mb-0">
              Continue your learning journey and track your progress
            </p>
          </div>
           <%
           java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("EEEE, MMMM dd, yyyy");
           String currentDate = sdf.format(new java.util.Date());
            %>
          <div class="col-md-4 text-md-end">
            <div class="badge bg-light text-dark border px-3 py-2">
              <i class="bi bi-calendar3 me-2"></i>
              <span id="currentDate"></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Hero Section -->
    <section class="hero-section">
      <div class="container py-5">
        <div class="text-center space-y-8">
          <div class="space-y-4">
            <h1 class="display-4 fw-bold text-gray-900">
              Your Learning <span class="text-primary">Dashboard</span>
            </h1>
            <p class="lead text-muted max-w-3xl mx-auto">
              Access all your training resources, track progress, and excel in
              your career preparation journey.
            </p>
          </div>
        </div>

        <!-- Features section -->
        <div class="row mt-5">
          <div class="col-md-4 mb-4">
            <div class="feature-item text-center">
              <div class="feature-icon">
                <i class="bi bi-graph-up-arrow"></i>
              </div>
              <h5 class="fw-semibold mt-3">Track Progress</h5>
              <p class="text-muted">
                Monitor your learning progress across all modules
              </p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="feature-item text-center">
              <div class="feature-icon">
                <i class="bi bi-trophy-fill"></i>
              </div>
              <h5 class="fw-semibold mt-3">Achieve Goals</h5>
              <p class="text-muted">
                Complete assignments and earn certificates
              </p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="feature-item text-center">
              <div class="feature-icon">
                <i class="bi bi-people-fill"></i>
              </div>
              <h5 class="fw-semibold mt-3">Connect & Learn</h5>
              <p class="text-muted">
                Collaborate with peers and get guidance from faculty
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Main Navigation Section -->
    <section class="navigation-section py-5 bg-light">
      <div class="container">
        <div class="text-center mb-5">
          <h2 class="display-5 fw-bold mb-3">Learning Modules</h2>
          <p class="lead text-muted">
            Access your courses and practice materials
          </p>
        </div>

        <div class="row g-4">
          <!-- Quiz Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('quiz.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon quiz">
                  <i class="bi bi-patch-question-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Quiz</h5>
                <p class="card-text text-muted mb-4">
                  Test your knowledge with interactive quizzes
                </p>
                <button class="btn btn-primary w-100">
                  Take Quiz
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Practice PDF Card -->
          <div class="col-lg-4 col-md-6">
            <div
              class="nav-card h-100"
              onclick="navigateTo('practice-pdf.html')"
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
                  Download Materials
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Notes Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('notes.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon notes">
                  <i class="bi bi-journal-text"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Notes</h5>
                <p class="card-text text-muted mb-4">
                  Access comprehensive study notes and resources
                </p>
                <button class="btn btn-primary w-100">
                  View Notes
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Coding Platforms Card -->
          <div class="col-lg-4 col-md-6">
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
                  Start Coding
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Communication Skills Card -->
          <div class="col-lg-4 col-md-6">
            <div
              class="nav-card h-100"
              onclick="navigateTo('communication-skills.html')"
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
                  Practice Skills
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Progress Tracking Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('progress.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon" style="background: #17a2b8">
                  <i class="bi bi-graph-up"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">My Progress</h5>
                <p class="card-text text-muted mb-4">
                  Track your learning progress and achievements
                </p>
                <button class="btn btn-primary w-100">
                  View Progress
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Student Progress Section -->
    <section class="progress-section py-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
              <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                  <i class="bi bi-graph-up me-2"></i>
                  Your Learning Progress
                </h4>
              </div>
              <div class="card-body p-4">
                <!-- Overall Progress -->
                <div class="mb-4">
                  <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="fw-semibold">Overall Progress</span>
                    <span class="text-primary fw-bold">75%</span>
                  </div>
                  <div class="progress" style="height: 12px">
                    <div
                      class="progress-bar bg-primary"
                      style="width: 75%"
                    ></div>
                  </div>
                </div>

                <!-- Subject-wise Progress -->
                <h6 class="fw-semibold mb-3">Subject-wise Progress</h6>
                <div class="row g-3">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <div class="d-flex justify-content-between mb-1">
                        <small class="fw-medium">Data Structures</small>
                        <small class="text-success">90%</small>
                      </div>
                      <div class="progress" style="height: 8px">
                        <div
                          class="progress-bar bg-success"
                          style="width: 90%"
                        ></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <div class="d-flex justify-content-between mb-1">
                        <small class="fw-medium">Algorithms</small>
                        <small class="text-info">80%</small>
                      </div>
                      <div class="progress" style="height: 8px">
                        <div
                          class="progress-bar bg-info"
                          style="width: 80%"
                        ></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <div class="d-flex justify-content-between mb-1">
                        <small class="fw-medium">Web Development</small>
                        <small class="text-warning">65%</small>
                      </div>
                      <div class="progress" style="height: 8px">
                        <div
                          class="progress-bar bg-warning"
                          style="width: 65%"
                        ></div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="mb-3">
                      <div class="d-flex justify-content-between mb-1">
                        <small class="fw-medium">Communication</small>
                        <small class="text-danger">45%</small>
                      </div>
                      <div class="progress" style="height: 8px">
                        <div
                          class="progress-bar bg-danger"
                          style="width: 45%"
                        ></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <!-- Recent Achievements -->
            <div class="card border-0 shadow-sm mb-4">
              <div class="card-header bg-success text-white">
                <h6 class="mb-0">
                  <i class="bi bi-trophy me-2"></i>
                  Recent Achievements
                </h6>
              </div>
              <div class="card-body p-3">
                <div class="d-flex align-items-center mb-3">
                  <div
                    class="badge bg-warning text-dark rounded-circle me-3"
                    style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center"
                  >
                    <i class="bi bi-award-fill"></i>
                  </div>
                  <div>
                    <div class="fw-semibold small">Quiz Master</div>
                    <small class="text-muted">Completed 10 quizzes</small>
                  </div>
                </div>
                <div class="d-flex align-items-center mb-3">
                  <div
                    class="badge bg-primary rounded-circle me-3"
                    style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center"
                  >
                    <i class="bi bi-book-fill"></i>
                  </div>
                  <div>
                    <div class="fw-semibold small">Bookworm</div>
                    <small class="text-muted">Read 5 study materials</small>
                  </div>
                </div>
                <div class="d-flex align-items-center">
                  <div
                    class="badge bg-info rounded-circle me-3"
                    style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center"
                  >
                    <i class="bi bi-code-square"></i>
                  </div>
                  <div>
                    <div class="fw-semibold small">Code Warrior</div>
                    <small class="text-muted">Solved 15 problems</small>
                  </div>
                </div>
              </div>
            </div>

            <!-- Quick Stats -->
            <div class="card border-0 shadow-sm">
              <div class="card-header bg-info text-white">
                <h6 class="mb-0">
                  <i class="bi bi-bar-chart me-2"></i>
                  Quick Stats
                </h6>
              </div>
              <div class="card-body p-3">
                <div class="row text-center g-3">
                  <div class="col-6">
                    <div class="border-end">
                      <div class="h4 fw-bold text-primary mb-1">24</div>
                      <small class="text-muted">Quizzes Taken</small>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="h4 fw-bold text-success mb-1">18</div>
                    <small class="text-muted">Assignments Done</small>
                  </div>
                  <div class="col-6">
                    <div class="border-end">
                      <div class="h4 fw-bold text-warning mb-1">92%</div>
                      <small class="text-muted">Attendance</small>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="h4 fw-bold text-danger mb-1">8.5</div>
                    <small class="text-muted">Avg Score</small>
                  </div>
                </div>
              </div>
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
