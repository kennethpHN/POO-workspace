package programLibraries;

public class DAOCSV {
	
	public DAOCSVResponse createModel (String number,String email,String documentCode,String information) {
		
		DAOCSVResponse response = new DAOCSVResponse();
		CSV csvObject = new CSV(number,email,documentCode,information);
		String content = csvObject.toString();
		
		FileManager fm = new FileManager();
		String path = fm.path();
		FileManagerResponse createResponse = fm.create("eclipse/Folder/temporalFIle.csv", content);
		FileManagerResponse readResponse = fm.read("eclipse/Folder/temporalFIle.csv");
		
		response.setStatus(createResponse.isStatus() && readResponse.isStatus());
		response.setContent(readResponse.getContent());
		response.setPath(path);
		return response;
		
	}
	
}
