package com.myshop.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.myshop.model.Order;

public class MailService {

	public void send(Order order){
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("shopmalyatko@gmail.com", "1991mawa");
					}
				  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("shopmalyatko@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("shopmalyatko@gmail.com"));
			message.setSubject("Малятко");
			message.setText(buildMessage(order));

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	private String buildMessage(Order order){
		StringBuilder massage = new StringBuilder();
		massage.append("Нова заявка # ").append(order.getId()).append(" від ").append(order.getLastName())
		.append(" ").append(order.getFirstName()).append(" \n").append("Кількість товарів #" + order.getQuantity())
		.append("на суму ").append(order.getAmount()); 
		return massage.toString();
	}
	public static void main(String[] args) {
		new MailService().send(null);
	}
}
