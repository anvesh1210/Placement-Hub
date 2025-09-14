/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao.impl;

import com.google.gson.Gson;
import in.tnpManagement.dao.QuizDao;
import in.tnpManagement.pojo.QuizAttemptPojo;
import in.tnpManagement.pojo.QuizPojo;
import in.tnpManagement.pojo.QuizQuestionPojo;
import in.tnpManagement.pojo.QuizSectionPojo;
import in.tnpManagement.pojo.QuizSectionScorePojo;
import in.tnpManagement.utility.ConnectionManager;
import in.tnpManagement.utility.IDUtil;
import in.tnpManagement.utility.RedisManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import redis.clients.jedis.Jedis;

/**
 *
 * @author DELL
 */
public class QuizDaoImpl implements QuizDao{

    @Override
    public int getNextQuizId() {
        String sql = "SELECT QUIZ_SEQ.NEXTVAL FROM dual";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1; // Return -1 if something goes wrong
    }

    
    @Override
    public QuizPojo getQuizById(String quizId) {
        QuizPojo quiz = null;
        String sql = "SELECT quiz_id, quiz_title, total_marks, total_duration, " +
                    "start_time, end_time, created_by " +
                    "FROM quiz WHERE quiz_id = ?";

        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, IDUtil.unwrap(quizId));

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    quiz = new QuizPojo();
                    quiz.setQuizId(IDUtil.wrap("QUI", rs.getInt("quiz_id")));
                    quiz.setQuizTitle(rs.getString("quiz_title"));
                    quiz.setTotalMarks(rs.getInt("total_marks"));
                    quiz.setTotalDuration(rs.getInt("total_duration"));
                    quiz.setStartTime(rs.getTimestamp("start_time"));
                    quiz.setEndTime(rs.getTimestamp("end_time"));
                    quiz.setCreatedBy(rs.getString("created_by"));
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quiz;
    }

    @Override
    public List<QuizPojo> getAllQuizzes() {
        List<QuizPojo> quizzes = new ArrayList<>();
        String sql = "SELECT quiz_id, quiz_title, total_marks, total_duration, " +
                 "start_time, end_time, created_by FROM quiz ORDER BY quiz_id DESC";

        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            QuizPojo quiz = new QuizPojo();
            quiz.setQuizId(IDUtil.wrap("QUI", rs.getInt("quiz_id")));
            quiz.setQuizTitle(rs.getString("quiz_title"));
            quiz.setTotalMarks(rs.getInt("total_marks"));
            quiz.setTotalDuration(rs.getInt("total_duration"));
            quiz.setStartTime(rs.getTimestamp("start_time"));
            quiz.setEndTime(rs.getTimestamp("end_time"));
            quiz.setCreatedBy(rs.getString("created_by"));
            quizzes.add(quiz);
        }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quizzes;
    }

    @Override
    public List<QuizPojo> getAllQuizzes(int offset, int limit) {
        List<QuizPojo> quizzes = new ArrayList<>();
    
        // Oracle 12c+ supports OFFSET-FETCH (like LIMIT in MySQL)
        String sql = "SELECT quiz_id, quiz_title, total_marks, total_duration, " +
                    "start_time, end_time, created_by " +
                    "FROM quiz ORDER BY quiz_id DESC " +
                    "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, offset);
            ps.setInt(2, limit);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                QuizPojo quiz = new QuizPojo();
                quiz.setQuizId(IDUtil.wrap("QUI", rs.getInt("quiz_id")));
                quiz.setQuizTitle(rs.getString("quiz_title"));
                quiz.setTotalMarks(rs.getInt("total_marks"));
                quiz.setTotalDuration(rs.getInt("total_duration"));
                quiz.setStartTime(rs.getTimestamp("start_time"));
                quiz.setEndTime(rs.getTimestamp("end_time"));
                quiz.setCreatedBy(rs.getString("created_by"));
                quizzes.add(quiz);
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return quizzes;
    }

    @Override
    public boolean createQuiz(QuizPojo quiz, List<QuizSectionPojo> sections, Map<String, List<QuizQuestionPojo>> sectionWiseQuestions) {
        String quizSql = "INSERT INTO quiz (quiz_id, quiz_title, total_marks, total_duration, start_time, end_time, created_by) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        String sectionSql = "INSERT INTO quiz_section (section_id, quiz_id, subject_id, section_title, marks_per_question, total_questions) " +
                        "VALUES (?, ?, ?, ?, ?, ?)";
        String questionSql = "INSERT INTO quiz_question (question_id, section_id, question_text, option_a, option_b, option_c, option_d, correct_option) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = ConnectionManager.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // 1️⃣ Insert quiz
            try (PreparedStatement ps = conn.prepareStatement(quizSql)) {
                ps.setInt(1, IDUtil.unwrap(quiz.getQuizId()));
                ps.setString(2, quiz.getQuizTitle());
                ps.setInt(3, quiz.getTotalMarks());
                ps.setInt(4, quiz.getTotalDuration());
                ps.setTimestamp(5, quiz.getStartTime());
                ps.setTimestamp(6, quiz.getEndTime());
                ps.setString(7, quiz.getCreatedBy());
                ps.executeUpdate();
            }

            // 2️⃣ Insert sections (batch)
            try (PreparedStatement ps = conn.prepareStatement(sectionSql)) {
                for (QuizSectionPojo section : sections) {
                    ps.setInt(1, IDUtil.unwrap(section.getSectionId()));
                    ps.setInt(2, IDUtil.unwrap(section.getQuizId()));
                    ps.setString(3, section.getSubjectId());
                    ps.setString(4, section.getSectionTitle());
                    ps.setInt(5, section.getMarksPerQuestion());
                    ps.setInt(6, section.getTotalQuestions());
                    ps.addBatch();
                }
                ps.executeBatch();
            }

            // 3️⃣ Insert questions (batch by section)
            try (PreparedStatement ps = conn.prepareStatement(questionSql)) {
                for (Map.Entry<String, List<QuizQuestionPojo>> entry : sectionWiseQuestions.entrySet()) {
                    String sectionId = entry.getKey();
                    for (QuizQuestionPojo q : entry.getValue()) {
                        ps.setInt(1, IDUtil.unwrap(q.getQuestionId()));
                        ps.setInt(2, IDUtil.unwrap(sectionId));
                        ps.setString(3, q.getQuestionText());
                        ps.setString(4, q.getOptionA());
                        ps.setString(5, q.getOptionB());
                        ps.setString(6, q.getOptionC());
                        ps.setString(7, q.getOptionD());
                        ps.setString(8, String.valueOf(q.getCorrectOption())); // CHAR → String
                        ps.addBatch();
                    }
                }
                ps.executeBatch();
            }

            conn.commit(); // ✅ All good
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback(); // ❌ Rollback on error
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override
    public List<QuizSectionPojo> getSectionsByQuizId(String quizId) {
        List<QuizSectionPojo> sections = new ArrayList<>();
    String redisKey = "quiz:" + quizId + ":sections";

    try (Jedis jedis = RedisManager.getResource()) {
        // 1️⃣ Check Redis cache
        if (jedis.exists(redisKey)) {
            List<String> cachedSections = jedis.lrange(redisKey, 0, -1);
            Gson gson = new Gson();
            for (String sJson : cachedSections) {
                QuizSectionPojo section = gson.fromJson(sJson, QuizSectionPojo.class);
                sections.add(section);
            }
            System.out.println("✅ Cache hit for " + redisKey);
            return sections;
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("⚠️ Redis not available, falling back to DB.");
    }

    // 2️⃣ Cache miss → Fetch from DB
    String sql = "SELECT section_id, quiz_id, subject_id, section_title, marks_per_question, total_questions " +
                 "FROM quiz_section WHERE quiz_id = ?";
    try (Connection conn = ConnectionManager.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, IDUtil.unwrap(quizId));

        try (ResultSet rs = ps.executeQuery()) {
            Gson gson = new Gson();
            List<String> toCache = new ArrayList<>();

            while (rs.next()) {
                QuizSectionPojo section = new QuizSectionPojo();
                section.setSectionId(IDUtil.wrap("SEC", rs.getInt("section_id")));
                section.setQuizId(IDUtil.wrap("QUI", rs.getInt("quiz_id")));
                section.setSubjectId(rs.getString("subject_id"));
                section.setSectionTitle(rs.getString("section_title"));
                section.setMarksPerQuestion(rs.getInt("marks_per_question"));
                section.setTotalQuestions(rs.getInt("total_questions"));

                sections.add(section);

                // Convert to JSON for Redis
                toCache.add(gson.toJson(section));
            }

            // 3️⃣ Save to Redis for next time
            if (!toCache.isEmpty()) {
                try (Jedis jedis = RedisManager.getResource()) {
                    jedis.rpush(redisKey, toCache.toArray(new String[0]));
                    jedis.expire(redisKey, 3600); // 1 hour expiry
                    System.out.println("✅ Cached " + toCache.size() + " sections in Redis.");
                }
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return sections;
    }

    @Override
    public List<QuizQuestionPojo> getQuestionsBySectionId(String sectionId) {
         List<QuizQuestionPojo> questions = new ArrayList<>();
    String redisKey = "section:" + sectionId + ":questions";

    try (Jedis jedis = RedisManager.getResource()) {
        // 1️⃣ Check Redis cache
        if (jedis.exists(redisKey)) {
            List<String> cachedQuestions = jedis.lrange(redisKey, 0, -1);
            Gson gson = new Gson();
            for (String qJson : cachedQuestions) {
                QuizQuestionPojo q = gson.fromJson(qJson, QuizQuestionPojo.class);
                questions.add(q);
            }
            System.out.println("✅ Cache hit for " + redisKey);
            return questions;
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("⚠️ Redis not available, falling back to DB.");
    }

    // 2️⃣ Cache miss → Fetch from DB
    String sql = "SELECT question_id, section_id, question_text, option_a, option_b, option_c, option_d, correct_option " +
                 "FROM quiz_question WHERE section_id = ?";
    try (Connection conn = ConnectionManager.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, IDUtil.unwrap(sectionId));

        try (ResultSet rs = ps.executeQuery()) {
            Gson gson = new Gson();
            List<String> toCache = new ArrayList<>();

            while (rs.next()) {
                QuizQuestionPojo q = new QuizQuestionPojo();
                q.setQuestionId(IDUtil.wrap("QST", rs.getInt("question_id")));
                q.setSectionId(IDUtil.wrap("SEC", rs.getInt("section_id")));
                q.setQuestionText(rs.getString("question_text"));
                q.setOptionA(rs.getString("option_a"));
                q.setOptionB(rs.getString("option_b"));
                q.setOptionC(rs.getString("option_c"));
                q.setOptionD(rs.getString("option_d"));
                q.setCorrectOption(rs.getString("correct_option").charAt(0));

                questions.add(q);

                // Convert to JSON for Redis
                toCache.add(gson.toJson(q));
            }

            // 3️⃣ Save to Redis
            if (!toCache.isEmpty()) {
                try (Jedis jedis = RedisManager.getResource()) {
                    jedis.rpush(redisKey, toCache.toArray(new String[0]));
                    jedis.expire(redisKey, 3600); // 1 hour expiry
                    System.out.println("✅ Cached " + toCache.size() + " section-questions in Redis.");
                }
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return questions;
    }

    @Override
    public List<QuizQuestionPojo> getQuestionsByQuizId(String quizId) {
        List<QuizQuestionPojo> questions = new ArrayList<>();
        String redisKey = "quiz:" + quizId + ":questions";

        try (Jedis jedis = RedisManager.getResource()) {
            // 1️⃣ Check Redis cache
            if (jedis.exists(redisKey)) {
                List<String> cachedQuestions = jedis.lrange(redisKey, 0, -1);
                Gson gson = new Gson();
                for (String qJson : cachedQuestions) {
                    QuizQuestionPojo q = gson.fromJson(qJson, QuizQuestionPojo.class);
                    questions.add(q);
                }
                System.out.println("✅ Cache hit for " + redisKey);
                return questions;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("⚠️ Redis not available, falling back to DB.");
        }

        // 2️⃣ Cache miss → Fetch from DB
        String sql = "SELECT question_id, section_id, question_text, option_a, option_b, option_c, option_d, correct_option " +
                    "FROM quiz_question WHERE quiz_id = ?";
        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, IDUtil.unwrap(quizId));

            try (ResultSet rs = ps.executeQuery()) {
                Gson gson = new Gson();
                List<String> toCache = new ArrayList<>();

                while (rs.next()) {
                    QuizQuestionPojo q = new QuizQuestionPojo();
                    q.setQuestionId(IDUtil.wrap("QST", rs.getInt("question_id")));
                    q.setSectionId(IDUtil.wrap("SEC", rs.getInt("section_id")));
                    q.setQuestionText(rs.getString("question_text"));
                    q.setOptionA(rs.getString("option_a"));
                    q.setOptionB(rs.getString("option_b"));
                    q.setOptionC(rs.getString("option_c"));
                    q.setOptionD(rs.getString("option_d"));
                    q.setCorrectOption(rs.getString("correct_option").charAt(0));

                    questions.add(q);

                // Convert to JSON for Redis
                    toCache.add(gson.toJson(q));
                }

                // 3️⃣ Save to Redis for future fast reads
                if (!toCache.isEmpty()) {
                    try (Jedis jedis = RedisManager.getResource()) {
                        jedis.rpush(redisKey, toCache.toArray(new String[0]));
                        jedis.expire(redisKey, 3600); // expire in 1 hour
                        System.out.println("✅ Cached " + toCache.size() + " questions in Redis.");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return questions;
    }

    @Override
    public boolean saveQuizAttempt(QuizAttemptPojo attempt) {
        String sql = "INSERT INTO quiz_attempt (enrollment_no, quiz_id, started_at, submitted_at) " +
                    "VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, attempt.getEnrollmentNo());
            ps.setInt(2, IDUtil.unwrap(attempt.getQuizId()));
            ps.setTimestamp(3, attempt.getStartedAt());
            ps.setTimestamp(4, attempt.getSubmittedAt());

            return ps.executeUpdate() > 0;

        } catch (SQLException ex) {
            if (ex.getErrorCode() == 1) { // ORA-00001: unique constraint violated
                System.out.println("Student has already attempted this quiz.");
            } else {
                ex.printStackTrace();
            }
        }
        return false;    
    }

    @Override
    public boolean saveQuizSectionScores(List<QuizSectionScorePojo> scores) {
        String sql = "INSERT INTO quiz_section_score (enrollment_no, quiz_id, section_id, score_obtained) " +
                 "VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            for (QuizSectionScorePojo score : scores) {
                ps.setString(1, score.getEnrollmentNo());
                ps.setInt(2, IDUtil.unwrap(score.getQuizId()));
                ps.setInt(3, IDUtil.unwrap(score.getSectionId()));
                ps.setInt(4, score.getScoreObtained()); // Assuming your POJO has score field
                ps.addBatch();
            }

            int[] rows = ps.executeBatch();
            return rows.length == scores.size(); // ✅ Ensure all rows inserted

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<QuizAttemptPojo> getAttemptsByStudent(String enrollmentNo) {
        List<QuizAttemptPojo> attempts = new ArrayList<>();
        String sql = "SELECT enrollment_no, quiz_id, started_at, submitted_at " +
                    "FROM quiz_attempt WHERE enrollment_no = ? ORDER BY started_at DESC";

        try (Connection conn = ConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, enrollmentNo);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                QuizAttemptPojo attempt = new QuizAttemptPojo();
                attempt.setEnrollmentNo(rs.getString("enrollment_no"));
                attempt.setQuizId(IDUtil.wrap("QUI", rs.getInt("quiz_id")));
                attempt.setStartedAt(rs.getTimestamp("started_at"));
                attempt.setSubmittedAt(rs.getTimestamp("submitted_at"));
                attempts.add(attempt);
            }
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return attempts;
}

    @Override
    public List<QuizSectionScorePojo> getSectionScores(String quizId, String enrollmentNo) {
List<QuizSectionScorePojo> scores = new ArrayList<>();
    String sql = "SELECT enrollment_no, quiz_id, section_id, score_obtained " +
                 "FROM quiz_section_score " +
                 "WHERE quiz_id = ? AND enrollment_no = ?";

    try (Connection conn = ConnectionManager.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, IDUtil.unwrap(quizId));
        ps.setString(2, enrollmentNo);

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                QuizSectionScorePojo score = new QuizSectionScorePojo();
                score.setEnrollmentNo(rs.getString("enrollment_no"));
                score.setQuizId(IDUtil.wrap("QUI", rs.getInt("quiz_id")));
                score.setSectionId(IDUtil.wrap("SEC", rs.getInt("section_id")));
                score.setScoreObtained(rs.getInt("score_obtained"));
                scores.add(score);
            }
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return scores;
}
    
    public boolean hasStudentAttemptedQuiz(String enrollmentNo, String quizId){
        String sql = "SELECT 1 FROM quiz_attempt WHERE enrollment_no = ? AND quiz_id = ? FETCH FIRST 1 ROWS ONLY";

        try (Connection conn = ConnectionManager.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, enrollmentNo);
        ps.setInt(2, IDUtil.unwrap(quizId));

        try (ResultSet rs = ps.executeQuery()) {
            return rs.next();  // true if at least one row exists
        }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
}
