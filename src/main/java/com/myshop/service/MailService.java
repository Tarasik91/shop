package com.myshop.service;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;

import com.myshop.dao.ProductInOrderDao;
import com.myshop.model.Order;
import com.myshop.model.ProductInOrder;

public class MailService {

	@Autowired
	private ProductInOrderDao productInOrderDao;

	public void send(Order order) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("shopmalyatko@gmail.com", "1991mawa");
			}
		});

		try {
			Message message = new MimeMessage(session);
		
			message.setFrom(new InternetAddress("shopmalyatko@gmail.com"));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("shopmalyatko@gmail.com"));
			message.setSubject("Малятко");
			//message.setText("dd");
			//message.setText(buildMessage(order));
			message.setContent(buildMessage(order), "text/html; charset=utf-8");
			Transport.send(message);
			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}

	private String buildMessage(Order order) {
		List<ProductInOrder> productsInOrder = productInOrderDao.findByOrder(order);
		StringBuilder email = new StringBuilder();
		if (productsInOrder != null) {
			
			email.append("<h2>Нова заявка # ").append(order.getId()).append(" від ").append(order.getLastName()).append(" ")
					.append(order.getFirstName()).append(" \n").append("Кількість товарів #" + order.getQuantity())
					.append(" на суму ").append(order.getAmount()).append("</h2>");
			email.append("<table style='border:2px solid black; width: 100%;'>");
			email.append("<tr style = 'background-color: #e699ff; color: white;'>Продукт<th>Кількість</th><th>Ціна</th><th>Сума</th></tr>");
			email.append("<tbody>");
			for (ProductInOrder productInOrder : productsInOrder) {
				email.append("<tr><td>").append(productInOrder.getProduct().getName()).append("</td><td>")
						.append(productInOrder.getQuantity()).append("</td><td>").append(productInOrder.getPrice())
						.append("</td>").append(productInOrder.getQuantity() * productInOrder.getPrice())
						.append("<tr>");
			}
			email.append("</tbody></table>");
		}
		return email.toString();
	}
}
