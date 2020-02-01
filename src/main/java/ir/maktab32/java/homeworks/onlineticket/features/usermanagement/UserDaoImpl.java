package ir.maktab32.java.homeworks.onlineticket.features.usermanagement;

import ir.maktab32.java.homeworks.onlineticket.entities.User;
import ir.maktab32.java.homeworks.onlineticket.repositories.UserRepository;

public class UserDaoImpl implements UserDao {
    @Override
    public User login(String username, String password) {
        User result;

        if (UserRepository.getInstance().isUsernameExisting(username)
                && UserRepository.getInstance().findByUsername(username).getPassword().equals(password)){
            result = UserRepository.getInstance().findByUsername(username);
        }
        else {
            result = null;
        }

        return result;
    }
}
