package programLibraries;

import java.util.HashMap;
import java.util.Map;
/**
 * 
 * @author kenneth.pineda@unah.hn
 * @date 2022-12-05
 */
public class DAOCSV {
	
	public DAOCSVResponse createModel (String number,String email,String documentCode,String information) {
		
		DAOCSVResponse response = new DAOCSVResponse();
		CSV csvObject = new CSV(number,email,documentCode,information);
		String content = csvObject.toString();
		
		FileManager fm = new FileManager();
		String path = fm.path();
		FileManagerResponse createResponse = fm.create("eclipse/Folder/temporalFile.csv", content);
		FileManagerResponse readResponse = fm.read("eclipse/Folder/temporalFile.csv");
		
		response.setStatus(createResponse.isStatus() && readResponse.isStatus());
		response.setContent(readResponse.getContent());
		response.setPath(path);
		return response;
		
	}
	
	DAOCSVResponse deleteModel() {
		DAOCSVResponse response = new DAOCSVResponse();
		FileManager fm = new FileManager();
		FileManagerResponse cleanResponse = fm.cleanFile("eclipse/Folder/temporalFile.csv");
		
		response.setStatus(cleanResponse.isStatus());
		
		return response;
	}
	
	private Map<Integer,String> getDocumentList(){
		Map<Integer,String> documentList = new HashMap<>();
		FileManager fm=new FileManager();
		FileManagerResponse fmr=fm.read("eclipse/Folder/temporalFile.csv");
		
		if(fmr.isStatus()) {
			String textContent=fmr.getContent();
			String documentRows[]=textContent.split("\\n+");
			for (String row : documentRows) {
				String columns[]=row.split(",");
				documentList.put(Integer.parseInt(columns[0]), columns[1]);
				System.out.println(String.format("En DAOCSV: %s  %s",columns[0],columns[1]));
			}
			
			
		}
		
		return documentList;
	}
	/**
	 * Obtiene un elemento de la lista
	 * @param DocumentCode
	 * @return
	 */
	public String getDocument(int documentCode) {
		Map<Integer,String> documentList=this.getDocumentList();
		String document = String.format("%s&", documentCode); 
		document += documentList.get(documentCode).toString();
		return document;
	}
	
}
