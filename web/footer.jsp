<%-- 
    Document   : footer
    Created on : 20 Jul, 2025, 1:47:10 AM
    Author     : DELL
--%>
<%@page import="in.tnpManagement.utility.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="footer bg-light py-5">
  <div class="container">
    <div class="row">
      <!-- App Info -->
      <div class="col-md-4 mb-4">
          <h5 class="fw-semibold text-primary mb-3"><%=AppInfo.appName%></h5>
        <p class="text-muted small">
          Empowering students with comprehensive training and placement
          resources. Your gateway to career success through quality education
          and skill development.
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
            <small class="text-muted">Educational Campus, Knowledge City</small>
          </div>
        </div>
      </div>

      <!-- Quick Links -->
      <div class="col-md-4 mb-4">
        <h5 class="fw-semibold text-primary mb-3">Quick Links</h5>
        <div class="quick-links">
          <a
            href="about.html"
            class="d-block text-muted text-decoration-none small mb-2"
            >About Us</a
          >
          <a
            href="privacy.html"
            class="d-block text-muted text-decoration-none small mb-2"
            >Privacy Policy</a
          >
          <a
            href="terms.html"
            class="d-block text-muted text-decoration-none small mb-2"
            >Terms of Service</a
          >
          <a
            href="help.html"
            class="d-block text-muted text-decoration-none small"
            >Help Center</a
          >
        </div>
      </div>
    </div>

    <hr class="my-4" />

    <div class="row align-items-center">
      <div class="col-md-6">
        <small class="text-muted"
          >© 2024 <%=AppInfo.appName%>. All rights reserved.</small
        >
      </div>
      <div class="col-md-6 text-md-end mt-2 mt-md-0">
        <small
          class="text-muted d-flex align-items-center justify-content-md-end"
        >
          Designed By InfiniTech
          <i class="bi bi-heart-fill text-danger mx-1"></i>
        </small>
      </div>
    </div>
  </div>    
</footer>
