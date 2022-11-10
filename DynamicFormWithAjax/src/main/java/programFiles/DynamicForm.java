package programFiles;

import java.util.Enumeration;

import jakarta.servlet.http.HttpServletRequest;
/**
 * Permite entender los formularios dinamicos generados por el FrontEnd
 * @author jose.inestroza@unah.edu.hn
 * @version 0.1.2
 *@date 2022/02/18
 */

public class DynamicForm {
	private boolean isTitle(String paramName) {
		if (paramName.trim().split("_")[0].equals("title")) {
			return true;
		}
		return false;
	}
	
	private boolean isParagraph(String paramName){
		if(paramName.trim().split("_")[0].equals("paragraph")) {
			return true;
		}
		return false;
	}
	
	private String forTitle(String content){
		TitleTag title = new TitleTag(content);
		return title.toString();
	}
	private String forParagraph(String content) {
		ParagraphTag paragraph = new ParagraphTag (content);
		return paragraph.toString();
	}
	
	public String readForm(HttpServletRequest request) {
		
		//Un constructor de cadenas para construir la respuesta
		StringBuilder result = new StringBuilder();
		
		//request.getParameterNames() -> Contenedor para iterar todos los parametros recibidos
		Enumeration<String> params = request.getParameterNames();
		
		while(params.hasMoreElements()) {
			//title_###, paragraph_###
			String paramName = params.nextElement();
			
			//Contenido del nombre del parametro
			String paramContent = request.getParameter(paramName);
			
			if (this.isTitle(paramName)) {
				result.append(this.forTitle(paramContent));
			} else if(this.isParagraph(paramName)) {
				result.append(this.forParagraph(paramContent));
			}//Para cualquier otro caso, se ignora ese parametro
		}
		
		return result.toString();
	}
}
