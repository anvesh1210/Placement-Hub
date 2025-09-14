/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// TNP Application - Interactive JavaScript

// Navigation function for cards


console.log("JavaScript file loaded"); // Add this at the top of your script

function navigateTo(url) {
    // Add a small delay for visual feedback
    setTimeout(() => {
      window.location.href = url;
    }, 200);
  }
  
  // Smooth scrolling for anchor links
  document.addEventListener("DOMContentLoaded", function () {
    // Add click event listeners to all internal links
    const internalLinks = document.querySelectorAll('a[href^="#"]');
    internalLinks.forEach((link) => {
      link.addEventListener("click", function (e) {
        e.preventDefault();
        const targetId = this.getAttribute("href").substring(1);
        const targetElement = document.getElementById(targetId);
  
        if (targetElement) {
          targetElement.scrollIntoView({
            behavior: "smooth",
            block: "start",
          });
        }
      });
    });
  
    // Add animation to cards on scroll
    const observerOptions = {
      threshold: 0.1,
      rootMargin: "0px 0px -50px 0px",
    };
  
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.style.opacity = "1";
          entry.target.style.transform = "translateY(0)";
        }
      });
    }, observerOptions);
  
    // Observe all navigation cards
    const navCards = document.querySelectorAll(".nav-card");
    navCards.forEach((card, index) => {
      card.style.opacity = "0";
      card.style.transform = "translateY(30px)";
      card.style.transition = `opacity 0.6s ease ${
        index * 0.1
      }s, transform 0.6s ease ${index * 0.1}s`;
      observer.observe(card);
    });
  
    // Add hover effects to navigation cards
    navCards.forEach((card) => {
      card.addEventListener("mouseenter", function () {
        this.style.transform = "translateY(-10px) scale(1.02)";
      });
  
      card.addEventListener("mouseleave", function () {
        this.style.transform = "translateY(0) scale(1)";
      });
    });
  
    // Add ripple effect to buttons
    const buttons = document.querySelectorAll(".btn");
    buttons.forEach((button) => {
      button.addEventListener("click", function (e) {
        const ripple = document.createElement("span");
        const rect = this.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = e.clientX - rect.left - size / 2;
        const y = e.clientY - rect.top - size / 2;
  
        ripple.style.width = ripple.style.height = size + "px";
        ripple.style.left = x + "px";
        ripple.style.top = y + "px";
        ripple.classList.add("ripple");
  
        this.appendChild(ripple);
  
        setTimeout(() => {
          ripple.remove();
        }, 600);
      });
    });
  
    // Add scroll to top functionality
    const scrollToTopBtn = document.createElement("button");
    scrollToTopBtn.innerHTML = '<i class="bi bi-arrow-up"></i>';
    scrollToTopBtn.className = "btn btn-primary scroll-to-top";
    scrollToTopBtn.style.cssText = `
      position: fixed;
      bottom: 20px;
      right: 20px;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: none;
      z-index: 1000;
      box-shadow: 0 4px 12px rgba(0, 102, 204, 0.3);
    `;
  
    document.body.appendChild(scrollToTopBtn);
  
    // Show/hide scroll to top button
    window.addEventListener("scroll", () => {
      if (window.pageYOffset > 300) {
        scrollToTopBtn.style.display = "block";
      } else {
        scrollToTopBtn.style.display = "none";
      }
    });
  
    // Scroll to top functionality
    scrollToTopBtn.addEventListener("click", () => {
      window.scrollTo({
        top: 0,
        behavior: "smooth",
      });
    });
  
    // Add loading animation for page transitions
    const links = document.querySelectorAll("a:not([href^='#']):not([target])");
    links.forEach((link) => {
      link.addEventListener("click", function (e) {
        // Only add loading for internal navigation
        if (this.hostname === window.location.hostname) {
          document.body.style.opacity = "0.8";
          document.body.style.pointerEvents = "none";
        }
      });
    });
  
    // Add typing animation to hero title
    const heroTitle = document.querySelector(".hero-content h1");
    if (heroTitle) {
      const text = heroTitle.innerHTML;
      heroTitle.innerHTML = "";
      let i = 0;
  
      function typeWriter() {
        if (i < text.length) {
          heroTitle.innerHTML += text.charAt(i);
          i++;
          setTimeout(typeWriter, 50);
        }
      }
  
      // Start typing animation after a short delay
      setTimeout(typeWriter, 500);
    }
  
    // Add parallax effect to hero section
    window.addEventListener("scroll", () => {
      const scrolled = window.pageYOffset;
      const heroSection = document.querySelector(".hero-section");
      if (heroSection) {
        heroSection.style.transform = `translateY(${scrolled * 0.5}px)`;
      }
    });
  
    // Add form validation for contact forms (if present)
    const forms = document.querySelectorAll("form");
    forms.forEach((form) => {
      form.addEventListener("submit", function (e) {
        const inputs = form.querySelectorAll(
          "input[required], textarea[required]",
        );
        let isValid = true;
  
        inputs.forEach((input) => {
          if (!input.value.trim()) {
            isValid = false;
            input.classList.add("is-invalid");
          } else {
            input.classList.remove("is-invalid");
          }
        });
  
        if (!isValid) {
          e.preventDefault();
          alert("Please fill in all required fields.");
        }
      });
    });
  
    // Add search functionality (if search box is present)
    const searchInput = document.querySelector('input[type="search"]');
    if (searchInput) {
      searchInput.addEventListener("input", function () {
        const searchTerm = this.value.toLowerCase();
        const cards = document.querySelectorAll(".nav-card");
  
        cards.forEach((card) => {
          const title = card
            .querySelector(".card-title")
            .textContent.toLowerCase();
          const description = card
            .querySelector(".card-text")
            .textContent.toLowerCase();
  
          if (title.includes(searchTerm) || description.includes(searchTerm)) {
            card.style.display = "block";
          } else {
            card.style.display = "none";
          }
        });
      });
    }
  
    // Add notification system
    function showNotification(message, type = "info") {
      const notification = document.createElement("div");
      notification.className = `alert alert-${type} alert-dismissible fade show`;
      notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 1050;
        min-width: 300px;
      `;
      notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      `;
  
      document.body.appendChild(notification);
  
      // Auto-dismiss after 5 seconds
      setTimeout(() => {
        notification.remove();
      }, 5000);
    }
  
    // Example: Show welcome notification
    setTimeout(() => {
      showNotification("Welcome to TNP Application! 🎓", "success");
    }, 1000);
  });
  
  // CSS for ripple effect
  const style = document.createElement("style");
  style.textContent = `
    .btn {
      position: relative;
      overflow: hidden;
    }
  
    .ripple {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.6);
      transform: scale(0);
      animation: ripple-animation 0.6s linear;
      pointer-events: none;
    }
  
    @keyframes ripple-animation {
      to {
        transform: scale(4);
        opacity: 0;
      }
    }
  
    .scroll-to-top {
      transition: all 0.3s ease;
    }
  
    .scroll-to-top:hover {
      transform: translateY(-3px);
    }
  
    .nav-card {
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }
  
    .is-invalid {
      border-color: #dc3545;
      box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
    }
  `;
  
  document.head.appendChild(style);
  
  // Performance optimization: Debounce scroll events
  function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
      const later = () => {
        clearTimeout(timeout);
        func(...args);
      };
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
    };
  }
  
  // Apply debouncing to scroll events
  const debouncedScroll = debounce(() => {
    // Scroll-based animations here
  }, 10);
  
  window.addEventListener("scroll", debouncedScroll);
  
// link innfo

 const links = document.querySelectorAll('.footer-links a');
    const popups = document.querySelectorAll('.popup');
    const overlay = document.querySelector('.overlay');

    links.forEach(link => {
      link.addEventListener('click', () => {
        const popupId = link.getAttribute('data-popup');
        document.getElementById(popupId).style.display = 'block';
        overlay.style.display = 'block';
      });
    });

    document.querySelectorAll('.close').forEach(closeBtn => {
      closeBtn.addEventListener('click', () => {
        popups.forEach(popup => popup.style.display = 'none');
        overlay.style.display = 'none';
      });
    });

//    overlay.addEventListener('click', () => {
//      popups.forEach(popup => popup.style.display = 'none');
//      overlay.style.display = 'none';
//    });


 /* =================================
   STUDENT & FACULTY COMMON FUNCTIONS
   ================================= */

// Common function to load header and footer for dashboard pages




// Common function to set current date

function setCurrentDate() {
  const today = new Date();
  const options = {
    weekday: "long",
    year: "numeric",
    month: "long",
    day: "numeric",
  };
  const dateElement = document.getElementById("currentDate");
  if (dateElement) {
    console.log(today.toLocaleDateString("en-US", options));
    dateElement.textContent = today.toLocaleDateString("en-US", options);
  }
}

document.addEventListener("DOMContentLoaded", function () {
  console.log("DOM loaded");
  setCurrentDate(); // ✅ Call the correct function
});


