package programLibraries;

public class TitleTag extends HTMLTag {
	
	public TitleTag(String number,String content) {
		super("h"+number,content);
	}
	
	public TitleTag(String number,String classAttribute,String content) {
		super("h"+number,classAttribute,content);
	}
}
