package models;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.math.BigDecimal;
import java.util.Date;

import play.data.validation.Constraints;

@MappedSuperclass
public abstract class AbstractPayment
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Integer paymentId;

    @Constraints.Required
    private User user;

    @Constraints.Required
    private BigDecimal amount;

    @Constraints.Required
    private Season season;

    @Constraints.Required
    private String notes;

    @Constraints.Required
    private User collectedBy; // TODO Make sure they are admin?


    @Column(insertable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn;
    // TODO Createon should auto generate
}