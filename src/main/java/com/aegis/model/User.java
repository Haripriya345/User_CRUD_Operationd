package com.aegis.model;

import java.util.List;

import lombok.Data;

@Data
public class User {
	private Integer userId;
	private String userName;
	private String password;
	private String email;
	private Long phoneNo;
	private List<String> country;
}
