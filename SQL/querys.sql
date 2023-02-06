

-- 1. Cantidad de veces que un actor ha hecho una categoria de pelicula

select first_name , last_name, name, count(*)

from actors as a
left join actorsfilms as af
on a.actor_id=af.actor_id
left join films as f
on f.film_id=af.film_id
left join categorysfilms as cf
on cf.film_id=f.film_id
left join categorys as c
on cf.category_id=c.category_id

group by first_name, last_name, name
;

-- 2. Cantidad de peliculas que tenemos de cada una en inventario

select title, count(*) as inventory_films

from films as f
left join inventory as i
on f.film_id=i.film_id

group by title

;

-- 3. Categoria de pelicula con mas frecuencia

select name, count(name)
from categorys as c
left join categorysfilms as cf
on cf.category_id = c.category_id
left join films as f
on f.film_id = cf.film_id
group by name
order by count(name) desc
limit 1
;

-- 4. Duracion de media de la categoria animation, la que tiene mas frecuencia.

select name, avg(length) as duración_media
from categorys as c
left join categorysfilms as cf
on c.category_id = cf.category_id 
left join films as f
on f.film_id = cf.film_id
where name = "animation"
;

-- 5. La actriz que sale en mas peliculas, y las veces  

select a.actor_id as Actor_id, first_name, last_name, count(*)
from actors as a
left join actorsfilms as af
on a.actor_id=af.actor_id
left join films as f
on f.film_id=af.film_id

group by Actor_id, first_name, last_name
order by count(*) desc 
limit 1;


-- 6.En que tipo de generos suele salir la actriz mas de moda y cuantas veces en cada una.

select a.actor_id as Actor_id, first_name, last_name, name, count(name) as frecuencia_peliculas
from actors as a
left join actorsfilms as af
on a.actor_id=af.actor_id
left join films as f
on f.film_id=af.film_id
left join categorysfilms as cf
on cf.film_id=f.film_id
left join categorys as c
on cf.category_id=c.category_id
where a.actor_id=23

group by name, first_name, last_name, Actor_id
order by count(name) desc
;

-- 7. las peliculas entre cierto rango de coste de reemplazamiento y las pelicuas que mas cuestan reemplazar

select title, replacement_cost
from films
where replacement_cost < 25 and replacement_cost > 20
order by replacement_cost asc

;

select title, replacement_cost
from films
where replacement_cost=(select  max(replacement_cost) from films)
;

-- 8. Las peliculas que no estén italiano y esten dentro del género G.

select rating, title, l.name
from films as f
left join language as l
on f.language_id = l.language_id
where l.name != "Italian" and f.rating = "G"
;
