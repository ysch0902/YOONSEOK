package global.sesoc.web6;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * web5 메인화면
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		logger.debug("홈 화면 진입");
		return "home";
	}
	
}
