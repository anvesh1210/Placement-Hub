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
public class QuizPojo {
    private String quizId;          // e.g., QUI1001
    private String quizTitle;
    private int totalMarks;
    private int totalDuration;      // in minutes
    private Timestamp startTime;
    private Timestamp endTime;
    private String createdBy;       // Faculty email

    
    // Getters and Setters

        public QuizPojo() {
        }

    public QuizPojo(String quizId, String quizTitle, int totalMarks, int totalDuration, Timestamp startTime, Timestamp endTime, String createdBy) {
        this.quizId = quizId;
        this.quizTitle = quizTitle;
        this.totalMarks = totalMarks;
        this.totalDuration = totalDuration;
        this.startTime = startTime;
        this.endTime = endTime;
        this.createdBy = createdBy;
    }

    public String getQuizId() {
        return quizId;
    }

    public void setQuizId(String quizId) {
        this.quizId = quizId;
    }

    public String getQuizTitle() {
        return quizTitle;
    }

    public void setQuizTitle(String quizTitle) {
        this.quizTitle = quizTitle;
    }

    public int getTotalMarks() {
        return totalMarks;
    }

    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }

    public int getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(int totalDuration) {
        this.totalDuration = totalDuration;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "QuizPojo{" + "quizId=" + quizId + ", quizTitle=" + quizTitle + ", totalMarks=" + totalMarks + ", totalDuration=" + totalDuration + ", startTime=" + startTime + ", endTime=" + endTime + ", createdBy=" + createdBy + '}';
    }
        
}
