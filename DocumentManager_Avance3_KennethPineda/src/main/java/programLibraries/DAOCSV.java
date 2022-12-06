package programLibraries;

import java.util.HashMap;
import java.util.Map;

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
	
	private Map<Integer,String> getDocumentList(){
		Map<Integer,String> documentList = new HashMap<>();
		FileManager fm=new FileManager();
		FileManagerResponse fmr=fm.read("eclipse/Folder/temporalFile.csv");
		
		if(fmr.isStatus()) {
			String textContent=fmr.getContent();
			/*String textLines[]=textContent.split("\\n+");
			
			for (String row : textLines) {
				String columns[]=row.split(",");
				documentList.put(Integer.parseInt(columns[0]), columns[1]);
			}*/
			String columns[]=textContent.split(",");
			documentList.put(Integer.parseInt(columns[0]), columns[1]);
			System.out.println(String.format("En DAOCSV: %s  %s",columns[0],columns[1]));
			
		}
		
		return documentList;
	}
	/**
	 * Obtiene un elemento de la lista
	 * @param DocumentCode
	 * @return
	 */
	public String getDocument(int DocumentCode) {
		Map<Integer,String> documentList=this.getDocumentList();
		String document = documentList.get(DocumentCode).toString();
		return document;
	}
	
}
