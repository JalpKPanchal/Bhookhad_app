package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bean.RatingBean;

@Repository
public class RatingDao {
    @Autowired
    JdbcTemplate stmt;

  
    public void addRating(RatingBean rate) {
        // Validate rating before inserting
        if (rate.getRating() < 1 || rate.getRating() > 5) {
            throw new IllegalArgumentException("Rating must be between 1 and 5");
        }

        // Proceed with the insertion
        stmt.update("INSERT INTO ratings (offerId, comments, rating) VALUES (?, ?, ?)", 
                    rate.getOfferId(), rate.getComments(), rate.getRating());
    }

}
