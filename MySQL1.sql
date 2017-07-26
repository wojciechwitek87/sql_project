create database mojasql;
use mojasql; 
select database();
#.......................................................................................
CREATE TABLE tab1 (
    lp INT,
    imię VARCHAR(15) NOT NULL,
    nazwisko VARCHAR(25) NOT NULL,
    pesel varchar(11) not null
);
select * from tab1; 

describe tab1;
drop table tab1;
alter table tab1 
rename as tab2; 
alter table tab2 change lp liczba_pojedyncza int; 
alter table tab2 modify liczba_pojedyncza varchar(11);
describe tab2; 
alter table tab2 change liczba_pojedyncza lp int; 
describe tab2; 
alter table tab2 add data_ur date; 
describe tab2;
create database ms1; 
use ms1;
drop database ms1; 
create database skoczkowie; 
use skoczkowie; 
CREATE TABLE skocznie (
    id_skoczni INTEGER,
    miasto TEXT,
    kraj_s TEXT,
    nazwa TEXT,
    k INTEGER,
    sedz INTEGER
); 
describe skocznie; 
CREATE TABLE trenerzy (
    kraj TEXT,
    imie_t TEXT,
    nzawisko_t TEXT,
    data_ur_t DATE
); 
CREATE TABLE zawody (
    id_zawody INT,
    id_skoczni INT,
    data DATE
);
describe zawody;
CREATE TABLE kibice (
    imie_k TEXT,
    nazwosko_k TEXT,
    data_ur_k DATE,
    kraj TEXT,
    wzrost INT
);
describe kibice; 
#ms9 
CREATE TABLE skladki (
    id_skladki INT,
    kwota_skladki INT,
    data_skladki DATE,
    id_kibica INT
);
alter table kibice drop column kraj; 
alter table kibice add column pesel text; 
alter table kibice add column kraj varchar(3);
describe kibice; 
CREATE TABLE zawodnicy (
    id_skoczka INT,
    imie TEXT,
    nazwisko TEXT,
    kraj CHARACTER(3),
    data_ur DATE,
    wzrost INT,
    waga INT
); 
insert into skocznie values (1, 'Zakopane', 'POL' , 'Wielka Krokiew', 120, 134); 
insert into skocznie values (2, 'Garmisch-Partenkirchen' , 'GER' , 'Wielka Skocznia Olimpijska' , 115, 125); 
insert into skocznie values (4, 'Oberstdorf' , 'GER' , 'Skocznia Heiniego Klopfera' , 185, 211); 
insert into skocznie values (3, 'Oberstdorf' , 'GER' , 'Grosse Schattenberg' , 120, 123);
insert into skocznie values (5, 'Willingen' , 'GER' , 'Grosse Muhlekopfschanze', 130, 145); 
INSERT INTO skocznie VALUES (6, 'Kuopio', 'FIN', 'Puijo', 120, 131);

INSERT INTO skocznie VALUES (7, 'Lahti', 'FIN', 'Salpausselka', 116, 128);

INSERT INTO skocznie VALUES (8, 'Trondheim', 'NOR', 'Granasen', 120, 132);
select * from zawodnicy;
describe skocznie; 
select * from skocznie; 
select * from kibice; 
insert into kibice (imie_k, nazwosko_k, kraj) values ( 'Jan', 'Kowalski' , 'POL'); 
insert into kibice (imie_k, nazwosko_k, wzrost) values ( 'John', 'Smith' , '172'); 
insert into kibice (imie_k, nazwosko_k, kraj) values ( 'Jan', 'Kowalski' , 'POL'); 
insert into kibice (imie_k, nazwisko_k, data_ur_k) values ('Anna', 'Zawadzka', '1977-12-23'); 
alter table kibice
change nazwosko_k nazwisko_k text; 
create table test (kol1 text, kol2 text, kol3 text);
LOAD DATA LOCAL INFILE '/Users/wojciech/Desktop/Abc.csv' into table test;
select * from test;
#MS17 
alter table trenerzy  change nzawisko_t nazwisko_t text; 
select*from trenerzy where nazwisko_t = 'kuttin' ; 
update kibice set imie_k = 'Krzysztof' where kraj = 'POL'; 
describe kibice; 
select*from kibice;
update kibice set kraj = 'GER' where wzrost >170; 
select*from kibice;
update kibice set kraj = 'AUT'  WHERE wzrost >170 and imie_k='John';
update kibice set kraj = 'AUT' , pesel = '8704508897' WHERE wzrost >170 and imie_k='John';
update kibice set data_ur_k = '1900-01-01' where data_ur_k is null; 
select*from kibice;
select*from zawodnicy;
update zawodnicy set wzrost = wzrost +2 where kraj='POL';  
select 6; 
select 6+5;
select 4+3, 2+1, 4+2;
select * from zawodnicy; 
select kraj, imie, nazwisko from zawodnicy; 
select*, id_skoczka from zawodnicy;
select *, wzrost + 5 as 'narty' from zawodnicy; 
select imie as 'Imie', nazwisko as 'Nazwisko', wzrost +5 as 'Narty' from zawodnicy; 
select imie, nazwisko, wzrost +5 as 'narty' from zawodnicy where kraj='GER';
select imie, nazwisko,  wzrost *1.46 as 'dl_nart' from zawodnicy;
select *, round(waga/pow(wzrost/100,2),2)  as 'bmi' , waga/pow(wzrost/100,2) <= 20 as 'decyzja' from zawodnicy; 
select pi();
select power(2.9, 2);
select 2 in (1,2,3); 
select * from zawodnicy where kraj != 'pol';
select conv(13,10, 2);
select *, round(waga/pow(wzrost/100,2),2)  as 'bmi' from zawodnicy; 

select *, round(waga/pow(wzrost/100,2),2)  as 'bmi' , waga/pow(wzrost/100,2) <= 20 as 'decyzja' from zawodnicy; 
select curdate()-data_ur from zawodnicy; 
select year( curdate())-year(data_ur) from zawodnicy; 
select month( now());

select day(now());
select date_format (data_ur, '%d.%m.%y') from zawodnicy;
select imie, nazwisko, concat( DAYOFYEAR(data_ur), date_format(data_ur, ' dnia %Y roku') ) as 'data' from zawodnicy;

select*from trenerzy;
update trenerzy set data_ur_t =now() where data_ur_t is null;
select imie_t, nazwisko_t, year(now()) - year(data_ur_t) as 'wiek' from trenerzy; 

select*from zawodnicy;
select id_skoczka, upper(imie) as imie, nazwisko, lower(kraj) as kraj, data_ur, wzrost, waga from zawodnicy; 
select * ,length(nazwisko) -1 as 'max_index' from zawodnicy; 
select*, concat('  ', imie, '    ') from  zawodnicy;
select *, concat_ws( space(5) ,upper(imie), nazwisko, kraj) as 'reprezentant' from zawodnicy; 
select *, repeat(upper(imie),3) from zawodnicy;
select insert(nazwisko, 2, length(nazwisko), 'xx') from zawodnicy; 
select * from zawodnicy;
SELECT 
    CONCAT(UPPER(SUBSTR(nazwisko, 1, 1)),
            LOWER(SUBSTR(nazwisko,
                        2,
                        LENGTH(nazwisko) - 2)),
            UPPER(SUBSTR(nazwisko, LENGTH(nazwisko), 1))) AS 'nazwisko'
FROM
    zawodnicy; 
            
            select data_ur regexp '[1-2][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]' from zawodnicy; 
            select reverse(nazwisko) from zawodnicy;
            
select ascii( 'd' ); 
select char(100);
select bin(1223);

 SELECT 
    CONCAT(imie,
            ' ',
            UPPER(SUBSTR(nazwisko, 1, 1)),
            LOWER(SUBSTR(nazwisko,
                        2,
                        LENGTH(nazwisko) - 1)),
            ' (',
            kraj,
            ') ') AS 'reprezentant'
FROM
    zawodnicy; 

select * from zawodnicy where wzrost > 165 and wzrost < 182;
select imie, nazwisko, round(waga/pow(wzrost/100,2),2)  as 'bmi', case when (waga/pow(wzrost/100,2)) <= 18 then 'zawodnik za lekki' when waga/pow(wzrost/100,2) >=
 20 then 'zawodnik za ciężki' else 'zawodnik w normmie' end from zawodnicy;
 select * from trenerzy; 
update trenerzy set data_ur_t = null where data_ur_t = '2017-07-18'; 
select imie, nazwisko,  coalesce(data_ur, 'brak dandych') as 'data_ur' from zawodnicy order by nazwisko limit 10 offset 3;
select * from zawodnicy where kraj = 'GER' or kraj = 'AUT' order by nazwisko; 

select * from zawodnicy where waga / pow(wzrost / 100,2) <= 18 order by nazwisko; 
select * from zawodnicy where year(now())- year(data_ur) >40 ; 
SELECT 
    *
FROM
    zawodnicy
WHERE
    MONTH(data_ur) > 12
        OR MONTH(data_ur) <= 3;

select *, quarter(data_ur) as 'kwartaly' from zawodnicy order by kwartaly; 

select * from zawodnicy order by kraj, nazwisko; 

select * from trenerzy order by  COALESCE(data_ur_t, curdate()); 
select * from zawodnicy order by rand(); 
select * from zawodnicy order by wzrost desc limit 1 offset 1; 
select * from zawodnicy where wzrost= 184; 
SELECT 
    *
FROM
    zawodnicy
WHERE
    wzrost = (SELECT 
            wzrost
        FROM
            zawodnicy
        ORDER BY wzrost DESC
        LIMIT 1 OFFSET 1)
        AND wzrost < (SELECT 
            wzrost
        FROM
            zawodnicy
        ORDER BY wzrost DESC
        LIMIT 1); 
        
select imie, nazwisko, kraj, 'zawodnik' as 'funkcja' from zawodnicy
union 
select imie_t, nazwisko_t, kraj, 'trener' as 'funkca'  from trenerzy order by kraj; 
# łącznie tabel 
SELECT 
    imie, nazwisko, imie_t, nazwisko_t
FROM
    zawodnicy
        NATURAL JOIN
    trenerzy; 

SELECT 
    *
FROM
    zawody,
    skocznie
WHERE
    zawody.id_skoczni = skocznie.id_skoczni;
select*from zawody natural join skocznie;
select * from skocznie; 
select * from zawodnicy;
select * from trenerzy; 
select * from zawody; 


SELECT 
imie, nazwisko, imie_t, nazwisko_t 
from zawodnicy 
natural right join trenerzy; 

SELECT 
imie, nazwisko, imie_t, nazwisko_t 
from zawodnicy 
natural left join trenerzy
union select 
imie, nazwisko, imie_t, nazwisko_t 
from zawodnicy natural right join trenerzy;  

SELECT 
imie, nazwisko, imie_t, nazwisko_t 
from zawodnicy 
right join 
trenerzy on zawodnicy.kraj=trenerzy.kraj; 
SELECT 
imie, nazwisko, imie_t, nazwisko_t 
from trenerzy
right join zawodnicy on zawodnicy.kraj=trenerzy.kraj where imie_t is null union 
SELECT 
imie, nazwisko, imie_t, nazwisko_t 
from zawodnicy 
right join 
trenerzy on zawodnicy.kraj=trenerzy.kraj where imie is null;

#trenerów którzy trenują jakiś zawodników 
select 
distinct nazwisko_t, imie_t from trenerzy natural join zawodnicy order by nazwisko_t;

# dla każdego zawodnika którego zawody odbywają się w jego kraju. 
select nazwisko, imie , skocznie.* 
from zawodnicy 
join skocznie on (kraj=kraj_s) order by miasto;

# znajdz zawodników starszych od swoich trenerow / młodszych od swoich trenerow 

select imie, nazwisko, data_ur from zawodnicy join trenerzy on (data_ur<data_ur_t); 
select DISTINCT imie, nazwisko, data_ur from zawodnicy join trenerzy on (data_ur>data_ur_t); 

# wypisz listę wszytkich par zawodników tej samej narodowości, takich ze pierwszy z zawodników jest wyższy od drugiego. 

select * from zawodnicy as z1 join zawodnicy as z2 on (z1.kraj = z2.kraj and z1.wzrost > z2.wzrost); 

#dzien 3 
#wielkość drużyn narodowych / kraj - liczebność 
select kraj, count(*) as liczba from zawodnicy group by kraj; 
select count(*) as wszyscy from zawodnicy;
#podaj ilość zawodników wyższych niż 180 cm
select kraj, count(*) as wysocy from zawodnicy where wzrost > 180 group by kraj; 

#lista ekip uporządkowana wg wzrostu zawodników 

select kraj, round(avg(wzrost),2) as sr_wzrost from zawodnicy group by kraj order by sr_wzrost desc; 

#sprawdź jaki jest najwyższy wzrost w poszczególnych krajach

select kraj, max(wzrost) as wzrost from zawodnicy group by kraj order by wzrost desc; 

#wypisz z namniejszym bmi 

select kraj, round(min(waga/pow(wzrost/100,2)),2) as bmi_min from zawodnicy group by kraj having bmi_min >=18  order by bmi_min; 

#sprawdź jaki jest najwyższy wzrost 

select max(wzrost) as max_wzrost from zawodnicy; 

#policz ilu zawodników urodziło sie w poszczególnych kwartałach alter

select  QUARTER(data_ur) as kwartal,  count(*) as liczba_ur from zawodnicy group by kwartal; 

#policz ilu zawodników urodziło się w poszczególnych latach w poszczególnych kwartałach. 

SELECT 
    YEAR(data_ur) AS rok,
    QUARTER(data_ur) AS kwartal,
    COUNT(*) AS liczba_ur
FROM
    zawodnicy
GROUP BY rok , kwartal
having rok >=1980
ORDER BY rok DESC , kwartal ASC;

# jaka jest średnia wielkość ekipy narodowej 

select round(count(*)/count(distinct(kraj)) as srednia, from zawodnicy;

#wypisz liczbe ekip, dla kazdej podaj zawodników >180, nie uwzględniaj ekpi gdzie takich jest mniej niż 2 

SELECT 
    kraj, COUNT(*) AS licznik
FROM
    zawodnicy
WHERE
    wzrost > 180
GROUP BY kraj
HAVING COUNT(*) >= 2
ORDER BY licznik DESC;

#wypisz te ekipy w których średnia wzrostu jest równa conajmniej 180. 

select kraj, avg(wzrost) >=180 as ilosc from zawodnicy group by kraj having ilosc > 0;  

#znajdź zawodników wyższych od Małysza

select * from zawodnicy where wzrost > (select wzrost from zawodnicy where nazwisko = 'malysz' and imie = 'adam') order by wzrost;  
# / select * from zawodnicy where wzrost > (select wzrost from zawodnicy where waga > (select avg(waga)  from zawodnicy);

#znajdź zawodnika wyższego niż najcięższy

select * from zawodnicy where wzrost > (select wzrost from zawodnicy order by waga desc limit 1 offset 2 ); 

#znajdź zawodników starszych od trenera kuttina 

select * from zawodnicy where data_ur < (select data_ur_t from trenerzy where nazwisko_t = 'kuttin'); 

# znajdź zawodników o wzroście jak janne ahonen 

select * from zawodnicy
where wzrost = (select wzrost from zawodnicy where nazwisko = 'ahonen') and nazwisko != 'ahonen' ;

# znajdź imie i nazwisko najwyższego zawodnika 

select imie, nazwisko, wzrost from zawodnicy where wzrost =(select max(wzrost) from zawodnicy); 

#wypisz zawodników cięższych niż średnia wszytkich 

select * from zawodnicy where waga >= (select avg(waga) from zawodnicy); 
select avg(waga) from zawodnicy;

#wypiszmy zawodników cieższych niż srednia z polski 

select * from zawodnicy where waga >= (select avg(waga) from zawodnicy where kraj = 'pol') and kraj != 'pol' order by nazwisko; 

#wypisz zawodników cięższych niż średnia w danje ekipie 

select * from zawodnicy as zaw  where waga > (select avg(waga) from zawodnicy where zaw.kraj=kraj) order by kraj; 

#podaj ilość zawodników >180 w poszczegówlnych drużynach, tam gdzie ich nie ma by wyświetlało 0 

select kraj, sum(wzrost>180) as wyzszsi from zawodnicy group by kraj having wyzszsi >=2; 
select kraj, count(wzrost>180) as wyzszsi from zawodnicy group by kraj; # count zlicza zera 

# >>>>>>>>>>> tworzenie widoków <<<<<<<<<<<

select * from zawodnicy; 

create view info as select kraj, nazwisko, imie from zawodnicy; 
select * from info; 

create view zt as
select imie, nazwisko, zawodnicy.kraj, imie_t, nazwisko_t from zawodnicy left join trenerzy on zawodnicy.kraj = trenerzy.kraj order by kraj desc;  
drop view zt;
select * from zt;

#>>>>>>>>>> wyzwalacze / trigger <<<<<<<<<<<<

# do tabeli trenerów dodaj kolumne ilosci zawodników 

create table trenerzy2 (
 kraj TEXT,
    imie_t TEXT,
    nazwisko_t TEXT,
    data_ur_t DATE, 
    liczba_zawodnikow int); 
    
iNSERT INTO trenerzy2 VALUES ('AUT', 'Alexander', 'Pointner', NULL,2);
INSERT INTO trenerzy2 VALUES ('FIN', 'Tommi', 'Nikunen', NULL,3);
INSERT INTO trenerzy2 VALUES ('NOR', 'Mika', 'Kojonkoski', '1963-04-19',3);
INSERT INTO trenerzy2 VALUES ('POL', 'Heinz', 'Kuttin', '1971-01-05',3);
INSERT INTO trenerzy2 VALUES ('GER', 'Wolfang', 'Steiert', '1963-04-19',5);
INSERT INTO trenerzy2 VALUES ('JPN', 'Hirokazu', 'Yagi', NULL,0); 

select * from trenerzy2 ;

select kraj, count(*) from zawodnicy group by kraj; 

#trigger > idodanie zawodnik

create trigger zawodnik_dodanie 
after insert on zawodnicy 
for each row update trenerzy2 
set liczba_zawodnikow = liczba_zawodnikow + 1 where trenerzy2.kraj = new.kraj; 
 
INSERT INTO zawodnicy VALUES (20, 'Kamil', 'STOCH', 'POL', '1992-09-04', 186, 66);

select * from trenerzy2; 

# odjecie zawodnika 

create trigger zawodnik_usuniecie 
after delete on zawodnicy 
for each row update trenerzy2 
set liczba_zawodnikow = liczba_zawodnikow - 1 where trenerzy2.kraj = old.kraj; 

delete from zawodnicy where nazwisko='stoch';


select * from trenerzy2; 

