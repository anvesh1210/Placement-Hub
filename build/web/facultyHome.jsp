<%-- 
    Document   : facultyHome
    Created on : 28 Jul, 2025, 1:04:45 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="in.tnpManagement.pojo.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Faculty Dashboard - TNP Application</title>

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
    <link href="headerFooter.css" rel="stylesheet" />
  </head>
  <body class="faculty-dashboard">
    <!-- Include Faculty Header -->
    <jsp:include page="header.jsp" />
    
    <%

        String enrollment =(String) session.getAttribute("enrollment");
        String firstName =(String) session.getAttribute("firstName");
        FacultyPojo faculty = (FacultyPojo) session.getAttribute("faculty");                                    
    %>

    <!-- Welcome Section -->
    <section class="welcome-section">
      <div class="container py-4">
        <div class="row align-items-center">
          <div class="col-md-8">
            <h2 class="fw-bold text-dark mb-2">
              Welcome back, <span class="text-primary"><%= firstName%></span>!
              👋
            </h2>
            <p class="text-muted mb-0">
              Manage students, track their progress, and guide their learning
              journey
            </p>
          </div>
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
              Faculty <span class="text-primary">Dashboard</span>
            </h1>
            <p class="lead text-muted max-w-3xl mx-auto">
              Manage student progress, create assessments, and provide guidance
              for successful career preparation.
            </p>
          </div>
        </div>

        <!-- Features section -->
        <div class="row mt-5">
          <div class="col-md-4 mb-4">
            <div class="feature-item text-center">
              <div class="feature-icon">
                <i class="bi bi-people-fill"></i>
              </div>
              <h5 class="fw-semibold mt-3">Student Management</h5>
              <p class="text-muted">
                Track and manage student progress across all programs
              </p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="feature-item text-center">
              <div class="feature-icon">
                <i class="bi bi-clipboard-data"></i>
              </div>
              <h5 class="fw-semibold mt-3">Assessment Tools</h5>
              <p class="text-muted">
                Create and manage quizzes, assignments, and evaluations
              </p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="feature-item text-center">
              <div class="feature-icon">
                <i class="bi bi-graph-up-arrow"></i>
              </div>
              <h5 class="fw-semibold mt-3">Analytics & Reports</h5>
              <p class="text-muted">
                Generate detailed reports on student performance and progress
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
          <h2 class="display-5 fw-bold mb-3">Faculty Tools</h2>
          <p class="lead text-muted">
            Access teaching resources and student management tools
          </p>
        </div>

        <div class="row g-4">
          <!-- Scorecard Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('scorecard.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon" style="background: #28a745">
                  <i class="bi bi-clipboard-data"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Scorecard</h5>
                <p class="card-text text-muted mb-4">
                  View performance metrics and assessment scorecards
                </p>
                <button class="btn btn-primary w-100">
                  View Scorecard
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Quiz Creation Card -->
          <div class="col-lg-4 col-md-6">
            <div
              class="nav-card h-100"
              onclick="navigateTo('create-quiz.html')"
            >
              <div class="card-body text-center p-4">
                <div class="nav-icon quiz">
                  <i class="bi bi-patch-question-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Create Quiz</h5>
                <p class="card-text text-muted mb-4">
                  Design and publish quizzes for student assessment
                </p>
                <button class="btn btn-primary w-100">
                  Create Quiz
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Resource Management Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('resources.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon pdf">
                  <i class="bi bi-file-earmark-text-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Resources</h5>
                <p class="card-text text-muted mb-4">
                  Upload and manage study materials and resources
                </p>
                <button class="btn btn-primary w-100">
                  Manage Resources
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Attendance Tracking Card -->
          <div class="col-lg-4 col-md-6">
            <div
              class="nav-card h-100"
              onclick="navigateTo('attendance-management.html')"
            >
              <div class="card-body text-center p-4">
                <div class="nav-icon" style="background: #fd7e14">
                  <i class="bi bi-calendar-check-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Attendance</h5>
                <p class="card-text text-muted mb-4">
                  Track and manage student attendance records
                </p>
                <button class="btn btn-primary w-100">
                  Track Attendance
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Grading System Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('grading.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon" style="background: #e83e8c">
                  <i class="bi bi-award-fill"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Grading</h5>
                <p class="card-text text-muted mb-4">
                  Grade assignments and provide student feedback
                </p>
                <button class="btn btn-primary w-100">
                  Grade Work
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>

          <!-- Reports & Analytics Card -->
          <div class="col-lg-4 col-md-6">
            <div class="nav-card h-100" onclick="navigateTo('reports.html')">
              <div class="card-body text-center p-4">
                <div class="nav-icon" style="background: #17a2b8">
                  <i class="bi bi-graph-up"></i>
                </div>
                <h5 class="card-title fw-semibold mt-4 mb-3">Reports</h5>
                <p class="card-text text-muted mb-4">
                  Generate detailed performance and progress reports
                </p>
                <button class="btn btn-primary w-100">
                  View Reports
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Faculty Dashboard Overview Section -->
    <section class="overview-section py-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
              <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                  <i class="bi bi-bar-chart-line me-2"></i>
                  Class Overview
                </h4>
              </div>
              <div class="card-body p-4">
                <!-- Class Statistics -->
                <div class="row mb-4">
                  <div class="col-md-3 text-center">
                    <div class="stat-item">
                      <div class="h2 fw-bold text-primary mb-1">127</div>
                      <small class="text-muted">Total Students</small>
                    </div>
                  </div>
                  <div class="col-md-3 text-center">
                    <div class="stat-item">
                      <div class="h2 fw-bold text-success mb-1">89%</div>
                      <small class="text-muted">Avg Attendance</small>
                    </div>
                  </div>
                  <div class="col-md-3 text-center">
                    <div class="stat-item">
                      <div class="h2 fw-bold text-warning mb-1">45</div>
                      <small class="text-muted">Pending Reviews</small>
                    </div>
                  </div>
                  <div class="col-md-3 text-center">
                    <div class="stat-item">
                      <div class="h2 fw-bold text-info mb-1">8.2</div>
                      <small class="text-muted">Avg Score</small>
                    </div>
                  </div>
                </div>

                <!-- Recent Activity -->
                <h6 class="fw-semibold mb-3">Recent Student Activity</h6>
                <div class="activity-list">
                  <div class="activity-item d-flex align-items-center mb-3">
                    <div class="activity-icon bg-success text-white me-3">
                      <i class="bi bi-check-circle-fill"></i>
                    </div>
                    <div class="flex-grow-1">
                      <div class="fw-medium">Quiz Completed</div>
                      <small class="text-muted"
                        >25 students completed Data Structures Quiz #3</small
                      >
                    </div>
                    <small class="text-muted">2 hours ago</small>
                  </div>
                  <div class="activity-item d-flex align-items-center mb-3">
                    <div class="activity-icon bg-info text-white me-3">
                      <i class="bi bi-upload"></i>
                    </div>
                    <div class="flex-grow-1">
                      <div class="fw-medium">Assignment Submitted</div>
                      <small class="text-muted"
                        >18 new submissions for Web Development Project</small
                      >
                    </div>
                    <small class="text-muted">4 hours ago</small>
                  </div>
                  <div class="activity-item d-flex align-items-center">
                    <div class="activity-icon bg-warning text-white me-3">
                      <i class="bi bi-clock"></i>
                    </div>
                    <div class="flex-grow-1">
                      <div class="fw-medium">Deadline Approaching</div>
                      <small class="text-muted"
                        >Algorithm Assignment due in 2 days</small
                      >
                    </div>
                    <small class="text-muted">1 day ago</small>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <!-- Upcoming Events -->
            <div class="card border-0 shadow-sm mb-4">
              <div class="card-header bg-success text-white">
                <h6 class="mb-0">
                  <i class="bi bi-calendar-event me-2"></i>
                  Upcoming Events
                </h6>
              </div>
              <div class="card-body p-3">
                <div class="event-item mb-3">
                  <div class="d-flex align-items-start">
                    <div
                      class="event-date bg-primary text-white rounded p-2 me-3 text-center"
                    >
                      <div class="fw-bold">15</div>
                      <small>DEC</small>
                    </div>
                    <div>
                      <div class="fw-semibold small">
                        Parent-Teacher Meeting
                      </div>
                      <small class="text-muted"
                        >Computer Science Department</small
                      >
                      <div class="text-primary small">
                        <i class="bi bi-clock me-1"></i>2:00 PM - 5:00 PM
                      </div>
                    </div>
                  </div>
                </div>
                <div class="event-item mb-3">
                  <div class="d-flex align-items-start">
                    <div
                      class="event-date bg-warning text-dark rounded p-2 me-3 text-center"
                    >
                      <div class="fw-bold">18</div>
                      <small>DEC</small>
                    </div>
                    <div>
                      <div class="fw-semibold small">Faculty Meeting</div>
                      <small class="text-muted">Monthly Review Session</small>
                      <div class="text-primary small">
                        <i class="bi bi-clock me-1"></i>10:00 AM - 12:00 PM
                      </div>
                    </div>
                  </div>
                </div>
                <div class="event-item">
                  <div class="d-flex align-items-start">
                    <div
                      class="event-date bg-info text-white rounded p-2 me-3 text-center"
                    >
                      <div class="fw-bold">22</div>
                      <small>DEC</small>
                    </div>
                    <div>
                      <div class="fw-semibold small">Final Exams Begin</div>
                      <small class="text-muted"
                        >Semester End Examinations</small
                      >
                      <div class="text-primary small">
                        <i class="bi bi-clock me-1"></i>9:00 AM onwards
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Quick Actions -->
            <div class="card border-0 shadow-sm">
              <div class="card-header bg-info text-white">
                <h6 class="mb-0">
                  <i class="bi bi-lightning me-2"></i>
                  Quick Actions
                </h6>
              </div>
              <div class="card-body p-3">
                <div class="d-grid gap-2">
                  <button class="btn btn-outline-primary btn-sm">
                    <i class="bi bi-plus-circle me-2"></i>
                    Create New Quiz
                  </button>
                  <button class="btn btn-outline-success btn-sm">
                    <i class="bi bi-upload me-2"></i>
                    Upload Resource
                  </button>
                  <button class="btn btn-outline-warning btn-sm">
                    <i class="bi bi-calendar-plus me-2"></i>
                    Schedule Class
                  </button>
                  <button class="btn btn-outline-info btn-sm">
                    <i class="bi bi-file-text me-2"></i>
                    Generate Report
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Include Footer -->
    <div id="footer"></div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script src="script.js"></script>
  </body>
</html>

