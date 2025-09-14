<%-- 
    Document   : studentProfile
    Created on : 22 Jul, 2025, 3:41:35 AM
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
    <title>Student Profile - <%=AppInfo.appName%></title>

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
        String shortBranch =(String) session.getAttribute("shortBranch");
        StudentPojo student = (StudentPojo) session.getAttribute("student");  
    %>
    <!-- Breadcrumb -->
    <section class="breadcrumb-section py-3 bg-light">
      <div class="container">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item">
              <a href="studentHome.jsp" class="text-primary">
                <i class="bi bi-house-door me-1"></i>
                Dashboard
              </a>
            </li>
            <li class="breadcrumb-item active" aria-current="page">
              Student Profile
            </li>
          </ol>
        </nav>
      </div>
    </section>

    <!-- Profile Section -->
    <section class="profile-section py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10">
            <!-- Profile Header with Summary -->
            <div class="card border-0 shadow-lg mb-4">
              <div class="card-header bg-primary text-white py-4">
                <div class="row align-items-center">
                  <div class="col-md-3 text-center">
                    <div class="profile-avatar-large mx-auto mb-3">
                      <i class="bi bi-person-fill text-white"></i>
                    </div>
                    <h4 class="fw-bold mb-1"><%= student.getStuName() %></h4>
                    <p class="mb-0 opacity-75">Student ID: <%= student.getEnrollNo()%></p>
                  </div>
                  <div class="col-md-6">
                    <div class="profile-info text-center text-md-start">
                      <h5 class="fw-semibold mb-3">Profile Overview</h5>
                      <div class="row text-center">
                        <div class="col-6">
                          <div class="overview-stat">
                            <div class="h3 fw-bold mb-1"><%= student.getYear() %>rd</div>
                            <small class="opacity-75">Year</small>
                          </div>
                        </div>
                        <div class="col-6">
                          <div class="overview-stat">
                            <div class="h3 fw-bold mb-1"><%= shortBranch %></div>
                            <small class="opacity-75">Branch</small>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-3 text-center text-md-end">
                    <div class="profile-actions">
                      <a href="edit-profile.html" class="btn btn-outline-light btn-sm mb-2 d-block">
                        <i class="bi bi-pencil-square me-1"></i>
                        Edit Profile
                      </a>
                      <button class="btn btn-light btn-sm d-block" onclick="printProfile()">
                        <i class="bi bi-printer me-1"></i>
                        Print Profile
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body p-4">
                <div class="row">
                  <div class="col-md-3 text-center border-end">
                    <div class="stat-item">
                      <div class="h4 fw-bold text-success mb-1">92%</div>
                      <small class="text-muted">Attendance</small>
                    </div>
                  </div>
                  <div class="col-md-3 text-center border-end">
                    <div class="stat-item">
                      <div class="h4 fw-bold text-primary mb-1">24</div>
                      <small class="text-muted">Assignments Done</small>
                    </div>
                  </div>
                  <div class="col-md-3 text-center border-end">
                    <div class="stat-item">
                      <div class="h4 fw-bold text-warning mb-1">18</div>
                      <small class="text-muted">Quizzes Taken</small>
                    </div>
                  </div>
                  <div class="col-md-3 text-center">
                    <div class="stat-item">
                      <div class="h4 fw-bold text-info mb-1">5</div>
                      <small class="text-muted">Certificates</small>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-lg-8">
                <!-- Personal Information -->
                <div class="card border-0 shadow-lg mb-4">
                  <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="mb-0 text-primary">
                      <i class="bi bi-person-vcard me-2"></i>
                      Personal Information
                    </h5>
                  </div>
                  <div class="card-body">
                    <div class="row g-4">
                      <!-- Student Name -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-person me-2 text-primary"></i>
                            Full Name
                          </label>
                          <div class="info-value"><%= student.getStuName() %></div>
                        </div>
                      </div>

                      <!-- Enrollment Number -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-person-vcard me-2 text-primary"></i>
                            Enrollment Number
                          </label>
                          <div class="info-value"><%= student.getEnrollNo()%></div>
                        </div>
                      </div>

                      <!-- Email -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-envelope me-2 text-primary"></i>
                            Email Address
                          </label>
                          <div class="info-value"><%= student.getEmail() %></div>
                        </div>
                      </div>

                      <!-- Password (Masked) -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-lock me-2 text-primary"></i>
                            Password
                          </label>
                          <div class="info-value d-flex align-items-center">
                            <span id="passwordDisplay">••••••••</span>
                            <button 
                              class="btn btn-sm btn-link text-primary ms-2 p-0" 
                              onclick="togglePassword()"
                              id="passwordToggle"
                            >
                              <i class="bi bi-eye"></i>
                            </button>
                          </div>
                        </div>
                      </div>

                      <!-- Phone -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-telephone me-2 text-primary"></i>
                            Phone Number
                          </label>
                          <div class="info-value">+91 <%= student.getPhone() %></div>
                        </div>
                      </div>



                      <!-- Branch -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-diagram-3 me-2 text-primary"></i>
                            Branch
                          </label>
                          <div class="info-value"><%= student.getDept() %></div>
                        </div>
                      </div>

                      <!-- Current Year -->
                      <div class="col-md-6">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-calendar-event me-2 text-primary"></i>
                            Current Year
                          </label>
                          <div class="info-value"><%= student.getYear() %> Year </div>
                        </div>
                      </div>

                      <!-- College -->
                      <div class="col-12">
                        <div class="info-item">
                          <label class="form-label fw-semibold text-muted">
                            <i class="bi bi-building me-2 text-primary"></i>
                            College Name
                          </label>
                          <div class="info-value">
                            <%= student.getCollege() %>
                          </div>
                        </div>
                      </div>


                    </div>
                  </div>
                </div>

                <!-- Academic Progress -->
                <div class="card border-0 shadow-lg mb-4">
                  <div class="card-header bg-white py-3 border-bottom">
                    <h5 class="mb-0 text-primary">
                      <i class="bi bi-graph-up me-2"></i>
                      Academic Progress
                    </h5>
                  </div>
                  <div class="card-body">
                    <div class="row g-3">
                      <div class="col-md-6">
                        <div class="progress-item">
                          <div class="d-flex justify-content-between mb-2">
                            <span class="fw-medium">Data Structures & Algorithms</span>
                            <span class="text-success fw-bold">90%</span>
                          </div>
                          <div class="progress">
                            <div 
                              class="progress-bar bg-success" 
                              style="width: 90%"
                              data-width="90%"
                            ></div>
                          </div>
                          <small class="text-muted">Excellent Performance</small>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="progress-item">
                          <div class="d-flex justify-content-between mb-2">
                            <span class="fw-medium">Database Management</span>
                            <span class="text-info fw-bold">85%</span>
                          </div>
                          <div class="progress">
                            <div 
                              class="progress-bar bg-info" 
                              style="width: 85%"
                              data-width="85%"
                            ></div>
                          </div>
                          <small class="text-muted">Very Good Performance</small>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="progress-item">
                          <div class="d-flex justify-content-between mb-2">
                            <span class="fw-medium">Web Development</span>
                            <span class="text-warning fw-bold">78%</span>
                          </div>
                          <div class="progress">
                            <div 
                              class="progress-bar bg-warning" 
                              style="width: 78%"
                              data-width="78%"
                            ></div>
                          </div>
                          <small class="text-muted">Good Performance</small>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="progress-item">
                          <div class="d-flex justify-content-between mb-2">
                            <span class="fw-medium">Communication Skills</span>
                            <span class="text-orange fw-bold">65%</span>
                          </div>
                          <div class="progress">
                            <div 
                              class="progress-bar bg-warning" 
                              style="width: 65%"
                              data-width="65%"
                            ></div>
                          </div>
                          <small class="text-muted">Needs Improvement</small>
                        </div>
                      </div>
                    </div>
                    
                    <!-- Overall Progress -->
                    <div class="mt-4 p-3 bg-light rounded">
                      <div class="d-flex justify-content-between align-items-center mb-2">
                        <span class="fw-semibold">Overall Academic Progress</span>
                        <span class="h5 fw-bold text-primary mb-0">77%</span>
                      </div>
                      <div class="progress" style="height: 10px;">
                        <div class="progress-bar bg-primary" style="width: 77%"></div>
                      </div>
                      <small class="text-muted mt-1">Based on all subjects and activities</small>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-lg-4">
                <!-- Quick Actions -->
                <div class="card border-0 shadow-lg mb-4">
                  <div class="card-header bg-primary text-white py-3">
                    <h6 class="mb-0">
                      <i class="bi bi-lightning me-2"></i>
                      Quick Actions
                    </h6>
                  </div>
                  <div class="card-body">
                    <div class="d-grid gap-2">
                      <button class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-download me-2"></i>
                        Download Transcript
                      </button>
                      <button class="btn btn-outline-success btn-sm">
                        <i class="bi bi-calendar-plus me-2"></i>
                        Update Schedule
                      </button>
                      <button class="btn btn-outline-warning btn-sm">
                        <i class="bi bi-bell me-2"></i>
                        Notification Settings
                      </button>
                      <button class="btn btn-outline-info btn-sm">
                        <i class="bi bi-shield-lock me-2"></i>
                        Privacy Settings
                      </button>
                    </div>
                  </div>
                </div>

                <!-- Recent Achievements -->
                <div class="card border-0 shadow-lg mb-4">
                  <div class="card-header bg-success text-white py-3">
                    <h6 class="mb-0">
                      <i class="bi bi-trophy me-2"></i>
                      Recent Achievements
                    </h6>
                  </div>
                  <div class="card-body p-3">
                    <div class="achievement-item d-flex align-items-center mb-3">
                      <div class="badge bg-warning text-dark rounded-circle me-3" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-award-fill"></i>
                      </div>
                      <div>
                        <div class="fw-semibold small">Quiz Master</div>
                        <small class="text-muted">Completed 15 quizzes</small>
                      </div>
                    </div>
                    <div class="achievement-item d-flex align-items-center mb-3">
                      <div class="badge bg-primary rounded-circle me-3" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-book-fill"></i>
                      </div>
                      <div>
                        <div class="fw-semibold small">Study Streak</div>
                        <small class="text-muted">7 days in a row</small>
                      </div>
                    </div>
                    <div class="achievement-item d-flex align-items-center">
                      <div class="badge bg-info rounded-circle me-3" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-code-square"></i>
                      </div>
                      <div>
                        <div class="fw-semibold small">Code Warrior</div>
                        <small class="text-muted">50 problems solved</small>
                      </div>
                    </div>
                  </div>
                </div>



                <!-- Account Status -->
                <div class="card border-0 shadow-lg">
                  <div class="card-header bg-dark text-white py-3">
                    <h6 class="mb-0">
                      <i class="bi bi-shield-check me-2"></i>
                      Account Status
                    </h6>
                  </div>
                  <div class="card-body">
                    <div class="mb-3">
                      <div class="d-flex justify-content-between align-items-center">
                        <span class="small">Profile Completion</span>
                        <span class="badge bg-success">95%</span>
                      </div>
                    </div>
                    <div class="mb-3">
                      <div class="d-flex justify-content-between align-items-center">
                        <span class="small">Email Verified</span>
                        <i class="bi bi-check-circle-fill text-success"></i>
                      </div>
                    </div>
                    <div class="mb-3">
                      <div class="d-flex justify-content-between align-items-center">
                        <span class="small">Phone Verified</span>
                        <i class="bi bi-check-circle-fill text-success"></i>
                      </div>
                    </div>
                    <div>
                      <div class="d-flex justify-content-between align-items-center">
                        <span class="small">Account Status</span>
                        <span class="badge bg-success">Active</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Back Button -->
            <div class="text-center mt-4">
              <a href="studentHome.html" class="btn btn-outline-primary">
                <i class="bi bi-arrow-left me-2"></i>
                Back to Dashboard
              </a>
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
    <script src="./JS/script.js"></script>

    <!-- Page-specific JavaScript -->
    <script>
      // Password toggle functionality
      let passwordVisible = false;
      const actualPassword = "student123";

      function togglePassword() {
        const passwordDisplay = document.getElementById("passwordDisplay");
        const passwordToggle = document.getElementById("passwordToggle");
        
        if (passwordVisible) {
          passwordDisplay.textContent = "••••••••";
          passwordToggle.innerHTML = '<i class="bi bi-eye"></i>';
          passwordVisible = false;
        } else {
          passwordDisplay.textContent = actualPassword;
          passwordToggle.innerHTML = '<i class="bi bi-eye-slash"></i>';
          passwordVisible = true;
        }
      }

      // Print profile functionality
      function printProfile() {
        window.print();
      }

      // Initialize page
      document.addEventListener("DOMContentLoaded", function() {
        // Load student header and footer
        loadDashboardHeaderFooter("studentHeader.html");
        
        // Animate progress bars
        setTimeout(() => {
          animateStudentProgress();
        }, 1000);
      });
    </script>
  </body>
</html>

