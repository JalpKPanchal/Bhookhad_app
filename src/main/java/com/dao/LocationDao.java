package com.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.bean.LocationBean;

@Repository
public class LocationDao {

    @Autowired
    JdbcTemplate jdbctemplate;

    // Method to insert a location
    public void insertLocation(LocationBean location) {
        String sql = "INSERT INTO location(title, category, description, timings, active, contactNumber, address, cityId, areaId, latitude, longitude, foodType) "
                   + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbctemplate.update(sql,
                location.getTitle(), location.getCategory(), location.getDescription(), location.getTimings(),
                location.getActive(), location.getContactNumber(), location.getAddress(), location.getCityId(),
                location.getAreaId(), location.getLatitude(), location.getLongitude(), location.getFoodType());
    }

    // Method to get all locations (merged with getAllLocation1)
    public List<LocationBean> getAllLocation() {
        String sql = "SELECT locationId, title, category, description, timings, latitude, longitude, foodType, cityName, areaName " +
                     "FROM location " +
                     "INNER JOIN city USING(cityId) " +
                     "INNER JOIN area USING(areaId)";
        return jdbctemplate.query(sql, new BeanPropertyRowMapper<>(LocationBean.class));
    }

    // Method to update a location
    public void updateLocation(LocationBean location) {
        String sql = "UPDATE location SET title = ?, category = ?, description = ?, timings = ?, active = ?, contactNumber = ?, address = ?, cityId = ?, areaId = ?, latitude = ?, longitude = ?, foodType = ? WHERE locationId = ?";
        jdbctemplate.update(sql, location.getTitle(), location.getCategory(), location.getDescription(), location.getTimings(),
                location.getActive(), location.getContactNumber(), location.getAddress(), location.getCityId(),
                location.getAreaId(), location.getLatitude(), location.getLongitude(), location.getFoodType(), location.getLocationId());
    }

    // Method to delete a location by ID
    public void deleteLocationById(int locationId) {
        String sql = "DELETE FROM location WHERE locationId = ?";
        jdbctemplate.update(sql, locationId);
    }

    // Method to get a location by ID
    public LocationBean getLocationById(int locationId) {
        String sql = "SELECT * FROM location WHERE locationId = ?";
        return jdbctemplate.queryForObject(sql, new Object[]{locationId}, new BeanPropertyRowMapper<>(LocationBean.class));
    }
}
