package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.service.GeocodingService;

@Controller
public class GeocodingController {

	@Autowired
	private GeocodingService geocodingService;

	@GetMapping("/address")
	public String address() {
		return "Address";
	}

	@PostMapping("/getLatLong")
	public String  getLatLong(@RequestParam String address) {
		try {
			System.out.println(address);
			System.out.println(geocodingService.getLatLongFromAddress(address));

		} catch (Exception e) {
			System.out.println("ERROR");
			System.out.println(e.getMessage());

		}
		
		return "Address";
				
	}
}
