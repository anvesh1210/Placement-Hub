<%-- 
    Document   : codingPlateform
    Created on : 24 Jul, 2025, 8:43:59 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coding Platforms - TNP Application</title>
    
    

    <link rel="stylesheet" href="./CSS/codingPlatform.css">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Header -->

    <header class="header">
        <div class="container">
            <div class="nav-wrapper">
                <div class="logo-section">
                    <a href="LandingServlet" class="back-link">
                        <i class="fas fa-arrow-left"></i>
                        <span>Back to Home</span>
                    </a>
                </div>
                
            </div>
        </div>
    </header>



    <!-- Hero Section -->
    <section class="page-hero">
        <div class="container">
            <div class="page-hero-content">
                <h1 class="page-title">
                    <span class="text-primary">Coding</span> Platforms
                </h1>
                <p class="page-description">
                    Master your programming skills with these top-rated coding platforms. 
                    Practice problems, participate in contests, and prepare for technical interviews.
                </p>
                <div class="stats-row">
                    <div class="stat-item">
                        <i class="fas fa-bullseye"></i>
                        <span>6 Platforms</span>
                    </div>
                    <div class="stat-item">
                        <i class="fas fa-clock"></i>
                        <span>24/7 Access</span>
                    </div>
                    <div class="stat-item">
                        <i class="fas fa-users"></i>
                        <span>Millions of Users</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Platforms Grid -->
    <section class="platforms-section">
        <div class="container">
            <div class="platforms-grid">
                <!-- LeetCode -->
                <div class="platform-card" onclick="openPlatform('https://leetcode.com', 'LeetCode')">
                    <div class="platform-header orange">
                        <div class="platform-emoji">🔥</div>
                        <div class="platform-info">
                            <h3 class="platform-name">LeetCode</h3>
                            <div class="platform-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="rating-value">4.8</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="platform-content">
                        <p class="platform-description">Practice coding problems with detailed solutions and discussions</p>
                        
                        <div class="platform-difficulty">
                            <span class="difficulty-badge">Beginner to Expert</span>
                        </div>

                        <div class="platform-features">
                            <h4 class="features-title">Key Features:</h4>
                            <div class="features-list">
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    2000+ Problems
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Weekly Contests
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Interview Prep
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Company Tags
                                </div>
                            </div>
                        </div>

                        <button class="platform-btn" onclick="event.stopPropagation(); openPlatform('https://leetcode.com', 'LeetCode')">
                            <span>Start Practicing</span>
                            <i class="fas fa-external-link-alt"></i>
                        </button>
                    </div>
                </div>

                <!-- CodeChef -->
                <div class="platform-card" onclick="openPlatform('https://www.codechef.com', 'CodeChef')">
                    <div class="platform-header brown">
                        <div class="platform-emoji">👨‍🍳</div>
                        <div class="platform-info">
                            <h3 class="platform-name">CodeChef</h3>
                            <div class="platform-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="rating-value">4.6</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="platform-content">
                        <p class="platform-description">Competitive programming platform with regular contests</p>
                        
                        <div class="platform-difficulty">
                            <span class="difficulty-badge">Beginner to Advanced</span>
                        </div>

                        <div class="platform-features">
                            <h4 class="features-title">Key Features:</h4>
                            <div class="features-list">
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Monthly Contests
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Learning Modules
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Certification
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Global Rankings
                                </div>
                            </div>
                        </div>

                        <button class="platform-btn" onclick="event.stopPropagation(); openPlatform('https://www.codechef.com', 'CodeChef')">
                            <span>Start Practicing</span>
                            <i class="fas fa-external-link-alt"></i>
                        </button>
                    </div>
                </div>

                <!-- HackerEarth -->
                <div class="platform-card" onclick="openPlatform('https://www.hackerearth.com', 'HackerEarth')">
                    <div class="platform-header blue">
                        <div class="platform-emoji">🌍</div>
                        <div class="platform-info">
                            <h3 class="platform-name">HackerEarth</h3>
                            <div class="platform-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <span class="rating-value">4.5</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="platform-content">
                        <p class="platform-description">Comprehensive platform for coding challenges and skill assessment</p>
                        
                        <div class="platform-difficulty">
                            <span class="difficulty-badge">All Levels</span>
                        </div>

                        <div class="platform-features">
                            <h4 class="features-title">Key Features:</h4>
                            <div class="features-list">
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Hackathons
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Skill Tests
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Hiring Challenges
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Practice Problems
                                </div>
                            </div>
                        </div>

                        <button class="platform-btn" onclick="event.stopPropagation(); openPlatform('https://www.hackerearth.com', 'HackerEarth')">
                            <span>Start Practicing</span>
                            <i class="fas fa-external-link-alt"></i>
                        </button>
                    </div>
                </div>

                <!-- HackerRank -->
                <div class="platform-card" onclick="openPlatform('https://www.hackerrank.com', 'HackerRank')">
                    <div class="platform-header green">
                        <div class="platform-emoji">🎯</div>
                        <div class="platform-info">
                            <h3 class="platform-name">HackerRank</h3>
                            <div class="platform-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="rating-value">4.7</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="platform-content">
                        <p class="platform-description">Skills-based coding challenges and interview preparation</p>
                        
                        <div class="platform-difficulty">
                            <span class="difficulty-badge">Beginner to Expert</span>
                        </div>

                        <div class="platform-features">
                            <h4 class="features-title">Key Features:</h4>
                            <div class="features-list">
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Skill Badges
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Interview Kit
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Certifications
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Domain Tracks
                                </div>
                            </div>
                        </div>

                        <button class="platform-btn" onclick="event.stopPropagation(); openPlatform('https://www.hackerrank.com', 'HackerRank')">
                            <span>Start Practicing</span>
                            <i class="fas fa-external-link-alt"></i>
                        </button>
                    </div>
                </div>

                <!-- Codeforces -->
                <div class="platform-card" onclick="openPlatform('https://codeforces.com', 'Codeforces')">
                    <div class="platform-header red">
                        <div class="platform-emoji">⚔️</div>
                        <div class="platform-info">
                            <h3 class="platform-name">Codeforces</h3>
                            <div class="platform-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="rating-value">4.9</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="platform-content">
                        <p class="platform-description">Popular competitive programming platform with regular contests</p>
                        
                        <div class="platform-difficulty">
                            <span class="difficulty-badge">Intermediate to Expert</span>
                        </div>

                        <div class="platform-features">
                            <h4 class="features-title">Key Features:</h4>
                            <div class="features-list">
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Regular Contests
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Problem Archive
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Ratings System
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Educational Rounds
                                </div>
                            </div>
                        </div>

                        <button class="platform-btn" onclick="event.stopPropagation(); openPlatform('https://codeforces.com', 'Codeforces')">
                            <span>Start Practicing</span>
                            <i class="fas fa-external-link-alt"></i>
                        </button>
                    </div>
                </div>

                <!-- AtCoder -->
                <div class="platform-card" onclick="openPlatform('https://atcoder.jp', 'AtCoder')">
                    <div class="platform-header purple">
                        <div class="platform-emoji">🗾</div>
                        <div class="platform-info">
                            <h3 class="platform-name">AtCoder</h3>
                            <div class="platform-rating">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="rating-value">4.8</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="platform-content">
                        <p class="platform-description">Japanese competitive programming platform with high-quality problems</p>
                        
                        <div class="platform-difficulty">
                            <span class="difficulty-badge">Beginner to Expert</span>
                        </div>

                        <div class="platform-features">
                            <h4 class="features-title">Key Features:</h4>
                            <div class="features-list">
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Beginner Contests
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Algorithm Visualization
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Educational Content
                                </div>
                                <div class="feature-item">
                                    <div class="feature-dot"></div>
                                    Problem Library
                                </div>
                            </div>
                        </div>

                        <button class="platform-btn" onclick="event.stopPropagation(); openPlatform('https://atcoder.jp', 'AtCoder')">
                            <span>Start Practicing</span>
                            <i class="fas fa-external-link-alt"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Pro Tips Section -->
    <section class="tips-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Pro Tips for Coding Success</h2>
                <p class="section-subtitle">Master these strategies to excel on coding platforms</p>
            </div>

            <!-- Primary Tips -->
            <div class="tips-grid">
                <div class="tip-card enhanced">
                    <div class="tip-visual">
                        <div class="tip-icon blue">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="tip-graphic">
                            <div class="clock-visual">
                                <div class="clock-hand hour-hand"></div>
                                <div class="clock-hand minute-hand"></div>
                                <div class="clock-center"></div>
                            </div>
                        </div>
                    </div>
                    <h3 class="tip-title">Consistent Daily Practice</h3>
                    <p class="tip-description">Dedicate at least 30-60 minutes daily to coding practice across different platforms</p>
                    <div class="tip-details">
                        <div class="tip-strategy">
                            <i class="fas fa-lightbulb"></i>
                            <span>Set a daily coding alarm and stick to it</span>
                        </div>
                        <div class="tip-strategy">
                            <i class="fas fa-target"></i>
                            <span>Aim for 2-3 problems per day minimum</span>
                        </div>
                    </div>
                </div>

                <div class="tip-card enhanced">
                    <div class="tip-visual">
                        <div class="tip-icon green">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <div class="tip-graphic">
                            <div class="contest-visual">
                                <div class="ranking-bar" style="height: 40px; background: #ffd700;"></div>
                                <div class="ranking-bar" style="height: 30px; background: #c0c0c0; margin-top: 2px;"></div>
                                <div class="ranking-bar" style="height: 20px; background: #cd7f32; margin-top: 2px;"></div>
                            </div>
                        </div>
                    </div>
                    <h3 class="tip-title">Join Weekly Contests</h3>
                    <p class="tip-description">Participate in regular contests to improve problem-solving speed and accuracy under pressure</p>
                    <div class="tip-details">
                        <div class="tip-strategy">
                            <i class="fas fa-calendar-alt"></i>
                            <span>Schedule: LeetCode Weekly, CodeChef Long</span>
                        </div>
                        <div class="tip-strategy">
                            <i class="fas fa-stopwatch"></i>
                            <span>Practice time management and quick thinking</span>
                        </div>
                    </div>
                </div>

                <div class="tip-card enhanced">
                    <div class="tip-visual">
                        <div class="tip-icon purple">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="tip-graphic">
                            <div class="community-visual">
                                <div class="user-node"><i class="fas fa-user"></i></div>
                                <div class="user-node"><i class="fas fa-user"></i></div>
                                <div class="user-node"><i class="fas fa-user"></i></div>
                                <div class="connection-line"></div>
                                <div class="connection-line" style="transform: rotate(60deg);"></div>
                                <div class="connection-line" style="transform: rotate(120deg);"></div>
                            </div>
                        </div>
                    </div>
                    <h3 class="tip-title">Learn from Community</h3>
                    <p class="tip-description">Read discussions, analyze different solutions, and connect with other programmers</p>
                    <div class="tip-details">
                        <div class="tip-strategy">
                            <i class="fas fa-comments"></i>
                            <span>Read editorial solutions after solving</span>
                        </div>
                        <div class="tip-strategy">
                            <i class="fas fa-code-branch"></i>
                            <span>Study multiple approaches to same problem</span>
                        </div>
                    </div>
                
                </div>
            </div>
            


            <script src="./JS/codingPlatform.js"></script>
</body>
</html>

