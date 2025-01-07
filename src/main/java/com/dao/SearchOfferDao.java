package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.OfferBean;

@Repository
public class SearchOfferDao {

    @Autowired
    JdbcTemplate stmt;

    public List<OfferBean> findOffersByTitle(String title) {
        String query = "SELECT o.*, l.title AS locationTitle " +
                       "FROM offers o " +
                       "JOIN location l ON o.locationId = l.locationId " +
                       "WHERE o.title LIKE ?";
        return stmt.query(query, new BeanPropertyRowMapper<>(OfferBean.class), title + "%");
    }

}