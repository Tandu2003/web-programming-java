package iuh.fit.se.connect_jpa.dao;

import iuh.fit.se.connect_jpa.entity.User;
import java.util.List;

public interface UserDAO {
    List<User> findAll();
    void save(User user);
    User findById(Long id);
    void update(User user);
    void delete(Long id);
}