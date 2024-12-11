package kr.co.dong.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import kr.co.dong.project.AuthService;

@Controller
public class SocialLoginController {
   
   @Inject
   AuthService authService;

}

