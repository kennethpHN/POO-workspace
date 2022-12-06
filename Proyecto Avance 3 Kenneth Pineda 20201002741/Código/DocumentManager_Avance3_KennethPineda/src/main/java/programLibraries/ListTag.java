package programLibraries;
/**
 * Crea etiquetas HTML
 * @author kenneth.pineda@unah.hn
 * @date 2022-12-05
 */
public class ListTag extends HTMLTag{
	public ListTag(String content) {
		super("li","list-document-item list-group-item",content);
	}
}
