package programLibraries;

import jakarta.servlet.http.HttpServletRequest;

public class BoxGenerator {

	private String createBox(int numberOfBoxes) {
		
		if(numberOfBoxes==0) return "";
		return (new DivTag("style='border: solid black 16px; padding: 16px;'",this.createBox(numberOfBoxes-1))).toString();
		//return (new Box()).toString(this.createBox(numberOfBoxes-1));
	}
	
	public String createBoxes(HttpServletRequest request) {
		int numberOfBoxes = 0;
		StringBuilder result = new StringBuilder();
		
		if (request.getParameter("numberOfBoxes") != null) {
			numberOfBoxes = Integer.parseInt(request.getParameter("numberOfBoxes").toString());
		}
		
		result.append(this.createBox(numberOfBoxes));
		
		return result.toString();
	}
}
