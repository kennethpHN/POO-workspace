package programLibraries;

import jakarta.servlet.http.HttpSession;

/**
 * Objeto que permite el conteo de visitas mediante el objeto de session.
 * @author jose.inestroza@unah.edu,hn
 * @version 0.1.0
 *
 */
public class VisitManager {
	private String SESSION_NAME_COUNT;
	
	public VisitManager() {
		this.SESSION_NAME_COUNT="counter";
	}
	
	/**
	 * Obtiene la cantidad registrada en contador de la session.
	 * @param session:HttpSession | La sesion activa del usuario.
	 * @return int | La cantidad registrada en el contador de la sesion.
	 */
	public int getCount(HttpSession session) {
		//Caso cuando la sesion no contiene un contador (si el contador es nulo o no es un entero)
		if(session.getAttribute(this.SESSION_NAME_COUNT)==null ||
			!session.getAttribute(this.SESSION_NAME_COUNT).getClass().getSimpleName().equals("Integer")) {
			return 0;
		}
		//Si la sesion ya tiene un contador, solo se retorna su valor
		return (int) session.getAttribute(this.SESSION_NAME_COUNT);
	}
	
	/**
	 * Permite incrementar en uno, el valor del contador que se encuentra adentro de una session.
	 * @param session:HttpSession | La sesion activa del usuario.
	 * @return HttpSession | La sesion actualizada con el valor incrementado en 1.
	 */
	public HttpSession setCount(HttpSession session) {
		int count;
		//Caso cuando la sesion no contiene un contador (si el contador es nulo o no es un entero)
		if(session.getAttribute(this.SESSION_NAME_COUNT)==null ||
			!session.getAttribute(this.SESSION_NAME_COUNT).getClass().getSimpleName().equals("Integer")) {
			count=1;
		}
		//Caso cuando la sesion si contiene un contador.
		else {
			count=(int) session.getAttribute(this.SESSION_NAME_COUNT);	//se lee el valor actual del contador
			count++;	//se incrementa el contador
		}
		
		session.setAttribute(this.SESSION_NAME_COUNT, count);	//se guarda el valor en la sesion
		return session;
	}
	
}
