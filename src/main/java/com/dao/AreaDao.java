package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AreaBean;

@Repository
public class AreaDao {

    @Autowired
    JdbcTemplate jdbctemplate;
    
    public void addArea(AreaBean areabean) {
        String query = "INSERT INTO area(areaName, cityId) VALUES(?, ?)";
        jdbctemplate.update(query, areabean.getAreaName(), areabean.getCityId());
    }
    
    public List<AreaBean> getAllArea() {
        String query = "SELECT a.areaId, a.areaName, c.cityName FROM area a INNER JOIN city c ON a.cityId = c.cityId";
        return jdbctemplate.query(query, new BeanPropertyRowMapper<>(AreaBean.class));
    }

    // New method to get an area by its ID
    public AreaBean getAreaById(Integer areaId) {
        String query = "SELECT a.areaId, a.areaName, c.cityName, a.cityId FROM area a INNER JOIN city c ON a.cityId = c.cityId WHERE a.areaId = ?";
        return jdbctemplate.queryForObject(query, new BeanPropertyRowMapper<>(AreaBean.class), areaId);
    }

    // Method to update an area
    public void updateArea(AreaBean area) {
        String query = "UPDATE area SET areaName = ?, cityId = ? WHERE areaId = ?";
        jdbctemplate.update(query, area.getAreaName(), area.getCityId(), area.getAreaId());
    }

    // Method to delete an area
    public void deleteArea(Integer areaId) {
        String query = "DELETE FROM area WHERE areaId = ?";
        jdbctemplate.update(query, areaId);
    }
}
