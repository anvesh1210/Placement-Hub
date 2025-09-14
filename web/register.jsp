<%-- 
    Document   : register
    Created on : 19 Jul, 2025, 11:29:45 PM
    Author     : DELL
--%>
<%@page import="in.tnpManagement.utility.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - <%=AppInfo.appName%></title>

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
  <body class="bg-light">
    <!-- Include Header -->
    <jsp:include page="header.jsp" />
    
      <%
          String message=(String)request.getAttribute("message");
      %>

    <!-- Register Form -->
    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
          <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-5">
              <!-- Header -->
              <div class="text-center mb-4">
                <div class="mb-3">
                  <div
                    class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle"
                    style="width: 80px; height: 80px"
                  >
                    <i class="bi bi-person-plus-fill text-white fs-1"></i>
                  </div>
                </div>
                <h2 class="fw-bold text-dark mb-2">Create Account</h2>
                <%
                        if(message!=null){%>
                        <p class="text-primary"><%=message%></p>
                        <%
                        }else{
                        %>
                    <p class="text-muted">
                        Join <%=AppInfo.appName%> and start your learning journey
                    </p>
                <%
                        }
                %>
              </div>

              
              

              <!-- Registration Form -->
              <form id="registerForm" method="post" action="./RegistrationServlet">
                  
                  <!-- Registration Type Selection -->
                  <div class="mb-4">
                <label class="form-label fw-medium">Register As:</label>
                <div class="row g-3">
                  <div class="col-6">
                    <input
                      type="radio"
                      class="btn-check"
                      name="registerType"
                      id="studentReg"
                      value="student"
                      checked
                    />
                    <label
                      class="btn btn-outline-primary w-100 text-center py-3"
                      for="studentReg"
                    >
                      <i class="bi bi-person-badge d-block mb-2 fs-3"></i>
                      <div>
                        <strong>Student</strong>
                        <small class="d-block text-muted"
                          >For students seeking training</small
                        >
                      </div>
                    </label>
                  </div>
                  <div class="col-6">
                    <input
                      type="radio"
                      class="btn-check"
                      name="registerType"
                      id="facultyReg"
                      value="faculty"
                    />
                    <label
                      class="btn btn-outline-primary w-100 text-center py-3"
                      for="facultyReg"
                    >
                      <i class="bi bi-person-workspace d-block mb-2 fs-3"></i>
                      <div>
                        <strong>Faculty</strong>
                        <small class="d-block text-muted"
                          >For faculty members</small
                        >
                      </div>
                    </label>
                  </div>
                </div>
              </div>
                <!-- Common Fields -->
                <div class="mb-3">
                  <label for="fullName" class="form-label fw-medium"
                    >Full Name</label
                  >
                  <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                      <i class="bi bi-person text-muted"></i>
                    </span>
                    <input
                      type="text"
                      class="form-control border-start-0 bg-light"
                      id="fullName"
                      name="fullName"
                      placeholder="Enter your full name"
                      required
                    />
                  </div>
                </div>

                <!-- Student-specific fields -->
                <div id="studentFields">
                  <div class="mb-3">
                    <label for="enrollmentId" class="form-label fw-medium"
                      >Enrollment Number</label
                    >
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-person-vcard text-muted"></i>
                      </span>
                      <input
                        type="text"
                        class="form-control border-start-0 bg-light"
                        id="enrollmentId"
                        name="enrollment"
                        placeholder="Enter your enrollment number"
                        required
                      />
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="studentEmail" class="form-label fw-medium"
                      >Email Address</label
                    >
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-envelope text-muted"></i>
                      </span>
                      <input
                        type="email"
                        class="form-control border-start-0 bg-light"
                        id="studentEmail"
                        name="stuEmail"
                        placeholder="Enter your email"
                        required
                      />
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="studentPhone" class="form-label fw-medium"
                      >Phone Number</label
                    >
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-telephone text-muted"></i>
                      </span>
                      <input
                        type="tel"
                        class="form-control border-start-0 bg-light"
                        id="studentPhone"
                        name="stuPhone"
                        placeholder="Enter phone number"
                        required
                      />
                    </div>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <label for="branch" class="form-label fw-medium"
                        >Branch</label
                      >
                      <select class="form-select bg-light" name="stuBranch" id="branch" required>
                        <option value="">Select your branch</option>
                        <option>Computer Science Engineering</option>
                        <option>Artificial Intelligence and Machine Learning</option>
                        <option>Artificial Intelligence and Data Science </option>
                        <option>Mechanical Engineering</option>
                        <option>Civil Engineering</option>
                        <option>Electrical Engineering</option>
                        <option>Artificial Intelligence</option>
                        <option>Data Science</option>
                      </select>
                    </div>
                    <div class="col-md-6">
                      <label for="year" class="form-label fw-medium"
                        >Academic Year</label
                      >
                      <select class="form-select bg-light" name="stuYear" id="year" required>
                        <option value="">Select year</option>
                        <option value="1">1st Year</option>
                        <option value="2">2nd Year</option>
                        <option value="3">3rd Year</option>
                        <option value="4">4th Year</option>
                      </select>
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="college"  class="form-label fw-medium"
                      >College Name</label
                    >
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-building text-muted"></i>
                      </span>
                      <input
                        type="text"
                        class="form-control border-start-0 bg-light"
                        id="college"
                        name="stuCollege"
                        placeholder="Enter your college name"
                        required
                      />
                    </div>
                  </div>
                </div>

                <!-- Faculty-specific fields -->
                <div id="facultyFields" style="display: none">
                  <div class="mb-3">
                    <label for="facultyEmail" class="form-label fw-medium"
                      >Email Address</label
                    >
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-envelope text-muted"></i>
                      </span>
                      <input
                        type="email"
                        class="form-control border-start-0 bg-light"
                        id="facultyEmail"
                        name ="facultyEmail"
                        placeholder="Enter your email"
                      />
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="facultyPhone" class="form-label fw-medium"
                      >Phone Number</label
                    >
                    <div class="input-group">
                      <span class="input-group-text bg-light border-end-0">
                        <i class="bi bi-telephone text-muted"></i>
                      </span>
                      <input
                        type="tel"
                        class="form-control border-start-0 bg-light"
                        id="facultyPhone"
                        name="facultyPhone"
                        placeholder="Enter phone number"
                      />
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="department" class="form-label fw-medium"
                      >Department</label
                    >
                    <select class="form-select bg-light" id="department" name="facultyDept">
                      <option value="">Select department</option>
                      <option>Verbal</option>
                      <option>Technical</option>
                      <option>Aptitude and Reasoning</option>
                    </select>
                  </div>
                </div>

                <!-- Password Fields -->
                <div class="mb-3">
                  <label for="password" class="form-label fw-medium"
                    >Password</label
                  >
                  <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                      <i class="bi bi-lock text-muted"></i>
                    </span>
                    <input
                      type="password"
                      class="form-control border-start-0 bg-light"
                      id="password"
                      name="password"
                      placeholder="Create a password"
                      required
                    />
                    <button
                      class="btn btn-outline-secondary"
                      type="button"
                      id="togglePassword"
                    >
                      <i class="bi bi-eye"></i>
                    </button>
                  </div>
                  <div class="form-text">
                    Password must be at least 8 characters long
                  </div>
                </div>

                <div class="mb-3">
                  <label for="confirmPassword" class="form-label fw-medium"
                    >Confirm Password</label
                  >
                  <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                      <i class="bi bi-lock text-muted"></i>
                    </span>
                    <input
                      type="password"
                      class="form-control border-start-0 bg-light"
                      id="confirmPassword"
                      name="confirmPassword"
                      placeholder="Confirm your password"
                      required
                    />
                    
                  </div>
                </div>

                <div class="mb-4">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="terms"
                      required
                    />
                    <label class="form-check-label text-muted" for="terms">
                      I agree to the
                      <a href="#" class="text-primary">Terms of Service</a> and
                      <a href="#" class="text-primary">Privacy Policy</a>
                    </label>
                  </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 py-3 mb-4">
                  <span id="registerButtonText">Create Student Account</span>
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </form>

              <!-- Login Link -->
              <div class="text-center">
                <p class="text-muted mb-0">
                  Already have an account?
                  <a
                    href="login.jsp"
                    class="text-primary text-decoration-none fw-medium"
                  >
                    Sign in here
                  </a>
                </p>
              </div>
            </div>
          </div>

          <!-- Help Text -->
          <div class="text-center mt-4">
            <p class="text-muted small">
              Need help with registration?
              <a href="#" class="text-primary">Contact Support</a>
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Include Footer -->
    <jsp:include page="footer.jsp" />

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JavaScript -->
    <script src="script.js"></script>

    <!-- Script to load header and footer -->
    <script>
      
      // Registration functionality
      document.addEventListener("DOMContentLoaded", function () {
        const registerTypeRadios = document.querySelectorAll(
          'input[name="registerType"]',
        );
        const studentFields = document.getElementById("studentFields");
        const facultyFields = document.getElementById("facultyFields");
        const registerButtonText =
          document.getElementById("registerButtonText");

        // Toggle fields based on registration type
        registerTypeRadios.forEach((radio) => {
          radio.addEventListener("change", function () {
            const selectedType = this.value;
            if (selectedType === "student") {
              studentFields.style.display = "block";
              facultyFields.style.display = "none";
              registerButtonText.textContent = "Create Student Account";

              // Set required fields for student
              document.getElementById("enrollmentId").required = true;
              document.getElementById("studentEmail").required = true;
              document.getElementById("studentPhone").required = true;
              document.getElementById("branch").required = true;
              document.getElementById("year").required = true;
              document.getElementById("college").required = true;

              // Remove required from faculty fields
              document.getElementById("facultyEmail").required = false;
              document.getElementById("facultyPhone").required = false;
              document.getElementById("department").required = false;
            } else {
              studentFields.style.display = "none";
              facultyFields.style.display = "block";
              registerButtonText.textContent = "Create Faculty Account";

              // Set required fields for faculty
              document.getElementById("facultyEmail").required = true;
              document.getElementById("facultyPhone").required = true;
              document.getElementById("department").required = true;

              // Remove required from student fields
              document.getElementById("enrollmentId").required = false;
              document.getElementById("studentEmail").required = false;
              document.getElementById("studentPhone").required = false;
              document.getElementById("branch").required = false;
              document.getElementById("year").required = false;
              document.getElementById("college").required = false;
            }
          });
        });

        // Password toggle functionality
        const togglePassword = document.getElementById("togglePassword");
        const passwordInput = document.getElementById("password");

        togglePassword.addEventListener("click", function () {
          const type =
            passwordInput.getAttribute("type") === "password"
              ? "text"
              : "password";
          passwordInput.setAttribute("type", type);
          this.querySelector("i").classList.toggle("bi-eye");
          this.querySelector("i").classList.toggle("bi-eye-slash");
        });

        // Form validation and submission
//        document
//          .getElementById("registerForm")
//          .addEventListener("submit", function (e) {
//            e.preventDefault();
//
//            // Password validation
//            const password = document.getElementById("password").value;
//            const confirmPassword =
//              document.getElementById("confirmPassword").value;
//
//            if (password.length < 8) {
//              alert("Password must be at least 8 characters long");
//              return;
//            }
//
//            if (password !== confirmPassword) {
//              alert("Passwords do not match");
//              return;
//            }
//
//            // Get form data
////            const selectedType = document.querySelector(
////              'input[name="registerType"]:checked',
////            ).value;
////            const fullName = document.getElementById("fullName").value;
////
////            // Validate based on type
////            if (selectedType === "student") {
////              const enrollmentId =
////                document.getElementById("enrollmentId").value;
////              if (enrollmentId.length < 6) {
////                alert("Please enter a valid enrollment number");
////                return;
////              }
////            }
//
//            // Simulate registration process
////            const button = document.querySelector('button[type="submit"]');
////            button.innerHTML =
////              '<span class="spinner-border spinner-border-sm me-2"></span>Creating Account...';
////            button.disabled = true;
////
////            setTimeout(() => {
////              alert(
////                `Registration successful as ${selectedType.charAt(0).toUpperCase() + selectedType.slice(1)}!\nWelcome ${fullName}!\nPlease check your email for verification.`,
////              );
////              // Here you would redirect to login or dashboard
////              window.location.href = "login.html";
////            }, 2000);
//          });
      });
    </script>
  </body>
</html>
