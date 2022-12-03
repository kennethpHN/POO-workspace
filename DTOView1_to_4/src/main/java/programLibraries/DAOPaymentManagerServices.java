package programLibraries;

import java.util.HashMap;
import java.util.Map;

/**
 * Clase concreta para la gestion de acceso a datos.
 * @author jose.inestroza@unah.edu.hn
 * @version 0.1.0
 */
public class DAOPaymentManagerServices {
	private String csvModelFileName;
	
	/**
	 * Constructor de la clase.
	 * @param String csvModelFIleName | Nombre del archivo fisico que corresponde con el modelo de datos.
	 */
	public DAOPaymentManagerServices(String csvModelFileName) {
		this.csvModelFileName=csvModelFileName;
	}
	
	/**
	 * Obtiene a todos los servicios de acuerdo con el archivo resoectivo this.csvModelFileName 
	 * @return Map<Integer,String> | Estructura de datos con el ID y el Nombre de cada servicio.
	 */
	public Map<Integer,String> getServices(){
		Map<Integer,String> model=new HashMap<>();
		FileManager fm=new FileManager();
		FileManagerResponse fmr=fm.read(csvModelFileName);
		
		if(fmr.isStatus()) {
			String textContent=fmr.getContent();
			String textLines[]=textContent.split("\\n+");
			
			for (String row : textLines) {
				String columns[]=row.split(",");
				model.put(Integer.parseInt(columns[0]), columns[1]);
			}
		}
		
		return model;
	}

}
