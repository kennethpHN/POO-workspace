package programLibraries;

/**
 * Objeto que permite construir el modelo de datos de CSV para guardarlo en disco.
 * @author jose.inestroza@unah.edu.hn
 * @since 2022-11-17
 * @date 2022-11-18
 * @version 1.0.0 *
 */
public class CSV {
	public String number;
	public String email;
	public String documentCode;
	public String information;
	
	public CSV(String number,String email,String documentCode,String information) {
		this.number = number;
		this.email = email;
		this.documentCode = documentCode;
		this.information = information;
	}
	
	public String toString() {
		return String.format("%s,%s|%s|%s",
				this.number,this.email,this.documentCode,this.information);
	}
}
