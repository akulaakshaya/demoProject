package projectBase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;



import java.util.List;

@Controller
public class mainController {
	
//	EmpDAO edao;
//	
//	@Autowired
//	public mainController(EmpDAO empdao) {
//		edao=empdao;
//	}

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getLoginPage(Model model) {
		System.out.println("Start page");

		
		return "login";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String getAdminLoginPage(Model model) {
		System.out.println("Admin Page");

		
		return "admin";
	}
	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	public String getCustomerLoginPage(Model model) {
		System.out.println("Customer Page");

		
		return "customer";
	}
	
}