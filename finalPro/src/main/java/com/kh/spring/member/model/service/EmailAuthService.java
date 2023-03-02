package com.kh.spring.member.model.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmailAuthService {

	String mailId = "khtest123@naver.com";
	String pwd = "testforproject44";
	String port = "587";
	String host = "smtp.naver.com";
	
	public Map<String, Object> getEmailAuth(String email) {
	      HashMap<String, Object> map =new HashMap<String, Object>();
	      String authCode = makeRandomNumber();
	      String contents = getContents(authCode); //메일 내용
	      if(isValidEmail(email)) { //이메일 유효
	         sendMail("이메일 인증코드 입니다.",contents, email);
	         map.put("emailAuthCode", authCode);
	         return map;
	      }
	      System.out.println("실행됨");
	      map.put("emailAuthCode",  "It's not an appropriate email format");
	      return map;
	   }
	   
		
	   public void sendMail(String subejct, String body, Object obj) {
	      try {
	         InternetAddress[] receiverList = new InternetAddress[1];
	         receiverList[0] = new InternetAddress((String)obj);
	         //System.out.println("11111111111111111");
	         // SMTP 발송 Properties 설정
	         Properties props = getProperties();
	         
	         // SMTP Session 생성
	         Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
	            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
	               return new javax.mail.PasswordAuthentication(mailId, pwd);
	            }
	         });
	        // System.out.println("22222222222222");
	         // Mail 조립
	         Message mimeMessage = new MimeMessage(mailSession);
	         mimeMessage.setFrom(new InternetAddress(mailId));
	         mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);
	            // 메일 제목
	         mimeMessage.setSubject(subejct);
	            // 메일 본문 (.setText를 사용하면 단순 텍스트 전달 가능)
	         mimeMessage.setContent(body, "text/html; charset=UTF-8");
	        // System.out.println("3333333333333");
	         System.out.println("성공적 전송완!");
	         // Mail 발송
	         Transport.send(mimeMessage);
	         
	      } catch(Exception e) {
	        System.out.println(e.getMessage()); 
	  //  	  log.error("Error SendMail");
	      }
	   }

	   private Properties getProperties() {
	      Properties props = new Properties();
	      props.put("mail.transport.protocol", "smtp");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", port);
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.tls.enable","true");
	      props.put("mail.smtp.tls.trust", host);
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	      return props;
	   }

	 public String makeRandomNumber() {
	      String randomNumber = "";
	      Random random = new Random();
	      random.setSeed(System.currentTimeMillis());
	      for(int i = 0 ; i < 6 ; i ++) {
	         randomNumber += random.nextInt(10);
	      }
	      return randomNumber;
	   }
	   
	   public static boolean isValidEmail(String email) {
	      String format = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
	      Pattern pattern = Pattern.compile(format);
	      Matcher matcher = pattern.matcher(email);
	      if(matcher.matches()) {
	         return true;
	      }
	     // log.error("It's not an appropriate email format");
	      return false;
	   }
	   
	   public String getContents(String authCode) {
	       StringBuffer contents = new StringBuffer();
	         contents.append("<h1>이메일 인증코드</h1><br><br>");
	         contents.append("<p> 이메일 인증코드는 "+ authCode +" 입니다.</p><br>");
	      return contents.toString();
	   }
}
