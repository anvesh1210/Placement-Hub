/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

/**
 *
 * @author DELL
 */
public class QuizSectionScorePojo {
    private String enrollmentNo;
    private String quizId;
    private String sectionId;
    private int scoreObtained;

    public QuizSectionScorePojo() {
    }

    public QuizSectionScorePojo(String enrollmentNo, String quizId, String sectionId, int scoreObtained) {
        this.enrollmentNo = enrollmentNo;
        this.quizId = quizId;
        this.sectionId = sectionId;
        this.scoreObtained = scoreObtained;
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

    public String getSectionId() {
        return sectionId;
    }

    public void setSectionId(String sectionId) {
        this.sectionId = sectionId;
    }

    public int getScoreObtained() {
        return scoreObtained;
    }

    public void setScoreObtained(int scoreObtained) {
        this.scoreObtained = scoreObtained;
    }

    
    
}
