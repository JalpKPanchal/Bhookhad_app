package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.AreaBean;
import com.bean.CityBean;
import com.dao.AreaDao;
import com.dao.CityDao;

@Controller
public class addAreaController {

    @Autowired
    CityDao citydao;

    @Autowired
    AreaDao areadao;

    @GetMapping("/addarea")
    public String addarea(Model model) {
        List<CityBean> cities = citydao.getAllCity();
        model.addAttribute("cities", cities);
        return "addarea";
    }

    @PostMapping("/savearea")
    public String savearea(AreaBean areabean) {
        areadao.addArea(areabean);
        return "home";
    }

    @GetMapping("/listarea")
    public String listarea(Model model) {
        List<AreaBean> area = areadao.getAllArea();
        model.addAttribute("area", area);
        return "listarea";
    }

    // Show the update form for a specific area
    @GetMapping("/updateArea")
    public String showUpdateAreaForm(@RequestParam("id") Integer areaId, Model model) {
        AreaBean area = areadao.getAreaById(areaId);
        List<CityBean> cities = citydao.getAllCity();
        model.addAttribute("area", area);
        model.addAttribute("cities", cities); // Pass cities for dropdown
        return "updateArea"; // JSP page for updating area
    }

    // Update area in the database
    @PostMapping("/updatearea")
    public String updateArea(AreaBean area) {
        areadao.updateArea(area);
        return "redirect:/listarea"; // Redirect back to the list of areas
    }

    // Delete an area
    @GetMapping("/deleteArea")
    public String deleteArea(@RequestParam("id") Integer areaId) {
        areadao.deleteArea(areaId);
        return "redirect:/listarea";
    }
}
