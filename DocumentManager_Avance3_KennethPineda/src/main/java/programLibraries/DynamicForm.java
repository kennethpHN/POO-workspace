package programLibraries;

import java.util.Enumeration;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Permite entender los formularios dinamicos generados por el FrontEnd
 * 
 * @author jose.inestroza@unah.edu.hn
 * @author kenneth.pineda@unah.hn
 * @version 0.1.5
 * @date 2022/12/05
 */

public class DynamicForm {
	private boolean isEmail(String paramName) {
		if (paramName.trim().equals("emailInput")) {
			return true;
		}
		return false;
	}

	private boolean isInfo(String paramName) {
		if (paramName.trim().equals("informationInput")) {
			return true;
		}
		return false;
	}

	private boolean isDocCode(String paramName) {
		if (paramName.trim().equals("documentCode")) {
			return true;
		}
		return false;
	}

	private boolean isListCode(String paramName) {
		if (paramName.trim().equals("documentListCode")) {
			return true;
		}
		return false;
	}

	private String forList(String content) {
		ListTag listTag = new ListTag(content);
		return listTag.toString();
	}

	private String forTitleH5(String content) {
		TitleTag title = new TitleTag("5", "modal-title", content);
		return title.toString();
	}

	private String forTitleH4(String content) {
		TitleTag title = new TitleTag("4", content);
		return title.toString();
	}

	private String forRow(String content) {
		DivRowTag divRowTag = new DivRowTag(content);
		return divRowTag.toString();
	}

	private String forCol(String content) {
		DivColTag divColTag = new DivColTag(content);
		return divColTag.toString();
	}

	private String forParagraph(String content) {
		ParagraphTag paragraph = new ParagraphTag(content);
		return paragraph.toString();
	}

	private String forButton(String text) {
		ButtonTag button = new ButtonTag(text);
		return button.toString();
	}

	private String forDiv(String classAttribute, String content) {
		DivTag div = new DivTag(classAttribute, content);
		return div.toString();
	}

	public String readForm(HttpServletRequest request) {

		// Funcionalidades del DAO

		Validator validator = new Validator();

		if (request.getParameter("emailInput") != null
				&& validator.isEmail(request.getParameter("emailInput").toString())
				&& request.getParameter("informationInput") != null) {
			String email = request.getParameter("emailInput");
			String informationInput = validator
					.removeSpecialCharacters(validator.removeHTML(request.getParameter("informationInput")));
			String documentCode = validator
					.removeSpecialCharacters(validator.removeHTML(request.getParameter("documentCode")));
			String documentListCode = validator
					.removeSpecialCharacters(validator.removeHTML(request.getParameter("documentListCode")));

			DAOCSV daoCSV = new DAOCSV();
			DAOCSVResponse daoCSVResponse = daoCSV.createModel(documentListCode, email, documentCode, informationInput);

		}

		// -----------------------

		// Un constructor de cadenas para construir la respuesta
		StringBuilder result = new StringBuilder();
		StringBuilder listBuilder = new StringBuilder();
		StringBuilder titleBuilder = new StringBuilder();
		StringBuilder titleNumberBuilder = new StringBuilder();
		StringBuilder rowBuilder = new StringBuilder();
		StringBuilder buttonBuilder = new StringBuilder();
		// request.getParameterNames() -> Contenedor para iterar todos los parametros
		// recibidos
		Enumeration<String> params = request.getParameterNames();

		while (params.hasMoreElements()) {
			String paramName = params.nextElement();
			String paramContent = request.getParameter(paramName);
			if (this.isListCode(paramName)) {
				titleNumberBuilder.append(String.format("%s. Documento - ", paramContent));
				buttonBuilder.append(String.format(
						"<div class='col' id='documentCodeDescriptor' data-name='documentListCode' data-code='%s'><button class='btn clmodal-btn' id='infoModalWindow'>Ver Descripción</button></div>",
						paramContent));
			}
			if (this.isDocCode(paramName)) {
				// titleBuilder.append(this.forTitle("Documento - Revista"));
				switch (Integer.parseInt(paramContent)) {
				case 1:
					titleBuilder.append("Revista");
					break;
				case 2:
					titleBuilder.append("Libro");
					break;
				case 3:
					titleBuilder.append("Texto");
					break;
				case 4:
					titleBuilder.append("Imagen");
					break;

				default:
					break;
				}

			} else if (this.isEmail(paramName)) {
				rowBuilder.append(this.forCol(this.forParagraph("Responsable: ")));
				rowBuilder.append(this.forCol(this.forParagraph(paramContent)));
				/*
				 * rowBuilder.append(String.format(
				 * "<div class='col' id='documentCodeDescriptor' data-name='documentListCode' data-code='%s'><button class='btn clmodal-btn' id='infoModalWindow'>Ver Descripción</button></div>"
				 * , paramContent));
				 */
			}

		}

		if (titleBuilder.toString().length() > 0 && rowBuilder.toString().length() > 0) {
			rowBuilder.append(buttonBuilder.toString());
			titleNumberBuilder.append(titleBuilder.toString());
			listBuilder.append(this.forTitleH4(titleNumberBuilder.toString()));
			listBuilder.append(this.forRow(rowBuilder.toString()));
			// result.append(this.forList(listBuilder.toString()));
			result.append(listBuilder.toString());

		}

		return result.toString();
	}

	/**
	 * Construye un modal que visualiza la descripción del documento
	 * @author kenneth.pineda@unah.hn
	 * @version 0.1.2
	 * @date 2022/12/06
	 * @param request
	 * @return contenido html del modal
	 */
	public String buildModal(HttpServletRequest request) {

		DAOCSV daoCSV = new DAOCSV();

		String test = daoCSV.getDocument(Integer.parseInt(request.getParameter("documentListCode")));
		String[] elements = test.split("&");
		// System.out.println(elements[0]+" "+elements[1]+" "+elements[2]);
		String documentListCode = elements[0];
		String email = elements[1];
		String documentCode = elements[2];
		String information = elements[3];
		System.out
				.println(String.format("En DynamicForm: %s%s%s%s", documentListCode, email, documentCode, information));
		StringBuilder infoParagraphBuilder = new StringBuilder();
		StringBuilder buttonBuilder = new StringBuilder();
		StringBuilder titleBuilder = new StringBuilder();
		StringBuilder modalHeaderBuilder = new StringBuilder();
		StringBuilder modalContentBuilder = new StringBuilder();
		StringBuilder result = new StringBuilder();

		infoParagraphBuilder.append(this.forDiv("modal-body", this.forParagraph(information)));
		buttonBuilder.append(this.forDiv("modal-footer",
				"<button type='button' class='btn clmodal-btn' data-bs-dismiss='modal'>Cerrar</button>"));
		// System.out.println(Integer.parseInt(documentCode));
		switch (Integer.parseInt(documentCode)) {
		case 1:
			titleBuilder.append(this.forTitleH5(
					String.format("Entrada de documento de tipo Revista #%s: %s", documentListCode, email)));
			break;
		case 2:
			titleBuilder.append(this
					.forTitleH5(String.format("Entrada de documento de tipo Libro #%s: %s", documentListCode, email)));
			break;
		case 3:
			titleBuilder.append(this
					.forTitleH5(String.format("Entrada de documento de tipo Texto #%s: %s", documentListCode, email)));
			break;
		case 4:
			titleBuilder.append(this
					.forTitleH5(String.format("Entrada de documento de tipo Imagen #%s: %s", documentListCode, email)));
			break;

		default:
			break;
		}

		modalHeaderBuilder.append(titleBuilder.toString());
		modalHeaderBuilder
				.append("<button type='button'class='btn-close'data-bs-dismiss='modal'aria-label='Close'></button>");

		if (titleBuilder.toString().length() > 0 && infoParagraphBuilder.toString().length() > 0) {
			modalContentBuilder.append(modalHeaderBuilder.toString());
			modalContentBuilder.append(infoParagraphBuilder.toString());
			modalContentBuilder.append(buttonBuilder.toString());

			result.append(modalContentBuilder.toString());
		}

		return result.toString();
	}

	/**
	 * Limpia el modelo de datos 
	 * @author kenneth.pineda@unah.hn
	 * @version 0.1.0
	 * @date 2022/12/06
	 * @param request
	 * @return json con status true, si se ejecutó correctamente
	 */
	public String cleanDataModel(HttpServletRequest request) {
		DAOCSV daoCSV = new DAOCSV();
		if(request.getParameter("clearModel").matches("clearModel")) {
			DAOCSVResponse status = daoCSV.deleteModel();
			return String.format("%s", status.isStatus());
		}
		
		return "";
	}
}
