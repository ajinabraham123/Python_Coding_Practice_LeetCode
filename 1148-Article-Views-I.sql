# Write your MySQL query statement below
with author as
(
    select article_id, author_id, COUNT(viewer_id) as v_id from views
    where author_id = viewer_id
    group by article_id,author_id
)
select views.author_id as id from views
JOIN author on views.author_id = author.author_id where v_id>=1
group by id
order by id asc
