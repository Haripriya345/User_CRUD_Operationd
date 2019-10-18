package com.aegis.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aegis.entity.UserEntity;
import com.aegis.model.User;
import com.aegis.repository.UserMasterRepository;

@Controller
public class UserController {
	@Autowired
	private UserMasterRepository userRepo;

	public UserController() {
		System.out.println("WelcomeUser constructor ");
	}

	// @RequestMapping(value="/welcome")
	// @ResponseBody
	// public String greetUser(Model model,@RequestParam String name) {
	// String msg= name+", Greetings for the day";
	// model.addAttribute("msgKey", msg);
	// return "welcome "+ name;

	@RequestMapping(value = "/welcome")
	public String registerUserForm(Model model) {
		
		User user = new User();
		model.addAttribute("user", user);
		
		loadCountryDetails(model);
		
		return "welcome";

	}

	@RequestMapping(value = "/submitForm", method = RequestMethod.POST)
	public String regFormSubmission(@ModelAttribute("user") User user, Model model) {
		
		loadCountryDetails(model);
		model.addAttribute("user", new User());

		UserEntity userEntity = new UserEntity();

		BeanUtils.copyProperties(user, userEntity);

		userRepo.save(userEntity);

		return "regSuccess";
	}

	@RequestMapping(value = "/viewUser")
	public String viewUsers(Model model) {

		Iterable<UserEntity> existingUsers = userRepo.findAll();

		List<User> usersList = new ArrayList();

		for (UserEntity entity : existingUsers) {
			User users = new User();
			BeanUtils.copyProperties(entity, users);
			usersList.add(users);
		}

		model.addAttribute("usersList", usersList);

		return "displayUser";
	}
	
	
	@RequestMapping(value = "/viewUserPagination")
	public String viewUsersPagination(Model model,@RequestParam("pn")Integer currentPageNumer) {
		
		Integer pageSize=3;
		//Integer currentPage=1;
		PageRequest page= PageRequest.of(currentPageNumer-1, pageSize);
		model.addAttribute("cp", currentPageNumer);

		Page<UserEntity> pageData = userRepo.findAll(page);
		
		List<UserEntity> userEntities=pageData.getContent();
		int totalPages=pageData.getTotalPages();
		model.addAttribute("tp", totalPages);

		List<User> usersList = new ArrayList();

		for (UserEntity entity : userEntities) {
			User users = new User();
			BeanUtils.copyProperties(entity, users);
			usersList.add(users);
		}

		model.addAttribute("usersList", usersList);

		return "displayUserPagination";
	}

	@RequestMapping(value = "/editUser")
	public String editUser(@RequestParam("userId") Integer userId, @ModelAttribute("user") User user, Model model) {

		loadCountryDetails(model);
		
		Optional<UserEntity> optionalEntity = userRepo.findById(userId);
		if (optionalEntity.isPresent()) {
			user = new User();
			UserEntity entity = optionalEntity.get();
			BeanUtils.copyProperties(entity, user);
			model.addAttribute("user", user);
		}
		return "updateUser";
	}
	
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user,Model model) {
		
		model.addAttribute("user", new User());

		UserEntity userEntity = new UserEntity();

		BeanUtils.copyProperties(user, userEntity);

		userRepo.save(userEntity);
		
		return "redirect:viewUser";
	}

	@RequestMapping(value = "/deleteUser")
	public String deleteUser(@RequestParam("userId") Integer userId, Model model) {

		userRepo.deleteById(userId);
		return "redirect:viewUser";
	}
	
	private void loadCountryDetails(Model model) {
		List<String> countriesList= new ArrayList();
		countriesList.add("India");
		countriesList.add("USA");
		countriesList.add("UK");
		countriesList.add("Australia");
		countriesList.add("Singapore");
		
		model.addAttribute("countriesList", countriesList);
	}

}
