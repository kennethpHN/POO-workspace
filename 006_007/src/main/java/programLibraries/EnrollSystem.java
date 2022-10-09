package programLibraries;

import java.util.ArrayList;

public class EnrollSystem {

	private ArrayList<ClassRoomSection> sections;

	/**
	 * @return the sections
	 */
	public ArrayList<ClassRoomSection> getSections() {
		return sections;
	}

	/**
	 * @param sections the sections to set
	 */
	public void setSections(ArrayList<ClassRoomSection> sections) {
		this.sections = sections;
	}
	
	@Override
	public String toString() {
		
		StringBuilder result = new StringBuilder("");
		
		for (ClassRoomSection item: this.sections) {
			Teacher teacher = item.getTeacher();
			
			result.append(String.format("la sección del Docente: %s<br>\n",teacher));
		}
		
		return result.toString();
	}
}