package com.jardin.shop.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.management.MemoryType;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jardin.shop.Dao.JoinDao;
import com.jardin.shop.Dto.JoinDto;
import com.jardin.shop.Service.JoinService;

@Controller
public class JoinController {
	
	private static final Logger Logger = LoggerFactory.getLogger(JoinController.class);
	private static final String String = null;
	
	@Inject
	JoinService service;
	
	@Inject
	JavaMailSender mailSender; //메일 서비스를 사용하기 위해 의존성을 주입
	
	
	//회원가입 페이지1
	@RequestMapping(value = "Signup/join1")
	public String join1() throws Exception {
		
		return "Signup/join1";
	}
	
	
	//mailSending 코드
	@RequestMapping(value = "Signup/auth", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String user_mail, HttpServletResponse response_email) throws IOException {
		
		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
		
		String setfrom = "silminttu@gmail.com";
		String tomail = request.getParameter("user_mail"); //받는 사람 이메일
		String title = "JARDIN 회원가입 인증 이메일 입니다."; //제목
		String content =
				
				System.getProperty("line.separator") + //한줄씩 줄간격을 두기 위해 작성
				System.getProperty("line.separator") + 
				
				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다." +
				
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				
				"인증번호는" + dice + "입니다." +
				
				System.getProperty("line.separator") +
				System.getProperty("line.separator") +
				
				"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; //내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom); //보내는사람 생략하면 정상 작동을 안함
			messageHelper.setTo(tomail); //받는 사람 이메일
			messageHelper.setSubject(title); //메일 제목은 생략이 가능
			messageHelper.setText(content); //메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.print(e);
			
		}
		
		ModelAndView mv = new ModelAndView(); //ModelAndView로 보낼 페이지를 지정, 보낼값을 지정
		mv.setViewName("Signup/email인증2");
		mv.addObject("dice", dice);
		
		System.out.print("mv : " + mv);
		
		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();
		
		return mv;
  	}
	
	//이메일 인증 페이지 
	@RequestMapping(value = "Signup/email인증")
	public String email인증 () {
		
		return "Signup/email인증";
	}
	
	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드
	//내가 입력한 인증번호와 메일로 입력되 인증번호가 맞는지 확인
	//맞으면 회원가입 페이지로 가고 틀리면 다시 원래 페이지로 돌아옴
	@RequestMapping(value = "Signup/authTest/{dice}/{injeung}", method = RequestMethod.POST)
	@ResponseBody
	public int email인증2 (@PathVariable String dice, @PathVariable String injeung) throws IOException {
		
		System.out.print("정답 dice : " + dice);
		System.out.print("입력 dice : " + injeung);
		
		int ok=0;
		  
		  if(injeung.equals(dice)) {
			  ok = 1; //참
		  
		  }
		  return ok;
	  }
	
	//join2 page
	@RequestMapping(value = "Signup/join2")
	public String join2() throws Exception {
		
		return "Signup/join2";
	}
	
	//join3 page
	@RequestMapping("Signup/join3")
	public String join3() throws Exception {
		
		return "Signup/join3";
	}
	
	//id check
		@RequestMapping(value = "Signup/id_ch", method = RequestMethod.POST)
		@ResponseBody
		public int id_ch (JoinDto dto) throws Exception {
			int result = service.id_ch(dto);
			return result;
		}
		
	//user 정보
	@RequestMapping(value = "Signup/joinwrite", method = RequestMethod.POST)
	public String joinwrtie(JoinDto dto) throws Exception { 
		System.out.println(dto);
		System.out.println("j_id: " + dto.getJ_id());
		service.joinwrite(dto);
		
		return "redirect:join4";
	}
	
	//join4 page
	@RequestMapping("Signup/join4")
	public String join4() throws Exception {
		
		return "Signup/join4";
	}
}
