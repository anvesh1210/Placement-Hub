/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

import java.util.List;
import java.util.Map;

/**
 *
 * @author DELL
 */
public class QuizResponseDTO {
    private String quizId;
    private String quizTitle;
    private int totalDuration;
    private List<QuizSectionPojo> sections;
    private Map<String, List<QuizQuestionPojo>> questionsBySection;

    public QuizResponseDTO() {
    }

    public QuizResponseDTO(String quizId, String quizTitle, int totalDuration, List<QuizSectionPojo> sections, Map<String, List<QuizQuestionPojo>> questionsBySection) {
        this.quizId = quizId;
        this.quizTitle = quizTitle;
        this.totalDuration = totalDuration;
        this.sections = sections;
        this.questionsBySection = questionsBySection;
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

    public int getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(int totalDuration) {
        this.totalDuration = totalDuration;
    }

    public List<QuizSectionPojo> getSections() {
        return sections;
    }

    public void setSections(List<QuizSectionPojo> sections) {
        this.sections = sections;
    }

    public Map<String, List<QuizQuestionPojo>> getQuestionsBySection() {
        return questionsBySection;
    }

    public void setQuestionsBySection(Map<String, List<QuizQuestionPojo>> questionsBySection) {
        this.questionsBySection = questionsBySection;
    }

    @Override
    public String toString() {
        return "QuizResponseDTO{" + "quizId=" + quizId + ", quizTitle=" + quizTitle + ", totalDuration=" + totalDuration + ", sections=" + sections + ", questionsBySection=" + questionsBySection + '}';
    }
    
}
