/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

import java.util.Map;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class QuizSubmissionDTO {
     private String quizId;
    private String enrollmentNo;
    private Map<String, Map<String, String>> answersBySection;
    // sectionId -> (questionId -> selectedOption)

    public QuizSubmissionDTO() {
    }

    public QuizSubmissionDTO(String quizId, String enrollmentNo, Map<String, Map<String, String>> answersBySection) {
        this.quizId = quizId;
        this.enrollmentNo = enrollmentNo;
        this.answersBySection = answersBySection;
    }

    public String getQuizId() {
        return quizId;
    }

    public void setQuizId(String quizId) {
        this.quizId = quizId;
    }

    public String getEnrollmentNo() {
        return enrollmentNo;
    }

    public void setEnrollmentNo(String enrollmentNo) {
        this.enrollmentNo = enrollmentNo;
    }

    public Map<String, Map<String, String>> getAnswersBySection() {
        return answersBySection;
    }

    public void setAnswersBySection(Map<String, Map<String, String>> answersBySection) {
        this.answersBySection = answersBySection;
    }

    @Override
    public String toString() {
        return "QuizSubmissionDTO{" + "quizId=" + quizId + ", enrollmentNo=" + enrollmentNo + ", answersBySection=" + answersBySection + '}';
    }
    
    
}
