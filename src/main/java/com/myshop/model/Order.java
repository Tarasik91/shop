package com.myshop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

import com.myshop.model.enums.DeliveryType;
import com.myshop.model.enums.OrderStatus;
import com.myshop.model.enums.PaidType;

@Entity
@Table(name = "customer_order")
public class Order {
	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;
	@Column(name = "status")
	@Enumerated
	private OrderStatus status;
	@Column(name = "amount")
	private double amount;
	@Column(name = "quantity")
	private double quantity;
	@Column(name = "firstName")
	private String firstName;
	@Column(name = "lastName")
	private String lastName;
	@Column(name = "email")
	private String email;
	@Column(name = "address")
	private String address;
	@Column(name = "telephone")
	private String telephone;
	@Column(name = "date_created")
	@Type(type="org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime dateCreated;
	@Enumerated
	private DeliveryType deliveryType;
	@Enumerated
	private PaidType paidType;
	private String newMailAddress;
	private String comment;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amoubt) {
		this.amount = amoubt;
	}

	public DateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(DateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public DeliveryType getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(DeliveryType deliveryType) {
		this.deliveryType = deliveryType;
	}

	public String getNewMailAddress() {
		return newMailAddress;
	}

	public void setNewMailAddress(String newMailAddress) {
		this.newMailAddress = newMailAddress;
	}

	public PaidType getPaidType() {
		return paidType;
	}

	public void setPaidType(PaidType paidType) {
		this.paidType = paidType;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}	
}
