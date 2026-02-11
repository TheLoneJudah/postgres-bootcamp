--Problem 1: Latest Performance Snapshot per Movie
select distinct on (m.title)
m.title as movie_title,
s.end_date as latest_end_date,
s.views,
s.hours_viewed
from view_summary as s
join movie as m on s.movie_id = m.id
order by m.title,s.end_date desc;

--Problem 2: Most Recent Season Performance per TV Show
select distinct on (t.title)
t.title as tv_show_title,
s.season_number,
v.end_date,
v.views
from view_summary as v
join season as s on s.id = v.season_id
join tv_show as t on s.tv_show_id = t.id
order by t.title, end_date desc;

--Problem 3: Movies That Have Viewing Data
select
m.title,
m.release_date,
v.views,
v.hours_viewed
from view_summary as v
inner join movie as m on m.id = v.movie_id
order by m.title;

--Problem 4: Seasons with Recorded Viewership
select
t.title as tv_show_title,
s.season_number,
v.views,
v.hours_viewed
from view_summary as v
inner join season as s on v.season_id = s.id
inner join tv_show as t on t.id = s.tv_show_id
order by tv_show_title;

--Problem 5: Movies Without Any Viewership
select
m.title,
m.release_date,
v.views
from movie as m
left join view_summary as v on v.movie_id = m.id
order by v.views asc, m.release_date asc;

--Problem 6: TV Shows and Their Seasons (Even If Unwatched)
select 
t.title as tv_show,
s.season_number,
v.views
from tv_show as t
inner join season as s on t.id = s.tv_show_id
left join view_summary as v on s.id = v.season_id
order by tv_show;

--Problem 7: Viewing Records Without Movie Metadata
select
v.id as view_summary_id,
m.id as movie_id,
v.views
from view_summary as v
left join movie as m on m.id = v.movie_id
where m.id is null;

--Problem 8: Content Coverage Audit
select
m.title as movie_title,
v.views,
v.start_date,
v.end_date
from movie as m
full join view_summary as v on v.movie_id = m.id
order by m.title;

--Problem 9: Movies That Have NEVER Been Viewed
select
v.id as view_summary_id,
m.id as movie_id,
v.views
from movie as m
left join view_summary as v on m.id = v.movie_id
where v.views = 0;

--Problem 10: Seasons Without Any View Records
select 
ts.title,
s.season_number,
s.release_date,
v.views
from season as s
inner join tv_show as ts on ts.id = s.tv_show_id
left join view_summary as v on v.season_id = s.id
where v.views is null;

--Problem 11: View Records Without Valid Seasons
select
ts.title,
s.title,
s.season_number,
v.season_id,
v.views
from view_summary as v
left join season as s on v.season_id = s.id
left join tv_show as ts on ts.id = s.tv_show_id
where s.id is null;

--Problem 12: Data Integrity Check
select
m.title,
v.views,
v.hours_viewed,
v.id as view_summary_id,
m.id as movie_id,
v.views
from view_summary as v
full join movie as m on v.movie_id = m.id
where m.id is null or v.movie_id is null;

--Problem 13: Weekly Performance Report for TV Shows
select
ts.title as tv_show_title,
s.season_number,
v.start_date,
v.end_date,
v.views,
v.hours_viewed,
v.view_rank
from view_summary as v
join season as s on s.id = v.season_id
join tv_show as ts on ts.id = s.tv_show_id
where v.duration like '%WEEKLY%' OR v.duration like 'WEEKLY'
order by v.start_date desc, v.view_rank asc;

--Problem 14: Global Availability vs Performance
select
m.title,
m.available_globally,
v.views,
v.hours_viewed
from movie as m
inner join view_summary as v on v.movie_id = m.id
where m.available_globally is not null
order by m.available_globally, m.title;

--Problem 15: Top-Performing Content by Locale
select distinct on (ts.locale, m.locale)
m.title as movie_title,
ts.title as show_title,
s.season_number,
m.locale,
ts.locale,
v.view_rank
from movie as m
full join view_summary as v on m.id = v.movie_id
full join season as s on s.id = v.season_id
full join tv_show as ts on s.tv_show_id = ts.id
where ts.locale is not null or m.locale is not null
order by ts.locale , m.locale, v.view_rank asc;





























