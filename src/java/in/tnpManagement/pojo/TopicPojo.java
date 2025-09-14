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
public class TopicPojo {
    private String topicId;
    private String subjectId;
    private String topicName;

    public TopicPojo() {
    }

    public TopicPojo(String topicId, String subjectId, String topicName) {
        this.topicId = topicId;
        this.subjectId = subjectId;
        this.topicName = topicName;
    }

    public String getTopicId() {
        return topicId;
    }

    public void setTopicId(String topicId) {
        this.topicId = topicId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    @Override
    public String toString() {
        return "TopicPojo{" + "topicId=" + topicId + ", subjectId=" + subjectId + ", topicName=" + topicName + '}';
    }

    
}
