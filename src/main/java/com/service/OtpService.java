package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
//import java.util.Random;

@Service
public class OtpService {

    @Autowired
    private JavaMailSender mailSender;

    public String generateOtp() {
        int otp = (int) (Math.random() * 900000) + 100000; 
        return String.valueOf(otp);
    }

    
    public void sendOtpEmail(String Email, String otp) throws MessagingException {
      
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        
        helper.setTo(Email);
        helper.setSubject("Your OTP for Password Reset");
        helper.setText("<h3>Your OTP for password reset is: " + otp + "</h3>", true); // true = HTML email

      
        mailSender.send(message);
    }
}