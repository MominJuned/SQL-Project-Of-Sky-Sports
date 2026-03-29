create database sky_sports;

show database;


use sky_sports;
#1
select * from sky1;

#2
select distinct(team)
from sky1; 

#3
select team 
from sky1 
where `rank`=1 and `group`=7;

#4
select count(team) 
from sky1;

#5
select team, matches_played 
from sky1;

#6
select team, 100.0*(wins/matches_played) as wins_percent 
from sky1;

#7
SELECT team, goals_scored 
FROM sky1
WHERE goals_scored = (SELECT MAX(goals_scored) from sky1);

#8
select team, round(100.0*(draws/matches_played), 2) 
from sky1;

#9
SELECT team, goals_scored 
FROM sky1 
WHERE goals_scored = (SELECT min(goals_scored) FROM sky1);

#10Write a SQL query to show percent of losses with respect to matches_played by each team in ascending order by losses and name the resulting column as losses_percent
select team,100.0*(losses/matches_played) as losses_percent
from sky1 order by losses_percent;

#11. Write a SQL query to show the average goal_difference
select avg(goal_difference)
from sky1;

#12. Write a SQL query to show name of the team where points are 0
select team points
from sky1 where points = 0;

#13 Write a SQL query to show all data where expected_goal_scored is less than exp_goal_conceded
select * from sky1
where expected_goal_scored < exp_goal_conceded;

#14. Write a SQL query to show data where exp_goal_difference is in between -0.5 and 0.5
select * from sky1 
where exp_goal_difference between -0.5 and 0.5;

#15. Write a SQL query to show all data in ascending order by exp_goal_difference_per_90 
select * from sky1 
order by exp_goal_difference_per_90 asc; 

#16. Write a SQL query to show team which has maximum number of players_used
select team, players_used 
from sky2 
where players_used = (SELECT max(players_used) FROM sky2);

#17. Write a SQL query to show each team name and avg_age in ascending order by avg_age
select team, avg_age 
from sky2 
order by avg_age;

#18. WRITE a sql query to show average possession of teams
select avg(possession) 
from sky2;

#19. Write a SQL query to show team which has played atleast 5 games
select team, games 
from sky2 
where games>=5;

#20. Write a SQL query to show all data for which minutes is greater than 600
select * 
from sky2 
where minutes>600;

#20. Write a SQL query to show team, goals, assists in ascending order by goals
select team, goals, assists 
from sky2 
order by goals;

#21. Write a SQL query to show team, pens_made, pens_att in descending order by pens_made
select team, pens_made, pens_att
from sky2 
order by pens_made desc;

#22. Write a SQL query to show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow
select team, cards_yellow, cards_red
from sky2
where cards_red = 1
order by cards_yellow;

#23. Write a SQL query to show team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90
select team, goals_per90, assists_per90, goals_assists_per90
from sky2
order by goals_assists_per90 desc;

#24. Write a SQL query to show team, goals_pens_per90, goals_assists_pens_per90 in ascending order by goals_assists_pens_per90
select team, goals_pens_per90, goals_assists_per90
from sky2
order by goals_assists_pens_per90;

#25. Write a SQL query to show team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct 
#is less than 30 in ascending order by shots_on_target_pct

select team, shots, shots_on_target, shots_on_target_pct
from sky2
where shots_on_target_pct<30
order by shots_on_target_pct;


#26. Write a SQL query to show team, shots_per90, shots_on_target_per90 for team Belgium
select team, shots_per90, shots_on_target_per90
from sky2
where team= 'belgium';


#27. Write a SQL query to show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance
select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance
from sky2 
order by average_shot_distance desc;

#28. Write a SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500
select team, errors, touches
from sky2
where errors = 0 and touches < 1500;

#29. Write a SQL query to show team, fouls which has maximum number of fouls
select team, fouls
from sky2
where fouls=(select max(fouls) from sky2);

#30. Write a SQL query to show team, offisdes which has offsides less than 10 or greater than 20
select team, offsides < 10 or offsides > 20
from sky2;

#31. Write a SQL query to show team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct
select team, aerials_won, aerials_lost, aerials_won_pct
from sky2 
order by aerials_won_pct;

select * from sky1;
#32. WRITE a sql query to show number of teams each group has
select matches_played, count(team)
from sky1
group by matches_played;

select team, count(team)
from sky1
group by team;

#33. Write a SQL query to show team names group 6 has
select team, column1
from sky1
where column1 = 6;

select team, goal_difference
from sky1
where goal_difference = 6;

#34. Write a SQL query to show Australia belongs to which group
select team, wins
from sky1 
where team = 'Australia';

#35. Write a SQL query to show group, average wins by each group
select wins, avg(wins)
from sky1
group by wins;

select matches_played, avg(wins)
from sky1
group by matches_played;

select losses, avg(wins)
from sky1
group by losses;

#36. Write a SQL query to show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored
select gs.`losses`, max(gs.expected_goal_scored) as max_exp_goal_scored 
from sky1 gs 
group by gs.`losses` 
order by max_exp_goal_scored;

select gs.`goals_against`, max(gs.expected_goal_scored) as max_exp_goal_scored 
from sky1 gs 
group by gs.`goals_against` 
order by max_exp_goal_scored;

#37. Write a SQL query to show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded
select gs.`team`, min(gs.exp_goal_conceded) as min_exp_goal_conceded 
from sky1 gs 
group by gs.`team` 
order by min_exp_goal_conceded desc;
select * from sky1;

#38. Write a SQL query to show group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90
select gs.goals_against,
avg(gs.exp_goal_difference_per_90) as avg_exp_goal_diff_per_90
from sky1 gs
group by gs.goals_against
order by avg_exp_goal_diff_per_90;

select gs.wins,
avg(gs.exp_goal_difference_per_90) as avg_exp_goal_diff_per_90
from sky1 gs
group by gs.wins
order by avg_exp_goal_diff_per_90;

select gs.draws,
avg(gs.exp_goal_difference_per_90) as avg_exp_goal_diff_per_90
from sky1 gs
group by gs.draws
order by avg_exp_goal_diff_per_90;

select gs.wins,
avg(gs.exp_goal_difference_per_90) as avg_exp_goal_diff_per_90
from sky1 gs
group by gs.wins
order by avg_exp_goal_diff_per_90;

#39. WRITE a query to show which team has equal number of goals_scored and goals_against
select team, goals_scored, goals_against
from sky1 
where goals_scored = goals_against;

#40. WRITE a query to show which team has maximum players_used
select team, players_used 
from sky2 
where players_used=(select max(players_used) from sky2);

#41. WRITE a query to show team, players_used, avg_age, games, minutes  where minutes less than 500 and greater than 200
select team, players_used, avg_age, games, minutes 
from sky2 
where minutes < 500 and minutes > 200;

#42. WRITE a query to show all data of group_stage_team_stats in ascending order BY points
select *
from sky1 
order by points;

select * from sky2; 
#43. WRITE a query to show ALL UNIQUE team in ascending order by team
select distinct(team) 
from sky2 
order by team;

#45. WRITE a query to show sum of fouls for each group and arrange it in ascending order by fouls.
select gs.games, sum(td.fouls) as sum_fouls 
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.games 
order by sum_fouls;

select gs.minutes, sum(td.fouls) as sum_fouls 
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.minutes 
order by sum_fouls;

select gs.goals, sum(td.fouls) as sum_fouls 
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.goals 
order by sum_fouls;

#46. WRITE a query to show total number of games for each group and arrange it in descending order by games.
select gs.games, sum(td.games) as sum_games 
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.games 
order by sum_games desc; 
 
select * from sky1;
select * from sky2;
select gs.team, sum(td.games) as sum_games 
from sky2 td left join sky1 gs 
on td.team=gs.team
group by gs.team 
order by sum_games desc;

select * from sky1;
select * from sky2;
#47. WRITE a query to show total number of players_used for each group and arrange it in ascending order by players_used.
select gs.wins, sum(td.players_used) as sum_players_used 
from sky2 td join sky1 gs
on td.team=gs.team
group by gs.wins
order by sum_players_used;


#48. WRITE a query to show total number of offsides for each group and arrange it in ascending order by offsides.
select gs.team, sum(td.offsides) as sum_offsides 
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.team 
order by sum_offsides;

#49. WRITE a query to show average passes_pct for each group and arrange it in descending order by passes_pct.
select gs.team, avg(td.passes_pct) as avg_passes_pct
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.team 
order by avg_passes_pct desc;

select *
from sky1 join sky2 
on sky1.team = sky2.team;

#50. WRITE a query to show average goals_per90 for each group and arrange it in ascending order by goals_per90.
select gs.team, avg(td.goals_per90) as avg_goals_per90
from sky2 td inner join sky1 gs 
on td.team=gs.team
group by gs.team
order by avg_goals_per90;




















