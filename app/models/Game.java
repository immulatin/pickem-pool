package models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import java.sql.Timestamp;

import play.data.validation.Constraints.*;

@Entity
public class Game
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Required
    @ManyToOne(cascade = CascadeType.DETACH)
    private Week week;

    @Required
    @ManyToOne()
    private Team away;

    @Required
    @ManyToOne()
    private Team home;

    @Required
    @ManyToOne()
    private Team winner;

    @Required
    private Timestamp kickoff;

    @Required
    @Min(0)
    @Max(3600)
    private Integer timeLeft;

    @Required
    private boolean tie = false;
}
