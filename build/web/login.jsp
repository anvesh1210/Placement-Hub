<%-- 
    Document   : login
    Created on : 19 Jul, 2025, 11:29:08 PM
    Author     : DELL
--%>
<%@page import="in.tnpManagement.utility.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - <%=AppInfo.appName%></title>

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
  <body class="bg-light">
    <!-- Include Header -->
    <jsp:include page="header.jsp" />

    <%
          String message=(String)request.getAttribute("message");
    %>
      
    <!-- Login Form -->
    <div class="container py-5">
      <div class="row justify-content-center min-vh-100 align-items-center">
        <div class="col-md-6 col-lg-5">
          <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-5">
              <!-- Header -->
              <div class="text-center mb-4">
                <div class="mb-3">
                  <div
                    class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle"
                    style="width: 80px; height: 80px"
                  >
                    <i class="bi bi-person-fill text-white fs-1"></i>
                  </div>
                </div>
                <h2 class="fw-bold text-dark mb-2">Welcome Back!</h2>
                <%
                        if(message!=null){%>
                        <p class="text-primary"><%=message%></p>
                        <%
                        }else{
                        %>
                    <p class="text-muted">
                        Sign in to your <%=AppInfo.appName%> account
                    </p>
                <%
                        }
                %>
                
              </div>
              
              <!-- Login Form -->
              <form id="loginForm" action="./LoginServlet" method="post">
                  
              <!-- Login Type Selection -->
              <div class="mb-4">
                <label class="form-label fw-medium">Login As:</label>
                <div class="row g-2">
                  <div class="col-4">
                    <input
                      type="radio"
                      class="btn-check"
                      name="loginType"
                      id="student"
                      value="student"
                      checked
                    />
                    <label
                      class="btn btn-outline-primary w-100 text-center"
                      for="student"
                    >
                      <i class="bi bi-person-badge d-block mb-1"></i>
                      <small>Student</small>
                    </label>
                  </div>
                  <div class="col-4">
                    <input
                      type="radio"
                      class="btn-check"
                      name="loginType"
                      id="faculty"
                      value="faculty"
                    />
                    <label
                      class="btn btn-outline-primary w-100 text-center"
                      for="faculty"
                    >
                      <i class="bi bi-person-workspace d-block mb-1"></i>
                      <small>Faculty</small>
                    </label>
                  </div>
                  <div class="col-4">
                    <input
                      type="radio"
                      class="btn-check"
                      name="loginType"
                      id="admin"
                      value="admin"
                    />
                    <label
                      class="btn btn-outline-primary w-100 text-center"
                      for="admin"
                    >
                      <i class="bi bi-shield-check d-block mb-1"></i>
                      <small>Admin</small>
                    </label>
                  </div>
                </div>
              </div>

              
              
                <div class="mb-3">
                  <label for="loginId" class="form-label fw-medium"
                    ><span id="loginLabel">Enrollment Number</span></label
                  >
                  <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                      <i
                        id="loginIcon"
                        class="bi bi-person-vcard text-muted"
                      ></i>
                    </span>
                    <input
                      type="text"
                      class="form-control border-start-0 bg-light"
                      id="loginId"
                      placeholder="Enter your enrollment number"
                      name="userId"
                      required
                    />
                  </div>
                </div>

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
                      placeholder="Enter your password"
                      name="password"
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
                </div>

                <div
                  class="d-flex justify-content-between align-items-center mb-4"
                >
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      id="remember"
                    />
                    <label class="form-check-label text-muted" for="remember">
                      Remember me
                    </label>
                  </div>
                  <a href="#" class="text-primary text-decoration-none small"
                    >Forgot Password?</a
                  >
                </div>

                <button type="submit" class="btn btn-primary w-100 py-3 mb-4">
                  <span id="loginButtonText">Sign In as Student</span>
                  <i class="bi bi-arrow-right ms-2"></i>
                </button>
              </form>

              <!-- Register Link -->
              <div class="text-center">
                <p class="text-muted mb-0">
                  Don't have an account?
                  <a
                    href="register.jsp"
                    class="text-primary text-decoration-none fw-medium"
                  >
                    Create one here
                  </a>
                </p>
              </div>

              <!-- Social Login -->
              <div class="mt-4 pt-4 border-top">
                <p class="text-center text-muted mb-3">
                  <small>Or continue with</small>
                </p>
                <div class="row g-2">
                  <div class="col-6">
                    <button
                      type="button"
                      class="btn btn-outline-secondary w-100"
                      onclick="alert('Google SSO integration coming soon!')"
                    >
                      <i class="bi bi-google me-2"></i>
                      Google
                    </button>
                  </div>
                  <div class="col-6">
                    <button
                      type="button"
                      class="btn btn-outline-secondary w-100"
                      onclick="alert('Microsoft SSO integration coming soon!')"
                    >
                      <i class="bi bi-microsoft me-2"></i>
                      Microsoft
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Help Text -->
          <div class="text-center mt-4">
            <p class="text-muted small">
              Need help? <a href="#" class="text-primary">Contact Support</a>
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

      // Login type selection functionality
      document.addEventListener("DOMContentLoaded", function () {
        const loginTypeRadios = document.querySelectorAll(
          'input[name="loginType"]',
        );
        const loginLabel = document.getElementById("loginLabel");
        const loginButtonText = document.getElementById("loginButtonText");
        const loginInput = document.getElementById("loginId");
        const loginIcon = document.getElementById("loginIcon");

        loginTypeRadios.forEach((radio) => {
          radio.addEventListener("change", function () {
            const selectedType = this.value;
            switch (selectedType) {
              case "student":
                loginLabel.textContent = "Enrollment Number";
                loginButtonText.textContent = "Sign In as Student";
                loginInput.placeholder = "Enter your enrollment number";
                loginInput.type = "text";
                loginIcon.className = "bi bi-person-vcard text-muted";
                break;
              case "faculty":
                loginLabel.textContent = "Email Address";
                loginButtonText.textContent = "Sign In as Faculty";
                loginInput.placeholder = "Enter your email address";
                loginInput.type = "email";
                loginIcon.className = "bi bi-envelope text-muted";
                break;
              case "admin":
                loginLabel.textContent = "Email Address";
                loginButtonText.textContent = "Sign In as Admin";
                loginInput.placeholder = "Enter your email address";
                loginInput.type = "email";
                loginIcon.className = "bi bi-envelope text-muted";
                break;
            }
          });
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
    
    </script>
  </body>
</html>
