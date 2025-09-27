package iuh.fit.se.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class User {
    protected int id;
    
    @NotNull(message = "Name must be not null")
    @NotEmpty(message = "Name must be not empty")
    @Size(min = 8, max = 50, message = "Name must be between 8 and 50 characters")
    protected String name;
    
    @NotEmpty(message = "Email must be not empty")
    @Email(message = "Email should be valid")
    protected String email;
    
    @NotNull(message = "Password must be not null")
    @NotEmpty(message = "Password must be not empty")
    @Size(min = 6, max = 20, message = "Password must be between 6 and 20 characters")
    protected String password;
    
    protected String country;

    public User() {
    }

    public User(String name, String email, String password, String country) {
        super();
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
    }

    public User(int id, String name, String email, String password, String country) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}