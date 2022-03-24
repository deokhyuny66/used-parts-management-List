package action;

import java.util.*;

public class actionDTO {
	String name = null;
	List<String> items_arr = null;

	public String getName() {
		return this.name;
	}
	  
	public void setName(String paramName) {
		 this.name = paramName;
	}
	
	public List<String> getList() {
		return this.items_arr;
	}

	public void setList(List<String> item) {
		this.items_arr = item;
	}
}

