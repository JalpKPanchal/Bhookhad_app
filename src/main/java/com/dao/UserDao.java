package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt;
	
	// Create a BCryptPasswordEncoder instance
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    public void addUser(UserBean user) {
        // Encrypt the password before storing it in the database
        String encryptedPassword = passwordEncoder.encode(user.getPassword());
        
        stmt.update("INSERT INTO USERS(Firstname, Lastname, Gender, Contact, Email, Password, Age,profilePicPath) VALUES (?, ?, ?, ?, ?, ?, ?,?)",
                user.getFirstname(), user.getLastname(), user.getGender(), user.getContact(), user.getEmail(), encryptedPassword, user.getAge(),user.getProfilePicPath());
        
    }
    
    public UserBean getUserByEmail(String email) {
		// TODO Auto-generated method stub
		UserBean user = stmt.queryForObject("select * from USERS where email = ?",
				new BeanPropertyRowMapper<>(UserBean.class), new Object[] { email });
		return user;
	}
    

     public void deleteUserbyId(Integer userId) {
		
		stmt.update("delete from users where userId=?",userId);
		
	}

     
     public void updateuser(UserBean user) {
 		
 		stmt.update("update USERS set firstname=?, lastname=? where userId=?",user.getFirstname(),user.getLastname(),user.getUserId() );

 	}

    public boolean checkUser(UserBean user)
    {
        UserBean existingUser = findByEmail(user.getEmail());
        
        if (existingUser != null) {
            // Verify the password with the stored encrypted password
            return passwordEncoder.matches(user.getPassword(), existingUser.getPassword());
        }
        return false;
    }
	
    public UserBean findByEmail(String email) {
        try {
            return stmt.queryForObject("SELECT * FROM USERS WHERE email=?", new BeanPropertyRowMapper<>(UserBean.class), new Object[]{email});
        } catch (Exception e) {
            return null;
        }
    }


	public boolean verifyOtp(String email, String otp) {
	    Integer count = stmt.queryForObject("SELECT count(*) FROM USERS WHERE email=? AND otp=?", Integer.class,new Object[]{email, otp});
	    return count != null && count > 0; 
	}

	public void updatePassword(String email, String newPassword) {
        // Encrypt the new password before updating
        String encryptedPassword = passwordEncoder.encode(newPassword);
        stmt.update("UPDATE USERS SET password = ? WHERE email = ?", encryptedPassword, email);
    }
	public void saveOtpForUser(String email, String otp) {
	    String sql = "UPDATE USERS SET otp=? WHERE email=?";
	    stmt.update(sql, otp, email);
	}
	
	public String getOtpForUser(String email) {
	    String sql = "SELECT otp FROM USERS WHERE email=?";
	    return stmt.queryForObject(sql, String.class,new Object[]{email});
	}
	
	public boolean checkadmin(UserBean user) {
		String role = stmt.queryForObject("select role from users where email=?", new Object[]{user.getEmail()}, String.class);

		if(role.equals("admin")) 
		{
			return true;
		}
		else
		{
			return false;
		}
	}
public boolean logincheck(UserBean user) {
		
		Integer count = stmt.queryForObject("select count(*) from users where email=? and password=? ", new Object[]{user.getEmail(), user.getPassword()}, Integer.class);
		
		if(count>=1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

}