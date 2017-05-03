
package cn.com.loan.webService;

import java.io.Serializable;
//import java.io.StringWriter;

//import javax.xml.bind.JAXBContext;
//import javax.xml.bind.Marshaller;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement
public class Response implements Serializable {
	@XmlElement
    private String message;
	@XmlElement
    private int code;
	
	private String id;

    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}

	// javaBean 转 xml 输出字符串
//	public static void main(String[] args) throws Exception {
//		Response response = new Response();
//		response.setCode(0);
//		response.setMessage("ok");
//		
//		JAXBContext jaxbContext = JAXBContext.newInstance(Response.class); 
//	
//        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();  
//        //Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
//        StringWriter writer = new StringWriter();
//        //unmarshaller.
//        // output pretty printed  
//        jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//        jaxbMarshaller.marshal(response, writer);
//        System.out.println(writer);
//        //jaxbMarshaller.toString()
//	}

	private static final long serialVersionUID = 4791767156105658889L;
}
