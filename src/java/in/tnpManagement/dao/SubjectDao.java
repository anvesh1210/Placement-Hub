/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao;

import in.tnpManagement.pojo.SubjectPojo;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface SubjectDao {
    public int getNextSubjectId();
    public String addSubject(SubjectPojo subject);
    public String updateSubject(SubjectPojo subject);
    public String deleteSubject(String subjectId);
    public SubjectPojo getSubjectById(String subjectId);
    public List<SubjectPojo> getAllSubjects();
    public boolean isSubjectExists(String name);
    public List<SubjectPojo> searchSubject(String keyword);
}
