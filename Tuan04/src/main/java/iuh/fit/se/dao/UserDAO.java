package iuh.fit.se.dao;

import iuh.fit.se.model.User;
import java.util.List;

public interface UserDAO {
    public List<User> findAll();
    public boolean save(User user);
    public boolean delete(int id);
    public User findById(int id);
}
