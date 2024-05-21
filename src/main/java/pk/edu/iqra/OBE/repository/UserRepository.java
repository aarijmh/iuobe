package pk.edu.iqra.OBE.repository;

import org.springframework.data.repository.CrudRepository;
import pk.edu.iqra.OBE.model.User;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);
}
