package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import java.math.BigInteger;
import java.util.Date;

import play.data.validation.Constraints.Email;
import play.data.validation.Constraints.Required;

@Entity
public class User
{

    @Id
    @Required
    private BigInteger id;

    @Required
    @Column(length = 100)
    private String name;

    @Email
    @Required
    private String email = "admin@deep-think.net";

    @Required
    private Boolean finalize = false;

    @Required
    private Boolean isAdmin = false;

    @Required
    @Column(insertable = false, updatable = false)
    private Date createdOn;

    @Required
    private Date lastLogin;

    @PrePersist
    protected void onCreate() {
        createdOn = new Date();
    }
}
