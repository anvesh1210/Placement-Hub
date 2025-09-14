/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class PracticePdfPojo {
    private String pdfId;
    private String TopicId;
    private String title;
    private String pdfUrl;
    private String facultyName;
    private Date date;

    public PracticePdfPojo(String pdfId, String TopicId, String title, String pdfUrl, String facultyName, Date date) {
        this.pdfId = pdfId;
        this.TopicId = TopicId;
        this.title = title;
        this.pdfUrl = pdfUrl;
        this.facultyName = facultyName;
        this.date = date;
    }

    public PracticePdfPojo() {
    }
    
    
    
    public String getPdfId() {
        return pdfId;
    }

    public void setPdfId(String pdfId) {
        this.pdfId = pdfId;
    }

    public String getTopicId() {
        return TopicId;
    }

    public void setTopicId(String TopicId) {
        this.TopicId = TopicId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPdfUrl() {
        return pdfUrl;
    }

    public void setPdfUrl(String pdfUrl) {
        this.pdfUrl = pdfUrl;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "PracticePdfPojo{" + "pdfId=" + pdfId + ", TopicId=" + TopicId + ", title=" + title + ", pdfUrl=" + pdfUrl + ", facultyName=" + facultyName + ", date=" + date + '}';
    }

    
}
