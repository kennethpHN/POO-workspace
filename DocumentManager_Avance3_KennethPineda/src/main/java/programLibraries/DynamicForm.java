package programLibraries;

import java.util.Enumeration;

import org.apache.jasper.tagplugins.jstl.core.Out;

import jakarta.servlet.http.HttpServletRequest;
/**
 * Permite entender los formularios dinamicos generados por el FrontEnd
 * @author jose.inestroza@unah.edu.hn
 * @author kenneth.pineda@unah.hn
 * @version 0.1.3
 * @date 2022/12/04
 */

public class DynamicForm {
	private boolean isEmail(String paramName) {
		if (paramName.trim().equals("emailInput")) {
			return true;
		}
		return false;
	}
	
	private boolean isInfo(String paramName){
		if(paramName.trim().equals("informationInput")) {
			return true;
		}
		return false;
	}
	
	private boolean isDocCode(String paramName){
		if(paramName.trim().equals("documentCode")) {
			return true;
		}
		return false;
	}
	
	
	private String forList(String content) {
		ListTag listTag = new ListTag(content);
		return listTag.toString();
	}
	
	private String forTitle(String content){
		TitleTag title = new TitleTag(content);
		return title.toString();
	}
	
	private String forRow(String content){
		DivRowTag divRowTag = new DivRowTag(content);
		return divRowTag.toString();
	}
	
	private String forCol(String content){
		DivColTag divColTag = new DivColTag(content);
		return divColTag.toString();
	}
	
	private String forParagraph(String content) {
		ParagraphTag paragraph = new ParagraphTag (content);
		return paragraph.toString();
	}
	
	private String forButton() {
		ButtonTag button = new ButtonTag();
		return button.toString();
	}
	
	public String readForm(HttpServletRequest request) {
		
		//Funcionalidades del DAO
		
		Validator validator=new Validator();
		
		if(request.getParameter("emailInput")!=null && validator.isEmail(request.getParameter("emailInput").toString())
				&& request.getParameter("informationInput")!=null){
			String email=request.getParameter("emailInput");
			String informationInput=validator.removeSpecialCharacters(validator.removeHTML(request.getParameter("informationInput")));
			String documentCode = validator.removeSpecialCharacters(validator.removeHTML(request.getParameter("documentCode")));
			
			
			DAOCSV daoCSV = new DAOCSV();
			DAOCSVResponse daoCSVResponse = daoCSV.createModel("1",email,documentCode,informationInput);
			//return daoCSVResponse.getContent();
			
		}
		
		//-----------------------
		
		
		//Un constructor de cadenas para construir la respuesta
		StringBuilder result = new StringBuilder();
		StringBuilder listBuilder = new StringBuilder();
		StringBuilder titleBuilder = new StringBuilder();
		StringBuilder rowBuilder = new StringBuilder();
		//request.getParameterNames() -> Contenedor para iterar todos los parametros recibidos
		Enumeration<String> params = request.getParameterNames();
		
		
		while(params.hasMoreElements()) {
			String paramName = params.nextElement();
			String paramContent = request.getParameter(paramName);
			if(this.isDocCode(paramName)) {
				//titleBuilder.append(this.forTitle("Documento - Revista"));
				switch (Integer.parseInt(paramContent)) {
				case 1:
					titleBuilder.append(this.forTitle(". Documento - Revista"));
					break;
				case 2:
					titleBuilder.append(this.forTitle(". Documento - Libro"));
					break;
				case 3:
					titleBuilder.append(this.forTitle(". Documento - Texto"));
					break;
				case 4:
					titleBuilder.append(this.forTitle(". Documento - Imagen"));
					break;

				default:
					break;
				}
			}else if(this.isEmail(paramName)) {
				rowBuilder.append(this.forCol(this.forParagraph("Responsable: ")));
				rowBuilder.append(this.forCol(this.forParagraph(paramContent)));
				rowBuilder.append(this.forCol(this.forButton()));
			}
			
		}
		
		if(titleBuilder.toString().length() > 0 && rowBuilder.toString().length() > 0) {
			listBuilder.append(titleBuilder.toString());
			listBuilder.append(this.forRow(rowBuilder.toString()));
			result.append(this.forList(listBuilder.toString()));
			
		}
		
		
		/*while(params.hasMoreElements()) {
			//title_###, paragraph_###
			String paramName = params.nextElement();
			
			//Contenido del nombre del parametro
			String paramContent = request.getParameter(paramName);
			if (this.isEmail(paramName)) {
				result.append(this.forEmail(paramContent));
			} else if(this.isParagraph(paramName)) {
				result.append(this.forParagraph(paramContent));
			}//Para cualquier otro caso, se ignora ese parametro
		}*/
		
		return result.toString();
	}
}
