package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.OfferBean;
import com.bean.RatingBean;
import com.dao.OfferDao;
import com.dao.RatingDao;

@Controller
public class RatingController {
    @Autowired
    RatingDao rateDao;

    @Autowired
    OfferDao offerDao;

    @GetMapping("/rating")
    public String rating(Model model) {
        List<OfferBean> offers = offerDao.getAllOffer();
        model.addAttribute("offer", offers);
        return "rating";
    }

    @PostMapping("/submitRating")
    public String submitRate(RatingBean rate) {
        System.out.println("Inserting Rating:");
        System.out.println("Offer ID: " + rate.getOfferId());
        System.out.println("Comments: " + rate.getComments());
        System.out.println("Rating: " + rate.getRating()); // This should show the rating value

        // Check if rating is valid
        if (rate.getRating() < 1 || rate.getRating() > 5) {
            throw new IllegalArgumentException("Rating must be between 1 and 5");
        }

        rateDao.addRating(rate);  // This will now insert the correct rating
        return "home";
    }


}
