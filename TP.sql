#unificar tabla de totales#

select a.anio,
sum(a.total_cabezas_bov) as total_bovinos, 
sum(b.total_cabezas) as total_bov_tambo, 
sum(c.total_cabezas_cap) as total_caprinos, 
sum(d.total_cabezas_eq) as total_equinos,
sum(e.total_cabezas_ov) as total_ovinos, 
sum(f.total_cabezas_porc) as total_porcinos
from bovinos a
   join bov_tambo b
   on a.id_bov=b.id and a.anio=b.anio
   join caprinos c
   on a.id_bov=c.id_cap and a.anio=c.anio
   join equinos d
   on a.id_bov=d.id_eq and a.anio=d.anio
   join ovinos e
   on a.id_bov=e.id_ov and a.anio=e.anio
   join porcinos f
   on a.id_bov=f.id_porc and a.anio=f.anio
group by a.anio

#Bovinos total por categoria anio y provincia#

SELECT anio, provincia,total_bovinos, total_vacas, total_vaquillonas, total_novillos, total_novillitos, total_terneros,
total_terneras,total_toros,total_toritos, total_bueyes
FROM
(select anio, provincia,
SUM(coalesce(vacas,0)+coalesce(vaquillonas,0)+coalesce(novillos,0)+coalesce(novillitos,0)+coalesce(terneros,0)+coalesce(terneras,0)+coalesce(toros,0)+coalesce(toritos,0)+coalesce(bueyes,0)) as total_bovinos,
SUM(coalesce(vacas,0)) as total_vacas,
SUM(coalesce(vaquillonas,0)) as total_vaquillonas,
SUM(coalesce(novillos,0)) as total_novillos,
SUM(coalesce(novillitos,0)) as total_novillitos,
SUM(coalesce(terneros,0)) as total_terneros,
SUM(coalesce(terneras,0)) as total_terneras,
SUM(coalesce(toros,0)) as total_toros,
SUM(coalesce(toritos,0)) as total_toritos,
SUM(coalesce(bueyes,0)) as total_bueyes
from bovinos
group by anio,provincia)
order by anio,provincia

#Bovinos total por categoria y por anio#

SELECT anio, total, total_vacas, total_vaquillonas, total_novillos, total_novillitos, total_terneros,
total_terneras,total_toros,total_toritos, total_bueyes
FROM
(select anio,
SUM(coalesce(vacas,0)+coalesce(vaquillonas,0)+coalesce(novillos,0)+coalesce(novillitos,0)+coalesce(terneros,0)+coalesce(terneras,0)+coalesce(toros,0)+coalesce(toritos,0)+coalesce(bueyes,0)) as total,
SUM(coalesce(vacas,0)) as total_vacas,
SUM(coalesce(vaquillonas,0)) as total_vaquillonas,
SUM(coalesce(novillos,0)) as total_novillos,
SUM(coalesce(novillitos,0)) as total_novillitos,
SUM(coalesce(terneros,0)) as total_terneros,
SUM(coalesce(terneras,0)) as total_terneras,
SUM(coalesce(toros,0)) as total_toros,
SUM(coalesce(toritos,0)) as total_toritos,
SUM(coalesce(bueyes,0)) as total_bueyes
from bovinos
group by anio)
order by anio

#Estadisticos Bovinos#

select anio,
sum((total_cabezas_bov)) as total_bov,
round(count(total_cabezas_bov)) as observaciones_bov,
round(avg(total_cabezas_bov)) as promedio_bov,
max(total_cabezas_bov) as maximo_bov, 
min(total_cabezas_bov) as minimo_bov,
cast(variance(total_cabezas_bov) as dec(14,2)) as varianza_bov,
cast(stddev(total_cabezas_bov) as dec(14,2)) as desvio_bov
from bovinos
group by anio
order by anio


#Bovinos tambo total por categoria anio y provincia#

SELECT anio, provincia,total, total_vacas, total_vaquillonas, total_nov_tambo, total_novillitos, total_terneros,
total_terneras,total_toros,total_toritos, total_bueyes
FROM
(select anio, provincia,
SUM(coalesce(vacas,0)+coalesce(vaquillonas,0)+coalesce(novillos,0)+coalesce(novillitos,0)+coalesce(terneros,0)+coalesce(terneras,0)+coalesce(toros,0)+coalesce(toritos,0)+coalesce(bueyes,0)) as total,
SUM(coalesce(vacas,0)) as total_vacas,
SUM(coalesce(vaquillonas,0)) as total_vaquillonas,
SUM(coalesce(novillos,0)) as total_nov_tambo,
SUM(coalesce(novillitos,0)) as total_novillitos,
SUM(coalesce(terneros,0)) as total_terneros,
SUM(coalesce(terneras,0)) as total_terneras,
SUM(coalesce(toros,0)) as total_toros,
SUM(coalesce(toritos,0)) as total_toritos,
SUM(coalesce(bueyes,0)) as total_bueyes
from bov_tambo
group by anio,provincia)
order by anio,provincia

#Bovinos tambo total por categoria y por anio#

SELECT anio,total, total_vacas, total_vaquillonas, total_nov_tambo, total_novillitos, total_terneros,
total_terneras,total_toros,total_toritos, total_bueyes
FROM
(select anio,
SUM(coalesce(vacas,0)+coalesce(vaquillonas,0)+coalesce(novillos,0)+coalesce(novillitos,0)+coalesce(terneros,0)+coalesce(terneras,0)+coalesce(toros,0)+coalesce(toritos,0)+coalesce(bueyes,0)) as total,
SUM(coalesce(vacas,0)) as total_vacas,
SUM(coalesce(vaquillonas,0)) as total_vaquillonas,
SUM(coalesce(novillos,0)) as total_nov_tambo,
SUM(coalesce(novillitos,0)) as total_novillitos,
SUM(coalesce(terneros,0)) as total_terneros,
SUM(coalesce(terneras,0)) as total_terneras,
SUM(coalesce(toros,0)) as total_toros,
SUM(coalesce(toritos,0)) as total_toritos,
SUM(coalesce(bueyes,0)) as total_bueyes
from bov_tambo
group by anio)
order by anio

#Estadisticos Bovinos tambo#

select anio,
sum(total_cabezas) as total_bov_tambo,
round(count(total_cabezas)) as observaciones_bov_tambo,
round(avg(total_cabezas)) as promedio_bov_tambo,
max(total_cabezas) as maximo_bov_tambo, 
min(total_cabezas) as minimo_bov_tambo,
cast(variance(total_cabezas) as dec(14,2))as varianza_bov_tambo,
cast(stddev(total_cabezas) as dec(14,2))as desvio_bov_tambo
from bov_tambo 
group by anio
order by anio


#Caprinos total por categoria anio y provincia#

SELECT anio, provincia,total, total_chivos, total_cabras, total_cabritos, total_capones, total_cabrillas_chivitos
FROM
(select anio, provincia,
SUM(coalesce(chivos,0)+coalesce(cabras,0)+coalesce(cabritos,0)+coalesce(capones,0)+coalesce(cabrillas_chivitos,0)) as total,
SUM(coalesce(chivos,0)) as total_chivos,
SUM(coalesce(cabras,0)) as total_cabras,
SUM(coalesce(cabritos,0)) as total_cabritos,
SUM(coalesce(capones,0)) as total_capones,
SUM(coalesce(cabrillas_chivitos,0)) as total_cabrillas_chivitos
from caprinos
group by anio,provincia)
order by anio,provincia

#Caprinos total por categoria y por anio#
SELECT anio,total, total_chivos, total_cabras, total_cabritos, total_capones, total_cabrillas_chivitos
FROM
(select anio,
SUM(coalesce(chivos,0)+coalesce(cabras,0)+coalesce(cabritos,0)+coalesce(capones,0)+coalesce(cabrillas_chivitos,0)) as total,
SUM(coalesce(chivos,0)) as total_chivos,
SUM(coalesce(cabras,0)) as total_cabras,
SUM(coalesce(cabritos,0)) as total_cabritos,
SUM(coalesce(capones,0)) as total_capones,
SUM(coalesce(cabrillas_chivitos,0)) as total_cabrillas_chivitos
from caprinos
group by anio)
order by anio

#Estadisticos Caprinos#

select anio,
sum(total_cabezas_cap) as total_cap,
round(avg(total_cabezas_cap)) as promedio_cap,
max(total_cabezas_cap) as maximo_cap, 
min(total_cabezas_cap) as minimo_cap,
cast(variance(total_cabezas_cap) as dec(14,2))as varianza_cap,
cast(stddev(total_cabezas_cap)as dec(14,2)) as desvio_cap
from caprinos
group by anio
order by anio

#Equinos total por categoria anio y provincia#

SELECT anio, provincia,total, total_padrillos, total_caballos, total_yeguas, total_potrillos_potrillas, total_mulas, total_burros_asnos
FROM
(select anio, provincia,
SUM(coalesce(padrillos,0)+coalesce(caballos,0)+coalesce(yeguas,0)+coalesce(potrillos_potrillas,0)+coalesce(mulas,0)+coalesce(burros_asnos,0)) as total,
SUM(coalesce(padrillos,0)) as total_padrillos,
SUM(coalesce(caballos,0)) as total_caballos,
SUM(coalesce(yeguas,0)) as total_yeguas,
SUM(coalesce(potrillos_potrillas,0)) as total_potrillos_potrillas,
SUM(coalesce(mulas,0)) as total_mulas,
SUM(coalesce(burros_asnos,0)) as total_burros_asnos
from equinos
group by anio,provincia)
order by anio,provincia

#Equinos total por categoria y por anio#

SELECT anio, total, total_padrillos, total_caballos, total_yeguas, total_potrillos_potrillas, total_mulas, total_burros_asnos
FROM
(select anio, 
SUM(coalesce(padrillos,0)+coalesce(caballos,0)+coalesce(yeguas,0)+coalesce(potrillos_potrillas,0)+coalesce(mulas,0)+coalesce(burros_asnos,0)) as total,
SUM(coalesce(padrillos,0)) as total_padrillos,
SUM(coalesce(caballos,0)) as total_caballos,
SUM(coalesce(yeguas,0)) as total_yeguas,
SUM(coalesce(potrillos_potrillas,0)) as total_potrillos_potrillas,
SUM(coalesce(mulas,0)) as total_mulas,
SUM(coalesce(burros_asnos,0)) as total_burros_asnos
from equinos
group by anio)
order by anio

#Estadisticos Equinos#

select anio,
sum(total_cabezas_eq) as total_eq,
round(avg(total_cabezas_eq)) as promedio_eq,
max(total_cabezas_eq) as maximo_eq, 
min(total_cabezas_eq) as minimo_eq,
cast(variance(total_cabezas_eq) as dec(14,2)) as varianza_eq,
cast(stddev(total_cabezas_eq)as dec(14,2)) as desvio_eq
from equinos
group by anio
order by anio

#Ovinos total por categoria anio y provincia#

SELECT anio, provincia,total, total_carneros, total_ovejas, total_borregos, total_capones, total_corderos_corderas
FROM
(select anio, provincia,
SUM(coalesce(carneros,0)+coalesce(ovejas,0)+coalesce(borregos,0)+coalesce(capones,0)+coalesce(corderos_corderas,0)) as total,
SUM(coalesce(carneros,0)) as total_carneros,
SUM(coalesce(ovejas,0)) as total_ovejas,
SUM(coalesce(borregos,0)) as total_borregos,
SUM(coalesce(capones,0)) as total_capones,
SUM(coalesce(corderos_corderas,0)) as total_corderos_corderas
from ovinos
group by anio,provincia)
order by anio,provincia

#Ovinos total por categoria y por anio#

SELECT anio, total, total_carneros, total_ovejas, total_borregos, total_capones, total_corderos_corderas
FROM
(select anio,
SUM(coalesce(carneros,0)+coalesce(ovejas,0)+coalesce(borregos,0)+coalesce(capones,0)+coalesce(corderos_corderas,0)) as total,
SUM(coalesce(carneros,0)) as total_carneros,
SUM(coalesce(ovejas,0)) as total_ovejas,
SUM(coalesce(borregos,0)) as total_borregos,
SUM(coalesce(capones,0)) as total_capones,
SUM(coalesce(corderos_corderas,0)) as total_corderos_corderas
from ovinos
group by anio)
order by anio

#Estadisticos Ovinos#

select anio,
sum(total_cabezas_ov) as total_ov,
round(avg(total_cabezas_ov)) as promedio_ov,
max(total_cabezas_ov) as maximo_ov, 
min(total_cabezas_ov) as minimo_ov,
cast(variance(total_cabezas_ov) as dec(14,2))as varianza_ov,
cast(stddev(total_cabezas_ov) as dec(14,2)) as desvio_ov
from ovinos
group by anio
order by anio

#Porcinos total por categoria anio y provincia#

SELECT anio, provincia,total, total_padrillos, total_cerda, total_lechon, total_capones, total_cachorros, total_machos_enteros_inmunocastrados
FROM
(select anio, provincia,
SUM(coalesce(padrillos,0)+coalesce(cerda,0)+coalesce(lechon,0)+coalesce(capones,0)+coalesce(cachorros,0)+coalesce(machos_enteros_inmunocastrados,0)) as total,
SUM(coalesce(padrillos,0)) as total_padrillos,
SUM(coalesce(cerda,0)) as total_cerda,
SUM(coalesce(lechon,0)) as total_lechon,
SUM(coalesce(capones,0)) as total_capones,
SUM(coalesce(cachorros,0)) as total_cachorros,
SUM(coalesce(machos_enteros_inmunocastrados,0)) as total_machos_enteros_inmunocastrados
from porcinos
group by anio,provincia)
order by anio,provincia

#Porcinos total por categoria y por anio#

(SELECT anio,total, total_padrillos, total_cerda, total_lechon, total_capones, total_cachorros, total_machos_enteros_inmunocastrados
FROM
(select anio,
SUM(coalesce(padrillos,0)+coalesce(cerda,0)+coalesce(lechon,0)+coalesce(capones,0)+coalesce(cachorros,0)+coalesce(machos_enteros_inmunocastrados,0)) as total,
SUM(coalesce(padrillos,0)) as total_padrillos,
SUM(coalesce(cerda,0)) as total_cerda,
SUM(coalesce(lechon,0)) as total_lechon,
SUM(coalesce(capones,0)) as total_capones,
SUM(coalesce(cachorros,0)) as total_cachorros,
SUM(coalesce(machos_enteros_inmunocastrados,0)) as total_machos_enteros_inmunocastrados
from porcinos
group by anio)
order by anio)

#Estadisticos Porcinos#

select anio,
sum(total_cabezas_porc) as total_porc,
round(avg(total_cabezas_porc)) as promedio_porc,
max(total_cabezas_porc) as maximo_porc, 
min(total_cabezas_porc) as minimo_porc,
cast(variance(total_cabezas_porc) as dec(14,2))as varianza_porc,
cast(stddev(total_cabezas_porc) as dec(14,2)) as desvio_porc
from porcinos
group by anio
order by anio
