package models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.sql.Date;

import play.data.validation.Constraints.Required;


@Entity
public class Pick
{

    @Id
    private Integer id;

    @Required
    private User user;

    @Required
    private Game game;

    @Required
    @ManyToOne
    private Team winner;

    @Required
    private Date createdOn;
}
