package models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import play.data.validation.Constraints.Max;
import play.data.validation.Constraints.Min;
import play.data.validation.Constraints.Required;

@Entity
public class TeamRank
{
    // TODO should we do week/season or gameid?
    @Id
    private Integer id;

    @Required
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "abrv")
    private Team team;

    @Required
    @Min(0)
    @Max(32)
    private Integer rushOffense;

    @Required
    @Min(0)
    @Max(32)
    private Integer passOffense;

    @Required
    @Min(0)
    @Max(32)
    private Integer rushDefense;

    @Required
    @Min(0)
    @Max(32)
    private Integer passDefense;


}
