package pk.edu.iqra.OBE.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pk.edu.iqra.OBE.model.Role;
import pk.edu.iqra.OBE.model.UserRole;

import java.util.Set;

public interface UserRoleRepository extends CrudRepository<UserRole, Long> {

    @Query("select ur.roles from UserRole ur where ur.user.id = ?1")
    Set<Role> findRoleOfUser(Long userId);
}
