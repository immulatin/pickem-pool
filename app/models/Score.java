package models;

import javax.persistence.*;
import javax.validation.Valid;

import java.math.BigDecimal;

import play.data.validation.Constraints.*;

@Entity
public class Score
{
    @Id
    private Integer id;

    @Valid
    @Required
    @ManyToOne(cascade = CascadeType.ALL)
    private Team team;

    @Required
    @ManyToOne
    private Game game;

    @Min(0)
    @Max(100)
    private Integer score = 0;

    @Required
    private boolean possession = false;

    @Required
    private boolean redzone = false;

    @Column(precision = 2)
    private BigDecimal spread;
}
