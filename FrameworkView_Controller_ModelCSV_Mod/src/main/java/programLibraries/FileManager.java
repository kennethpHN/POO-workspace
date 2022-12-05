package programLibraries;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class FileManager {
	/**
	 * 
	 * @return La ruta del sistema donde se estan guardando ,por defecto, los archivos.
	 */
	public String path() {
		File file=new File(".");
		return file.getAbsolutePath();
	}
	
	public FileManagerResponse read(String fileName) {
		try {
			FileManagerResponse response=new FileManagerResponse();
			response.setPath(String.format("%s/%s", this.path(),fileName));
			response.setContent(Files.readString(Paths.get(response.getPath())));
			response.setStatus(true);
			
			return response;
		}
		catch(IOException e) {
			return new FileManagerResponse(e.toString());
		}
				
	}
	
	public FileManagerResponse create(String fileName, String content) {
		try {
			FileManagerResponse response=new FileManagerResponse();
			response.setPath(Files.writeString(Files.createFile(Paths.get(String.format("%s/%s", this.path(),fileName))),content).toString());
			response.setStatus(true);
			
			return response;
		}
		catch(FileAlreadyExistsException e) {
			//return new FileManagerResponse("El archivo que esta intentando crear, ya existe.");
			return this.createAndOverride(fileName, content);
		}
		catch(IOException e) {
			return new FileManagerResponse(e.toString());
		}
	}
	
	public FileManagerResponse createAndOverride(String fileName, String content) {
		try {
			FileManagerResponse response=new FileManagerResponse();
			response.setPath(Files.writeString(Paths.get(String.format("%s/%s", this.path(),fileName)),"\n"+content,StandardOpenOption.APPEND).toString());
			response.setStatus(true);
			
			return response;
		}
		catch(IOException e) {
			return new FileManagerResponse(e.toString());
		}
	}
}
