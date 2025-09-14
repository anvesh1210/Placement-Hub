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
public class QuizSectionPojo {
    private String sectionId;       // e.g., SEC1001
    private String quizId;
    private String subjectId;
    private String sectionTitle;
    private int marksPerQuestion;
    private int totalQuestions;

    public QuizSectionPojo() {
    }

    public QuizSectionPojo(String sectionId, String quizId, String subjectId, String sectionTitle, int marksPerQuestion, int totalQuestions) {
        this.sectionId = sectionId;
        this.quizId = quizId;
        this.subjectId = subjectId;
        this.sectionTitle = sectionTitle;
        this.marksPerQuestion = marksPerQuestion;
        this.totalQuestions = totalQuestions;
    }

    public String getSectionId() {
        return sectionId;
    }

    public void setSectionId(String sectionId) {
        this.sectionId = sectionId;
    }

    public String getQuizId() {
        return quizId;
    }

    public void setQuizId(String quizId) {
        this.quizId = quizId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getSectionTitle() {
        return sectionTitle;
    }

    public void setSectionTitle(String sectionTitle) {
        this.sectionTitle = sectionTitle;
    }

    public int getMarksPerQuestion() {
        return marksPerQuestion;
    }

    public void setMarksPerQuestion(int marksPerQuestion) {
        this.marksPerQuestion = marksPerQuestion;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }

    @Override
    public String toString() {
        return "QuizSectionsPojo{" + "sectionId=" + sectionId + ", quizId=" + quizId + ", subjectId=" + subjectId + ", sectionTitle=" + sectionTitle + ", marksPerQuestion=" + marksPerQuestion + ", totalQuestions=" + totalQuestions + '}';
    }
    
}
