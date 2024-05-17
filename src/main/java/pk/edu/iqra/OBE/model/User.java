package pk.edu.iqra.OBE.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Table(name = "user")
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "salutation", length = 45)
    private String salutation;

    @Column(name = "first_name", length = 45)
    private String firstName;

    @Column(name = "middle_name", length = 45)
    private String middleName;

    @Column(name = "last_name", length = 45)
    private String lastName;

    @Column(name = "email", length = 45)
    private String email;

    @Column(name = "phone", length = 45)
    private String phone;

    @Column(name = "mobile", length = 45)
    private String mobile;

    @Column(name = "permanent_status", length = 45)
    private String permanentStatus;

    @Column(name = "qualification_level", length = 45)
    private String qualificationLevel;

    @Column(name = "qualification_title", length = 45)
    private String qualificationTitle;

    @Column(name = "cnic", length = 45)
    private String cnic;

    @Column(name = "personal_url", length = 45)
    private String personalUrl;

    @Column(name = "password", length = 200)
    private String password;

    @Column(name = "field_of_study", length = 100)
    private String fieldOfStudy;

    @Column(name = "status")
    private Boolean status;

    @Column(name = "dob")
    private LocalDate dob;

    @Column(name = "joinning_date")
    private LocalDate joinningDate;

    @Column(name = "is_deleted")
    private Boolean isDeleted;


}