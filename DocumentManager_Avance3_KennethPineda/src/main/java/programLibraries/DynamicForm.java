package programLibraries;
import java.util.Enumeration;
import jakarta.servlet.http.HttpServletRequest;
/**
 * Permite entender los formularios dinamicos generados por el FrontEnd
 * @author jose.inestroza@unah.edu.hn
 * @author kenneth.pineda@unah.hn
 * @version 0.1.4
 * @date 2022/12/05
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
	
	private String forTitleH5(String content){
		TitleTag title = new TitleTag("5","modal-title",content);
		return title.toString();
	}
	
	private String forTitleH4(String content){
		TitleTag title = new TitleTag("4",content);
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
	
	private String forButton(String text) {
		ButtonTag button = new ButtonTag(text);
		return button.toString();
	}
	
	private String forDiv(String classAttribute, String content) {
		DivTag div = new DivTag(classAttribute,content);
		return div.toString();
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
					titleBuilder.append(this.forTitleH4(". Documento - Revista"));
					break;
				case 2:
					titleBuilder.append(this.forTitleH4(". Documento - Libro"));
					break;
				case 3:
					titleBuilder.append(this.forTitleH4(". Documento - Texto"));
					break;
				case 4:
					titleBuilder.append(this.forTitleH4(". Documento - Imagen"));
					break;

				default:
					break;
				}
			}else if(this.isEmail(paramName)) {
				rowBuilder.append(this.forCol(this.forParagraph("Responsable: ")));
				rowBuilder.append(this.forCol(this.forParagraph(paramContent)));
				rowBuilder.append(this.forCol(this.forButton("Ver Descripción")));
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

	/**
	 * Construye un modal que visualiza la descripción del documento
	 * @param request
	 * @return contenido html del modal
	 */
	public String buildModal(HttpServletRequest request) {
		
		DAOCSV daoCSV = new DAOCSV();
		
		String test = daoCSV.getDocument(Integer.parseInt(request.getParameter("documentCode")));
		String [] elements = test.split("&");
		
		String email = elements[0];
		String documentCode = elements[1];
		String information =  elements[2];
		System.out.println("en Dynamicform: "+email+"   "+documentCode+"  "+information);
		StringBuilder infoParagraphBuilder = new StringBuilder();
		StringBuilder buttonBuilder = new StringBuilder();
		StringBuilder titleBuilder = new StringBuilder();
		StringBuilder modalHeaderBuilder = new StringBuilder();
		StringBuilder modalContentBuilder = new StringBuilder();
		StringBuilder result  = new StringBuilder();
		
		infoParagraphBuilder.append(this.forDiv("modal-body",this.forParagraph(information)));
		buttonBuilder.append(this.forDiv("modal-footer", this.forButton("Cerrar")));
		//System.out.println(Integer.parseInt(documentCode));
		switch (Integer.parseInt(documentCode)) {
		case 1:
			titleBuilder.append(this.forTitleH5("Entrada de documento de tipo Revista #1: "+email));
			break;
		case 2:
			titleBuilder.append(this.forTitleH5("Entrada de documento de tipo Libro #1: "+email));
			break;
		case 3:
			titleBuilder.append(this.forTitleH5("Entrada de documento de tipo Texto #1: "+email));
			break;
		case 4:
			titleBuilder.append(this.forTitleH5("Entrada de documento de tipo Imagen #1: "+email));
			break;

		default:
			break;
		}
		
		modalHeaderBuilder.append(titleBuilder.toString());
		modalHeaderBuilder.append("<button type='button'class='btn-close'data-bs-dismiss='modal'aria-label='Close'></button>");
		
		
		if(titleBuilder.toString().length() > 0 && infoParagraphBuilder.toString().length() > 0) {
			modalContentBuilder.append(modalHeaderBuilder.toString());
			modalContentBuilder.append(infoParagraphBuilder.toString());
			modalContentBuilder.append(buttonBuilder.toString());
			
			result.append(modalContentBuilder.toString());
		}
		
		
		
		
		return result.toString();
	}
}
