create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');
with cte as
(
select Team_1 as team_name,case when Team_1=Winner then 1 else 0 end as win_flag  from icc_world_cup
union all
select Team_2 as team_name,case when Team_2=Winner then 1 else 0 end as win_flag  from icc_world_cup
    )
    select team_name,count(1) as number_of_matchesplayed, SUM(win_flag) as number_of_matcheswon,count(1)-SUM(win_flag) number_of_matchesLloss from cte
    group by team_name
    order by number_of_matcheswon desc
    ;
output
TEAM_NAME	NUMBER_OF_MATCHESPLAYED	NUMBER_OF_MATCHESWON	NUMBER_OF_MATCHESLLOSS
India	2	2	0
Eng	2	1	1
Aus	2	1	1
NZ	1	1	0
SL	2	0	2
SA	1	0	1

