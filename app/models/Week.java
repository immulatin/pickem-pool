package models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import play.data.validation.Constraints.Required;


@Entity
public class Week
{
    @Id
    private Integer id;

    @Required
    private Integer week;

    @Required
    @ManyToOne(cascade = CascadeType.ALL)
    private Season season;
}
