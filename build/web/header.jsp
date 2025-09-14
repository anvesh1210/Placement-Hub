<%-- 
    Document   : header
    Created on : 20 Jul, 2025, 1:47:01 AM
    Author     : DELL
--%>
<%@page import="in.tnpManagement.utility.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
            String loginType=(String)session.getAttribute("loginType");
            String enrollment =(String) session.getAttribute("enrollment");
            String firstName =(String) session.getAttribute("firstName");
            if(loginType==null){
                    //GUEST
%> 
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
      <a class="navbar-brand fw-bold text-primary" href="index.jsp"
        ><%=AppInfo.appName%></a
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
        <li class="nav-item me-3">
          <a class="nav-link fw-medium" href="index.jsp">Home</a>
        </li>
        <li class="nav-item me-3">
          <a
            class="nav-link fw-medium d-flex align-items-center"
            href="notifications.html"
          >
            <i class="bi bi-bell me-2"></i>
            Notifications
          </a>
        </li>
        <li class="nav-item me-4">
          <a
            class="nav-link fw-medium d-flex align-items-center"
            href="attendance.jsp"
          >
            <i class="bi bi-calendar-check me-2"></i>
            Attendance
          </a>
        </li>
        <li class="nav-item me-2">
          <a class="btn btn-outline-primary px-4 py-2" href="login.jsp">
            <i class="bi bi-box-arrow-in-right me-2"></i>
            Login
          </a>
        </li>
        <li class="nav-item">
          <a class="btn btn-primary px-4 py-2" href="register.jsp">
            <i class="bi bi-person-plus me-2"></i>
            Register
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<% 
            }else if(loginType.equalsIgnoreCase("student")){
                    //Student
%> 
<!-- Student Navigation Bar -->
<nav
  class="navbar navbar-expand-lg navbar-light bg-white shadow-sm border-bottom"
>
  <div class="container">
    <!-- Logo and App Name -->
    <div class="d-flex align-items-center">
      <div class="logo-container me-3">
        <i class="bi bi-mortarboard-fill"></i>
      </div>
      <a class="navbar-brand fw-bold text-primary" href="studentHome.jsp"
        ><%=AppInfo.appName%></a
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
        <li class="nav-item me-3">
          <a class="nav-link fw-medium" href="studentHome.jsp">Dashboard</a>
        </li>
        <li class="nav-item me-3">
          <a
            class="nav-link fw-medium d-flex align-items-center position-relative"
            href="notifications.jsp"
          >
            <i class="bi bi-bell me-2"></i>
            Notifications
            <!-- Notification Badge -->
            <span
              class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
              style="font-size: 0.6rem"
            >
              3
            </span>
          </a>
        </li>
        <li class="nav-item me-4">
          <a
            class="nav-link fw-medium d-flex align-items-center"
            href="attendance.jsp"
          >
            <i class="bi bi-calendar-check me-2"></i>
            Attendance
          </a>
        </li>

        <!-- Profile Dropdown -->
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle d-flex align-items-center"
            href="#"
            id="profileDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <div
              class="profile-avatar me-2 d-flex align-items-center justify-content-center"
            >
              <i class="bi bi-person-fill text-white"></i>
            </div>
            <span class="fw-medium"><%= firstName%></span>
          </a>
          <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0">
            <li class="dropdown-header">
              <div class="d-flex align-items-center">
                <div
                  class="profile-avatar-small me-2 d-flex align-items-center justify-content-center"
                >
                  <i class="bi bi-person-fill text-white"></i>
                </div>
                <div>
                    <div class="fw-semibold"><%= firstName%></div>
                  <small class="text-muted">Enrollment no: <%= enrollment%></small>
                </div>
              </div>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="./StudentProfileServlet">
                <i class="bi bi-person-lines-fill me-3 text-primary"></i>
                View Profile
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-pencil-square me-3 text-secondary"></i>
                Edit Profile
              </a>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a
                class="dropdown-item d-flex align-items-center text-danger"
                href="./LogoutServlet"
              >
                <i class="bi bi-box-arrow-right me-3"></i>
                Logout
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<% 
            }else if(loginType.equalsIgnoreCase("faculty")){
                    //faculty
%> 
<!-- Faculty Navigation Bar -->
<nav
  class="navbar navbar-expand-lg navbar-light bg-white shadow-sm border-bottom faculty-nav"
>
  <div class="container">
    <!-- Logo and App Name -->
    <div class="d-flex align-items-center">
      <div class="logo-container me-3">
        <i class="bi bi-mortarboard-fill"></i>
      </div>
      <a class="navbar-brand fw-bold text-primary" href="facultyHome.html"
        ><%=AppInfo.appName%></a
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
        <li class="nav-item me-3">
          <a class="nav-link fw-medium" href="facultyHome.html">Dashboard</a>
        </li>
        <li class="nav-item me-3">
          <a
            class="nav-link fw-medium d-flex align-items-center"
            href="student-management.html"
          >
            <i class="bi bi-people me-2"></i>
            Students
          </a>
        </li>
        <li class="nav-item me-3">
          <a
            class="nav-link fw-medium d-flex align-items-center position-relative"
            href="notifications.html"
          >
            <i class="bi bi-bell me-2"></i>
            Notifications
            <!-- Notification Badge -->
            <span
              class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
              style="font-size: 0.6rem"
            >
              5
            </span>
          </a>
        </li>
        <li class="nav-item me-4">
          <a
            class="nav-link fw-medium d-flex align-items-center"
            href="reports.html"
          >
            <i class="bi bi-graph-up me-2"></i>
            Reports
          </a>
        </li>

        <!-- Profile Dropdown -->
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle d-flex align-items-center"
            href="#"
            id="profileDropdown"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <div
              class="profile-avatar me-2 d-flex align-items-center justify-content-center faculty-dashboard"
            >
              <i class="bi bi-person-workspace text-white"></i>
            </div>
            <span class="fw-medium"><%= firstName%></span>
          </a>
          <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0">
            <li class="dropdown-header">
              <div class="d-flex align-items-center">
                <div
                  class="profile-avatar-small me-2 d-flex align-items-center justify-content-center"
                >
                  <i class="bi bi-person-workspace text-white"></i>
                </div>
                <div>
                  <div class="fw-semibold"><%= firstName%></div>
                  <small class="text-muted"><%= enrollment%></small>
                </div>
              </div>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-person-lines-fill me-3 text-primary"></i>
                View Profile
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-pencil-square me-3 text-secondary"></i>
                Edit Profile
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-gear me-3 text-info"></i>
                Settings
              </a>
            </li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a
                class="dropdown-item d-flex align-items-center text-danger"
                href="./LogoutServlet"
              >
                <i class="bi bi-box-arrow-right me-3"></i>
                Logout
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<% 
            }else if(loginType.equalsIgnoreCase("admin")){
                    //admin
}
%> 