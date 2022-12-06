package programLibraries;
/**
 * Crea etiquetas HTML
 * @author kenneth.pineda@unah.hn
 * @date 2022-12-05
 */
public class DivTag extends HTMLTag{
	public DivTag(String content) {
		super("div",content);
	}
	public DivTag(String classAttribute,String content) {
		super("div",classAttribute,content);
	}
}
