package com.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.apache.commons.io.FileUtils;

import com.dao.LocationDao;
import com.dao.OfferDao;
import com.bean.LocationBean;
import com.bean.OfferBean;

@Controller
public class OfferController {

	@Autowired
	LocationDao locationdao;
	
	@Autowired
	OfferDao offerdao;
	
	@GetMapping("/addother")
	public String addoffer(Model model)
	{
		List<LocationBean>location=locationdao.getAllLocation();
		model.addAttribute("location",location);
		return"addoffer";
	}
	
	@PostMapping("saveoffer")
	public String saveoffer(OfferBean offer) {
		offer.setActive(true);

		try {
			File file = new File("E:\\Bhookad\\Bhookad\\src\\main\\webapp\\offerpic",
					offer.getOfferPic().getOriginalFilename());
			
			FileUtils.writeByteArrayToFile(file, offer.getOfferPic().getBytes());
			
			offer.setOfferPicPath("offerpic/"+offer.getOfferPic().getOriginalFilename());
			offerdao.insertoffer(offer);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "home";
	}

	
	@GetMapping("/listoffer")
	public String listoffer(Model model)
	{
		List<OfferBean> listoffer = offerdao.getAllOffer();
		model.addAttribute("listoffer", listoffer);
		return "listoffer";
	}
	// Method to fetch offer details for updating
	@GetMapping("/updateOffer")
	public String getOfferById(@RequestParam("id") int offerId, Model model) {
	    OfferBean offer = offerdao.getOfferById(offerId);
	    model.addAttribute("offer", offer);
	    
	    // Fetching locations for the dropdown
	    List<LocationBean> locations = locationdao.getAllLocation();
	    model.addAttribute("location", locations);  // Ensure consistency
	    
	    return "updateOffer";
	}



    // Method to handle the update operation
    @PostMapping("/updateoffer")
    public String updateOffer(@ModelAttribute OfferBean offer) {
        offerdao.updateOffer(offer);
        return "redirect:listoffer"; // Redirecting back to list of offers
    }

    // Method to delete an offer
    @GetMapping("/deleteOffer")
    public String deleteOffer(@RequestParam("id") int offerId) {
        offerdao.deleteOffer(offerId);
        return "redirect:listoffer"; // Redirecting back to list of offers
    }
}