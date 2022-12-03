package programLibraries;

import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;

/**
 * Clase concreta para gestionar el modulo de Payment.
 * @author jose.inestroza@unah.edu.hn
 * @version 0.1.0
 */
public class PaymentManager {
	public static final String PAYMENT_DTO_ATTRIBUTE="serviceCode";
	private String SERVICE_CODE_PARAM;
	
	public PaymentManager() {
		this.SERVICE_CODE_PARAM="serviceCode";
	}
	
	/**
	 * Obtiene el codigo de servicio desde el objeto HttpServletRequest
	 * @param HttpServletRequest request | Peticion http.
	 * @return int | Codigo obtenido desde el parametro de this.SERVICE_CODE_PARAM
	 */
	public int getServiceCode(HttpServletRequest request) {
		//El serviceCode no debe ser nulo y debe ser un digito.
		if(request.getParameter(this.SERVICE_CODE_PARAM)!=null &&
			request.getParameter(this.SERVICE_CODE_PARAM).toString().strip().matches("\\d+")) {
			int serviceCode= Integer.parseInt(request.getParameter(this.SERVICE_CODE_PARAM).toString().strip());
			return serviceCode;
		}
		return -1;	
	}
	
	public String getServiceName(int serviceCode) {
		//Lee el Modelo de Datos
		DAOPaymentManagerServices dao=new DAOPaymentManagerServices("Documentos/CESM U/POO/Folder/PaymentManagerServicesDataBase.csv"); 
		Map<Integer,String> model=dao.getServices();
		String serviceName=String.format("%s", model.get(serviceCode));
		
		return serviceName;
	}
	
	
}
