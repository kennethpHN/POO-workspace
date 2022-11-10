package programFiles;

import java.util.Enumeration;

import jakarta.servlet.http.HttpServletRequest;
/**
 * Permite entender los formularios dinamicos generados por el FrontEnd
 * @author kenneth.pineda@unah.hn
 * @version 0.1.0
 */

// La mayoria del codigo se tomo de los ejercicios desarollados por el Ing. José Inestroza, y se le acreditan los mismos. Se marcarán las partes desarolladas por mi persona.

public class DynamicForm {
	//Codigo propio
	private String applyParagraphTag(String content) {
		ParagraphTag paragraph = new ParagraphTag (content);
		return paragraph.toString();
	}

	private boolean isHTML(String paramName) {
		if (paramName.trim().equals("HTMLParagraph")) {
			return true;
		}
		return false;
	}
	//Fin codigo propio
	
	public String readForm(HttpServletRequest request) {
		
		//Un constructor de cadenas para construir la respuesta
		StringBuilder result = new StringBuilder();
		
		//request.getParameterNames() -> Contenedor para iterar todos los parametros recibidos
		Enumeration<String> params = request.getParameterNames();
		
		while(params.hasMoreElements()) {
			String paramName = params.nextElement();
			
			//Contenido del nombre del parametro
			String paramContent = request.getParameter(paramName);
			if (this.isHTML(paramName)) {
				result.append(this.applyParagraphTag(paramContent));
			}
		}
		
		return result.toString();
	}
}
