package com.cognizant.springrest.controller;

import java.util.Base64;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class AuthenticationController {

    @GetMapping("/authenticate")
    public String authenticate(HttpServletRequest request) {

        String authorizationHeader = request.getHeader("Authorization");

        String encodedCredentials = authorizationHeader.substring("Basic ".length());

        byte[] decodedBytes = Base64.getDecoder().decode(encodedCredentials);

        String credentials = new String(decodedBytes);

        String[] values = credentials.split(":", 2);

        String username = values[0];
        String password = values[1];

        return "Username : " + username + ", Password : " + password;
    }
}