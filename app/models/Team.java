package models;

import javax.persistence.*;

import play.data.validation.Constraints.*;

@Entity
public class Team
{
    @Id
    @Required
    @Column(length = 3, updatable = false)
    private String abrv;

    @Required
    @Column(length = 50, updatable = false)
    private String name;

    @Required
    @Column(length = 30)
    private String shortname;

    @Required
    @Column(length = 30)
    private String jokename;

    @Required
    @Min(0)
    @Max(18)
    private int wins;

    @Required
    @Min(0)
    @Max(18)
    private int losses;

}
