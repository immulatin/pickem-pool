package models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import play.data.validation.Constraints.Max;
import play.data.validation.Constraints.Min;
import play.data.validation.Constraints.Required;

@Entity
public class Winner
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Required
    private User user;

    @Required
    @Min(1)
    @Max(4)
    private Integer place;

    @Required
    private Float payout;

    @Required
    @ManyToOne()
    private Week week;
}
