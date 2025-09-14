/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

import java.sql.Timestamp;

/**
 *
 * @author DELL
 */
public class QuizAttemptPojo {
    private String enrollmentNo;
    private String quizId;
    private Timestamp startedAt;
    private Timestamp submittedAt;

    public QuizAttemptPojo() {
    }

    public QuizAttemptPojo(String enrollmentNo, String quizId, Timestamp startedAt, Timestamp submittedAt) {
        this.enrollmentNo = enrollmentNo;
        this.quizId = quizId;
        this.startedAt = startedAt;
        this.submittedAt = submittedAt;
    }

    public String getEnrollmentNo() {
        return enrollmentNo;
    }

    public void setEnrollmentNo(String enrollmentNo) {
        this.enrollmentNo = enrollmentNo;
    }

    public String getQuizId() {
        return quizId;
    }

    public void setQuizId(String quizId) {
        this.quizId = quizId;
    }

    public Timestamp getStartedAt() {
        return startedAt;
    }

    public void setStartedAt(Timestamp startedAt) {
        this.startedAt = startedAt;
    }

    public Timestamp getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(Timestamp submittedAt) {
        this.submittedAt = submittedAt;
    }

    @Override
    public String toString() {
        return "QuizAttempPojo{" + "enrollmentNo=" + enrollmentNo + ", quizId=" + quizId + ", startedAt=" + startedAt + ", submittedAt=" + submittedAt + '}';
    }
    
    
}
