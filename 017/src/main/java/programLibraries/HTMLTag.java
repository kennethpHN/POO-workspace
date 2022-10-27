package programLibraries;

public class HTMLTag {

	private String name;
	private String style;
	private String content;
	 
	 public HTMLTag(String name) {
		 this.name = name;
		 this.style = "";
		 this.content = "";
	 }
	 
	 public HTMLTag(String name, String style) {
		 this.name = name;
		 this.style = style;
		 this.content = "";
	 }
	 
	 public HTMLTag(String name, String style, String content) {
		 this.name = name;
		 this.style = style;
		 this.content = content;
	 }
	 
	 @Override
	 public String toString() {
		 return String.format("<%s %s>%s</%s>", this.name, this.style, this.content, this.name);
	 }
}
