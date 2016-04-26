package springmusic.model.dao;

import java.util.List;

import springmusic.model.User;

public interface UserDao {
    
    List<User> getUsers();
    
    List<User> searchSearch(String searchTerm);
    
    User getUser(int id);
    
    void deleteUser(User user);
    
    User save(User user);
    
    boolean isEmailUnique(String email);
}
