package programLibraries;

import jakarta.servlet.http.HttpServletRequest;

public class BoxGenerator {

	private String createBox(int numberOfBoxes) {
		StringBuilder style = new StringBuilder("style='");
			style.append("border: solid black 16px;");
			style.append("padding: 16px;");
			style.append("position: absolute;");
			style.append("top: 0px;");
			style.append("left: 0px;");
			style.append(String.format("width: %dpx;", numberOfBoxes*50));
			style.append(String.format("height: %dpx;", numberOfBoxes*50));
		style.append("'");
		
		
		if(numberOfBoxes==0) return "";
		return (new DivTag(style.toString(),this.createBox(numberOfBoxes-1))).toString();
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
