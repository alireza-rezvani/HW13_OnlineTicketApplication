package ir.maktab32.java.homeworks.onlineticket.repositories;

import ir.maktab32.java.homeworks.onlineticket.config.hibernate.HibernateUtil;
import ir.maktab32.java.homeworks.onlineticket.config.hibernate.repositories.CrudRepository;
import ir.maktab32.java.homeworks.onlineticket.entities.User;
import org.hibernate.Session;

import java.util.List;

public class UserRepository extends CrudRepository<User, Long> {
    @Override
    protected Class<User> getEntityClass() {
        return User.class;
    }

    @Override
    protected Session getSession() {
        return HibernateUtil.getSession();
    }

    private UserRepository(){}

    private static UserRepository userRepository;
    public static UserRepository getInstance(){
        if (userRepository == null)
            userRepository = new UserRepository();
        return userRepository;
    }

    public boolean isUsernameExisting(String username){
        boolean result = false;
        List<User> allUsers = findAll();
        if (allUsers != null && !allUsers.isEmpty()){
            for (User i : allUsers) {
                if (i.getUsername().equals(username)) {
                    result = true;
                    break;
                }
            }
        }
        return result;
    }

    public User findByUsername(String username){
        User result = null;
        List<User> allUsers = findAll();
        if (allUsers != null && !allUsers.isEmpty()){
            for (User i : allUsers) {
                if (i.getUsername().equals(username)) {
                    result = i;
                    break;
                }
            }
        }
        return result;
    }
}
