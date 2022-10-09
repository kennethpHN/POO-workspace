package programLibraries;

import java.util.ArrayList;
import java.util.Date;

public class ClassRoomSection {
	
	public String sectionCode;
	public Date start;
	public Date end;
	public Teacher teacher;
	private ArrayList<Student> students;
	/**
	 * @return the sectionCode
	 */
	public String getSectionCode() {
		return sectionCode;
	}
	/**
	 * @param sectionCode the sectionCode to set
	 */
	public void setSectionCode(String sectionCode) {
		this.sectionCode = sectionCode;
	}
	/**
	 * @return the start
	 */
	public Date getStart() {
		return start;
	}
	/**
	 * @param start the start to set
	 */
	public void setStart(Date start) {
		this.start = start;
	}
	/**
	 * @return the end
	 */
	public Date getEnd() {
		return end;
	}
	/**
	 * @param end the end to set
	 */
	public void setEnd(Date end) {
		this.end = end;
	}
	/**
	 * @return the teacher
	 */
	public Teacher getTeacher() {
		return teacher;
	}
	/**
	 * @param teacher the teacher to set
	 */
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	/**
	 * @return the students
	 */
	public ArrayList<Student> getStudents() {
		return students;
	}
	/**
	 * @param students the students to set
	 */
	public void setStudents(ArrayList<Student> students) {
		this.students = students;
	}
	
	

}
