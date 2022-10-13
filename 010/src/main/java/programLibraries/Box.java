package programLibraries;

public class Box {

	@Override
	public String toString() {
		
		return "<div style='border: solid black 16px; padding: 16px;></div>'";
	}
	
	public String toString(String content) {
			
			return String.format("<div style='border: solid black 16px; padding: 16px;'>%s</div>",content);
	}
}
