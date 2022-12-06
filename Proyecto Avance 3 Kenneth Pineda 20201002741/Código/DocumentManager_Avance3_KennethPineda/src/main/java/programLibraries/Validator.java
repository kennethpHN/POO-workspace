package programLibraries;

public class Validator {
	public boolean isEmail(String text) {
		if(text.trim().matches("[\\w.]+@[\\w]+(\\.[a-zA-Z]{2,})+")) {
			return true;
		}
		return false;
	}
	
	public String removeHTML(String text) {
		return text.trim().replaceAll("<[^>]+>", "");
	}
	
	public String removeSpecialCharacters(String text) {
		return text.trim().replaceAll("[^\\w \\t.,-:áéíóúüñÁÉÍÓÚÜñÑ]+", "");
	}
}
