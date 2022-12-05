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
	
	/**
	 * Esto es un metodo de ejemplo para demostrar codigo de terceros, sobre el
	 * original del docente o de los autores de los libros de la clase.
	 * @author nombre.apellido@unah.hn
	 * @since 2022-11-16
	 * @date 2022-11-18
	 * @version 0.1.15
	 */
	public void exampleMethod() {
		
	} 
	
	public String toString() {
		return String.format("%s,%s|%s|%s",
				this.number,this.email,this.documentCode,this.information);
	}
}
