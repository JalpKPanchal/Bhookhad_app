package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.LocationBean;
import com.bean.OfferBean;
import com.dao.LocationDao;
import com.dao.SearchOfferDao;

@Controller
public class SearchOfferController {

    @Autowired
    SearchOfferDao searchOfferDao;
    @Autowired
    LocationDao locationdao;

    @GetMapping(value={"/search","/"})
    public String search() {
        return "SearchOffer"; // JSP file name
    }

    @PostMapping("/searchOffer")
    public String searchuser(OfferBean offer, Model model) {     
        List<OfferBean> searchResults = searchOfferDao.findOffersByTitle(offer.getTitle()); 
        model.addAttribute("offers", searchResults); // Add offers to model for the JSP
        return "SearchOffer";
    }
}
