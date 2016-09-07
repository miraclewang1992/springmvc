package com.lesson.jlau.bean;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable{
    private String stuId;

    private String stuName;

    private String stuMajor;

    private String stuPassword;

    private Date stuCreateTime;

    private Short stuClass;

    private Date stuEnterYear;

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getStuMajor() {
        return stuMajor;
    }

    public void setStuMajor(String stuMajor) {
        this.stuMajor = stuMajor == null ? null : stuMajor.trim();
    }

    public String getStuPassword() {
        return stuPassword;
    }

    public void setStuPassword(String stuPassword) {
        this.stuPassword = stuPassword == null ? null : stuPassword.trim();
    }

    public Date getStuCreateTime() {
        return stuCreateTime;
    }

    public void setStuCreateTime(Date stuCreateTime) {
        this.stuCreateTime = stuCreateTime;
    }

    public Short getStuClass() {
        return stuClass;
    }

    public void setStuClass(Short stuClass) {
        this.stuClass = stuClass;
    }

    public Date getStuEnterYear() {
        return stuEnterYear;
    }

    public void setStuEnterYear(Date stuEnterYear) {
        this.stuEnterYear = stuEnterYear;
    }
    public Student(){
    	
    }
	public Student(String stuId, String stuName, String stuMajor, String stuPassword, Date stuCreateTime,
			Short stuClass, Date stuEnterYear) {
		super();
		this.stuId = stuId;
		this.stuName = stuName;
		this.stuMajor = stuMajor;
		this.stuPassword = stuPassword;
		this.stuCreateTime = stuCreateTime;
		this.stuClass = stuClass;
		this.stuEnterYear = stuEnterYear;
	}

	@Override
	public String toString() {
		return "Student [stuId=" + stuId + ", stuName=" + stuName + ", stuMajor=" + stuMajor + ", stuPassword="
				+ stuPassword + ", stuCreateTime=" + stuCreateTime + ", stuClass=" + stuClass + ", stuEnterYear="
				+ stuEnterYear + "]";
	}
}