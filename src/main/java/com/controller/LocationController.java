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
import com.bean.LocationBean;
import com.dao.AreaDao;
import com.dao.CityDao;
import com.dao.LocationDao;

@Controller
public class LocationController
{
    @Autowired
    CityDao citydao;
    
    @Autowired
    AreaDao areadao;
    
    @Autowired
    LocationDao locationdao;
    
    @GetMapping("/addlocation")
    public String insertlocation(Model model)
    {
        List<CityBean> cities = citydao.getAllCity();
        model.addAttribute("cities", cities);
        List<AreaBean> area = areadao.getAllArea();
        model.addAttribute("area", area);
        return "addlocation";
    }
    
    @PostMapping("/savelocation")
    public String savelocation(LocationBean locationbean)
    {
        locationdao.insertLocation(locationbean);
        return "home";
    }
    
    @GetMapping("/listlocation")
    public String listlocation(Model model)
    {
        List<LocationBean> locations = locationdao.getAllLocation();
        model.addAttribute("locations", locations);
        return "listlocation";
    }

    // Update Location
    @GetMapping("/updateLocation")
    public String updateLocation(@RequestParam("id") int locationId, Model model) {
        LocationBean location = locationdao.getLocationById(locationId); // Assuming this method is added to fetch location by ID
        model.addAttribute("location", location);

        List<CityBean> cities = citydao.getAllCity();
        model.addAttribute("cities", cities);

        List<AreaBean> areas = areadao.getAllArea();
        model.addAttribute("areas", areas);

        return "updateLocation"; // This JSP page should handle the editing of location
    }

    @PostMapping("/updateLocation")
    public String saveUpdatedLocation(LocationBean locationBean) {
        locationdao.updateLocation(locationBean);
        return "redirect:/listlocation";
    }

    // Delete Location
    @GetMapping("/deleteLocation")
    public String deleteLocation(@RequestParam("id") int locationId) {
        locationdao.deleteLocationById(locationId);
        return "redirect:/listlocation";
    }
}
