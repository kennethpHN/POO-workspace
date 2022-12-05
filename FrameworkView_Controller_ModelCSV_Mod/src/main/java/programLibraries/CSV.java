package programLibraries;

/**
 * Objeto que permite construir el modelo de datos de CSV para guardarlo en disco.
 * @author jose.inestroza@unah.edu.hn
 * @since 2022-11-17
 * @date 2022-11-18
 * @version 1.0.0 *
 */
public class CSV {
	public String email;
	public String description;
	
	public CSV(String email,String description) {
		this.email=email;
		this.description=description;
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
		return String.format("Email,Description\n%s,%s",
				this.email,this.description);
	}
}
