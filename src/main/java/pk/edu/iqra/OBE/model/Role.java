package pk.edu.iqra.OBE.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "roles")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "int UNSIGNED not null")
    private Long id;

    @Column(name = "roles", nullable = false, length = 45)
    private String roles;

    @Column(name = "description", length = 45)
    private String description;

    @OneToMany(mappedBy = "roles")
    private Set<UserRole> userRoles = new LinkedHashSet<>();

}