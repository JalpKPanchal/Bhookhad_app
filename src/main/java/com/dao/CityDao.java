package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CityBean;

@Repository
public class CityDao {
    @Autowired
    JdbcTemplate jdbctemplate;
    
    public void inserCity(CityBean city) {
        jdbctemplate.update("INSERT INTO city(cityName) VALUES(?)", city.getCityName());
    }
    
    public List<CityBean> getAllCity() {
        return jdbctemplate.query("SELECT * FROM city ORDER BY cityId", new BeanPropertyRowMapper<>(CityBean.class));
    }

    // New method to get a city by its ID
    public CityBean getCityById(Integer cityId) {
        String query = "SELECT * FROM city WHERE cityId = ?";
        return jdbctemplate.queryForObject(query, new BeanPropertyRowMapper<>(CityBean.class), cityId);
    }

    // New method to update a city
    public void updateCity(CityBean city) {
        String query = "UPDATE city SET cityName = ? WHERE cityId = ?";
        jdbctemplate.update(query, city.getCityName(), city.getCityId());
    }

    // New method to delete a city
    public void deleteCity(Integer cityId) {
        String query = "DELETE FROM city WHERE cityId = ?";
        jdbctemplate.update(query, cityId);
    }
}
