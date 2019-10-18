package com.aegis.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="USER_MASTER")
public class UserEntity {
	
	@Id
	@GeneratedValue
	@Column(name="USERID")
	private Integer userId;
	
	@Column(name="USERNAME")
	private String userName;
	
	@Column(name="PASSWORD")
	private String password;
	
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="PHONENO")
	private Long phoneNo;
	
	@Column(name="COUNTRY")
    @ElementCollection(targetClass=String.class)
	private List<String> country;

}
