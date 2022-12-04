package programLibraries;

/**
 * Representacion Generica de una etiqueta de HTML.
 * @author jose.inestroza@unah.edu.hn
 * @author kenneth.pineda@unah.hn
 * @version 0.1.3
 *@date 2022/12/04
 */

public class HTMLTag{
	private String name;
	private String content;
	private String classAttribute;
	private String style;
	public HTMLTag(String name) {
		this.name = name;
		this.classAttribute = "";
		this.content = "";
		this.style = "";
	}
	
	public HTMLTag(String name, String content) {
	this.name = name;
	this.content = content;
	this.classAttribute = "";
	this.style = "";
	}
	
	public HTMLTag(String name,String classAttribute, String content) {
	this.name = name;
	this.classAttribute = classAttribute;
	this.content = content;
	this.style = "";
	}
	
	public HTMLTag(String name, String classAttribute, String content, String style) {
	this.name = name;
	this.classAttribute = classAttribute;
	this.content = content;
	this.style = style;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @return the style
	 */
	public String getStyle() {
		return style;
	}

	/**
	 * @param style the style to set
	 */
	public void setStyle(String style) {
		this.style = style;
	}
	
	public String getClassAttribute() {
		return classAttribute;
	}

	public void setClassAttribute(String classAttribute) {
		this.classAttribute = classAttribute;
	}

	/**
	 * Sobreescribe el metodo Object.toSring, para imprimir
	 * la version texto de toda etiqueta HTML
	 * @author jose.inestroza@unah.edu.hn
	 * @author kenneth.pineda@unah.hn
	 * @version 0.1.3
	 * @date 2022/12/04
	 * @return La version HTML del objeto, como una cadena de texto
	 */
	public String toString() {
		String style = this.style.trim().length() > 0 ? String.format(" style='%s'", this.style) : "";
		String classAttribute = this.classAttribute.trim().length() > 0 ? String.format(" class='%s'", this.classAttribute) : "";
		return String.format("<%s%s%s>%s</%s>", this.name,classAttribute, style, this.content, this.name);
	}
}
