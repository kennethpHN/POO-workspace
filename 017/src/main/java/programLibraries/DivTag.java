package programLibraries;

public class DivTag extends HTMLTag{

	public DivTag() {
		super("div");
	}

	public DivTag(String style) {
		super("div",style);
	}
	
	public DivTag(String style, String content) {
		super("div",style, content);
	}
}
