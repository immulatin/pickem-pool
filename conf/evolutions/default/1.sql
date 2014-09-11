# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table game (
  id                        integer auto_increment not null,
  week_id                   integer,
  away_abrv                 varchar(3),
  home_abrv                 varchar(3),
  winner_abrv               varchar(3),
  kickoff                   datetime,
  time_left                 integer,
  tie                       tinyint(1) default 0,
  constraint pk_game primary key (id))
;

create table payment (
  payment_id                integer auto_increment not null,
  amount                    decimal(38),
  notes                     varchar(255),
  created_on                datetime,
  constraint pk_payment primary key (payment_id))
;

create table payout (
  payment_id                integer auto_increment not null,
  amount                    decimal(38),
  notes                     varchar(255),
  created_on                datetime,
  constraint pk_payout primary key (payment_id))
;

create table pick (
  id                        integer auto_increment not null,
  winner_abrv               varchar(3),
  created_on                date,
  constraint pk_pick primary key (id))
;

create table score (
  id                        integer auto_increment not null,
  team_abrv                 varchar(3),
  game_id                   integer,
  score                     integer,
  possession                tinyint(1) default 0,
  redzone                   tinyint(1) default 0,
  spread                    decimal(2),
  constraint pk_score primary key (id))
;

create table season (
  season                    integer auto_increment not null,
  constraint pk_season primary key (season))
;

create table team (
  abrv                      varchar(3) not null,
  name                      varchar(50),
  shortname                 varchar(30),
  jokename                  varchar(30),
  wins                      integer,
  losses                    integer,
  constraint pk_team primary key (abrv))
;

create table team_rank (
  id                        integer auto_increment not null,
  rush_offense              integer,
  pass_offense              integer,
  rush_defense              integer,
  pass_defense              integer,
  constraint pk_team_rank primary key (id))
;

create table user (
  id                        bigint auto_increment not null,
  name                      varchar(100),
  email                     varchar(255),
  finalize                  tinyint(1) default 0,
  is_admin                  tinyint(1) default 0,
  created_on                datetime,
  last_login                datetime,
  constraint pk_user primary key (id))
;

create table week (
  id                        integer auto_increment not null,
  week                      integer,
  season_season             integer,
  constraint pk_week primary key (id))
;

create table winner (
  id                        integer auto_increment not null,
  place                     integer,
  payout                    float,
  week_id                   integer,
  constraint pk_winner primary key (id))
;

alter table game add constraint fk_game_week_1 foreign key (week_id) references week (id) on delete restrict on update restrict;
create index ix_game_week_1 on game (week_id);
alter table game add constraint fk_game_away_2 foreign key (away_abrv) references team (abrv) on delete restrict on update restrict;
create index ix_game_away_2 on game (away_abrv);
alter table game add constraint fk_game_home_3 foreign key (home_abrv) references team (abrv) on delete restrict on update restrict;
create index ix_game_home_3 on game (home_abrv);
alter table game add constraint fk_game_winner_4 foreign key (winner_abrv) references team (abrv) on delete restrict on update restrict;
create index ix_game_winner_4 on game (winner_abrv);
alter table pick add constraint fk_pick_winner_5 foreign key (winner_abrv) references team (abrv) on delete restrict on update restrict;
create index ix_pick_winner_5 on pick (winner_abrv);
alter table score add constraint fk_score_team_6 foreign key (team_abrv) references team (abrv) on delete restrict on update restrict;
create index ix_score_team_6 on score (team_abrv);
alter table score add constraint fk_score_game_7 foreign key (game_id) references game (id) on delete restrict on update restrict;
create index ix_score_game_7 on score (game_id);
alter table week add constraint fk_week_season_8 foreign key (season_season) references season (season) on delete restrict on update restrict;
create index ix_week_season_8 on week (season_season);
alter table winner add constraint fk_winner_week_9 foreign key (week_id) references week (id) on delete restrict on update restrict;
create index ix_winner_week_9 on winner (week_id);



# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table game;

drop table payment;

drop table payout;

drop table pick;

drop table score;

drop table season;

drop table team;

drop table team_rank;

drop table user;

drop table week;

drop table winner;

SET FOREIGN_KEY_CHECKS=1;

