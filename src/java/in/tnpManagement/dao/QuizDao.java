/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao;

import in.tnpManagement.pojo.QuizAttemptPojo;
import in.tnpManagement.pojo.QuizPojo;
import in.tnpManagement.pojo.QuizQuestionPojo;
import in.tnpManagement.pojo.QuizSectionPojo;
import in.tnpManagement.pojo.QuizSectionScorePojo;
import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public interface QuizDao {
    // ============================
    // QUIZ METADATA OPERATIONS
    // ============================
    public int getNextQuizId();
     
    public QuizPojo getQuizById(String quizId); // Fetch quiz details only

    public List<QuizPojo> getAllQuizzes(); // For listing (add pagination later)

    public List<QuizPojo> getAllQuizzes(int offset, int limit); // Pagination-supported listing


    // ============================
    // QUIZ CREATION (FACULTY)
    // ============================

    public boolean createQuiz(QuizPojo quiz, List<QuizSectionPojo> sections, Map<String, List<QuizQuestionPojo>> sectionWiseQuestions);
    // Batch insert quiz + sections + questions


    // ============================
    // QUIZ STRUCTURE FETCH (FOR REDIS)
    // ============================

    public List<QuizSectionPojo> getSectionsByQuizId(String quizId);

    public List<QuizQuestionPojo> getQuestionsBySectionId(String sectionId);

    public List<QuizQuestionPojo> getQuestionsByQuizId(String quizId);
    // Used when populating Redis at quiz start


    // ============================
    // QUIZ ATTEMPT + SCORE SAVE
    // ============================

    public boolean saveQuizAttempt(QuizAttemptPojo attempt); // Insert metadata (started_at, submitted_at)

    public boolean saveQuizSectionScores(List<QuizSectionScorePojo> scores); // Batch insert section-wise scores


    // ============================
    // RESULT FETCHING
    // ============================

    public List<QuizAttemptPojo> getAttemptsByStudent(String enrollmentNo); // View past attempts

    public List<QuizSectionScorePojo> getSectionScores(String quizId, String enrollmentNo); // For detailed report

    public boolean hasStudentAttemptedQuiz(String enrollmentNo, String quizId);

}
