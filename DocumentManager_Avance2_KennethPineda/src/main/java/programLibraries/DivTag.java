package programLibraries;

public class DivTag extends HTMLTag{
	public DivTag(String content) {
		super("div",content);
	}
	public DivTag(String classAttribute,String content) {
		super("div",classAttribute,content);
	}
}
