package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.CityBean;
import com.dao.CityDao;

@Controller
public class CityController {
    @Autowired
    CityDao citydao;

    @GetMapping("/addcity")
    public String insertcity() {
        return "addcity";
    }

    @PostMapping("/savecity")
    public String savecity(CityBean citybean) {
        citydao.inserCity(citybean);
        return "home";
    }

    @GetMapping("/listcity")
    public String listcity(Model model) {
        List<CityBean> cities = citydao.getAllCity();
        model.addAttribute("cities", cities);
        return "listcity";
    }

    // Method to show the update city page
    @GetMapping("/updateCity")
    public String updateCity(@RequestParam("id") Integer cityId, Model model) {
        CityBean city = citydao.getCityById(cityId); // Add a method to retrieve the city by ID
        model.addAttribute("city", city);
        return "updateCity"; // Create an updateCity.jsp page
    }

    // Method to handle the update city form submission
    @PostMapping("/updateCity")
    public String updateCity(CityBean citybean) {
        citydao.updateCity(citybean);
        return "redirect:/listcity"; // Redirect to the list of cities
    }

    // Method to delete a city
    @PostMapping("/deleteCity")
    public String deleteCity(@RequestParam("id") Integer cityId) {
        citydao.deleteCity(cityId);
        return "redirect:/listcity"; // Redirect to the list of cities
    }
}
