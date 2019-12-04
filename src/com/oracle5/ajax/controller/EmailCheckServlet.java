package com.oracle5.ajax.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.common.model.vo.GenerateCertPassword;

@WebServlet("/emailCheck.do")
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmailCheckServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");

		String host = "smtp.gmail.com";
		String to = email;
		String from = "yychani94@gmail.com";
		String password = "vqinbomogtxqswkh";
		String from_name = "떡잎유치원";

		Properties prop = new Properties();
		prop.put("mail.smtps.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(prop);

		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(from_name, "UTF-8", "B")));
			msg.setSubject("떡잎 유치원 인증번호");
			String check = new GenerateCertPassword().excuteGenerate();

			response.getWriter().print(check);

			/*
			 * msg.setContent(
			 * "<p><img src=\"https://drive.google.com/open?id=1Jhr3POOaDRxedsMqhPLmVDZWbhfTQ9nI\">회원가입 인증번호를 발송해드렸습니다.<br>해당 인증번호를 인증번호 입력칸에 입력하세요.</p><br><h1>인증번호 : "
			 * + check + "</h1>", "text/html;charset=" + "EUC-KR");
			 */
			InternetAddress address = new InternetAddress(to);
			msg.setRecipient(Message.RecipientType.TO, address);

			MimeMultipart multipart = new MimeMultipart("related");

			BodyPart messageBodyPart = new MimeBodyPart();
			String htmlText = "<img src=\"cid:my-image\"><p style='margin-left: 15%;'>회원가입 인증번호를 발송해드렸습니다.<br>해당 인증번호를 인증번호 입력칸에 입력하세요.</p><br><h1 style='margin-left: 15%;'>인증번호 : " + check + "</h1>";
			messageBodyPart.setContent(htmlText, "text/html;charset=" + "EUC-KR");

			multipart.addBodyPart(messageBodyPart);

			messageBodyPart = new MimeBodyPart();
			DataSource fds = new FileDataSource("C:\\images\\logo.png");
			messageBodyPart.setDataHandler(new DataHandler(fds));
			messageBodyPart.setHeader("Content-ID", "<my-image>");

			multipart.addBodyPart(messageBodyPart);

			msg.setContent(multipart);

			Transport transport = session.getTransport("smtp");
			transport.connect(host, from, password);
			transport.sendMessage(msg, msg.getAllRecipients());
			Transport.send(msg);
			transport.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
