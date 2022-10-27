package programLibraries;

import java.time.LocalTime;
/**
 * Implementacion concreta del objeto de respuesta
 * @author kennethp
 *
 */
public class ServerTime {
	
	private String[] parseTime() {
		// 20:23:00.000000
		return String.format("%s", LocalTime.now()).split(":");
	}
	
	public String getSeconds() {
	
		return this.parseTime()[2];
	}
	
	public String getMinute() {
		return this.parseTime()[1];
		}
	
	public String getHour() {
		return this.parseTime()[0];
	}

}
