create database Havayolu_Otomasyonu;
use Havayolu_Otomasyonu;
create table Ucak(
Ucak_İd int auto_increment,
Ucak_Marka int,
Ucak_Model int,
Ucak_Kapasite int,
Ucak_Menzil float,
Ucak_Durum boolean,
primary key (Ucak_İd));

insert into Ucak(Ucak_Marka,Ucak_Model,Ucak_Kapasite,Ucak_Menzil,Ucak_Durum) values (1,1,500,15.500,true);
insert into Ucak(Ucak_Marka,Ucak_Model,Ucak_Kapasite,Ucak_Menzil,Ucak_Durum) values (2,2,450,18.500,true);
insert into Ucak(Ucak_Marka,Ucak_Model,Ucak_Kapasite,Ucak_Menzil,Ucak_Durum) values (3,3,600,14.300,false);


create table Ucak_Marka(
Marka_İd int auto_increment,
Marka_Ad varchar(25),
primary key (Marka_İd));

insert into Ucak_Marka(Marka_Ad) values ("Boeing");
insert into Ucak_Marka(Marka_Ad) values ("Airbus ");
insert into Ucak_Marka(Marka_Ad) values ("Antonov ");


create table Ucak_Model(
Model_Id int auto_increment,
Model_Ad varchar(25),
primary key(Model_Id));
select * from ucak;
select * from ucak_marka;
select * from ucak_model;
select * from Ucus_Bilgi;

insert into Ucak_Model(Model_Ad) values ("747-8I");
insert into Ucak_Model(Model_Ad) values ("A380-800");
insert into Ucak_Model(Model_Ad) values ("AN-225 MRIYA");

create table Pilot(
Pilot_Id int auto_increment,
Pilot_Ad varchar(25),
Pilot_Soyad varchar(25),
Pilot_Telefon varchar(13),
Pilot_Adres varchar(100),
primary key (Pilot_Id));

insert into Pilot(Pilot_Ad,Pilot_Soyad,Pilot_Telefon,Pilot_Adres) values ('Ahmet','Cansever','0545 556 5853','Maltepe/İstanbul');
insert into Pilot(Pilot_Ad,Pilot_Soyad,Pilot_Telefon,Pilot_Adres) values ('Mehmet','Aydın','05455504237','Ümraniye/İstanbul');


create table Havalimani(
Havalimani_Id int auto_increment,
Havalimani_Adi varchar(70),
Havalimani_Sehir_Id int,
primary key (Havalimani_Id));

insert into Havalimani(Havalimani_Adi,Havalimani_Sehir_Id) values('Sabiha Gökçen',34);
insert into Havalimani(Havalimani_Adi,Havalimani_Sehir_Id) values('İzmir Adnan Menderes Havalimanı',35);
insert into Havalimani(Havalimani_Adi,Havalimani_Sehir_Id) values('Ankara Esenboğa Havalimanı',06);
insert into Havalimani(Havalimani_Adi,Havalimani_Sehir_Id) values('İstanbul Havalimanı',34);

create table Yolcu(
Yolcu_Id int auto_increment,
Yolcu_Adi varchar(15),
Yolcu_Soyadi varchar(20),
Yolcu_Tel_No varchar(13),
Yolcu_Mail_Adres varchar(30),
Yolcu_Adres varchar(150),
primary key(Yolcu_Id));


insert into yolcu(Yolcu_Adi,Yolcu_Soyadi,Yolcu_Tel_No,Yolcu_Adres,Yolcu_Mail_Adres) values 
('Kevser','Sabah','0505 553 1226','Sancaktepe/İstanbul','kevsersabah@gmail.com'),
('Çağla','Şeref','0555 552 3833','İstanbul/Ataşehir','caglaseref@gmail.com'),
("Mehveş","Tabak",'0545 558 4993',"Maltepe/İstanbul",'mehvestabak@gmail.com'),
('Miraç','Türkmenoğlu','0505 557 2500','Ümraniye/İstanbul','miracturkmen@gmail.com');
                                                      
create table Sehir(
Sehir_Id int,
Sehir_Adi varchar(20),
primary key (Sehir_Id));

insert into Sehir values(35,'İzmir');
insert into Sehir values(34,'İstanbul');
insert into Sehir values(06,'Ankara');

create table Ucus_Bilgi(
Ucus_Id int auto_increment,
Kalkis_No int,
İnis_No int,
Tarih date,
Pilot_İd int,
Ucak_İd int,
primary key(Ucus_Id));

insert into Ucus_Bilgi(Kalkis_No, İnis_No, Tarih, Pilot_İd, Ucak_İd) values 
(1,2,str_to_date('20-12-2020','%d-%m-%Y'),1,2),
(3,1,str_to_date('20-01-2021','%d-%m-%Y'),2,3),
(3,1,str_to_date('18-02-2020','%d-%m-%Y'),2, 4),
(2,3,str_to_date('03-01-2021', '%d-%m-%Y'),1,3),
(2,3,str_to_date('04-01-2021', '%d-%m-%Y'),2,3);
                                                        
create table Ucus_Yolcu(
Yolcu_Ucus_İd int auto_increment,
Yolcu_İd int,
Ucus_İd int,
Bagaj boolean,
Kapı_No varchar(20),
primary key(Yolcu_Ucus_İd)
);
 


alter table Ucak add constraint  fk_ucakmarka_key foreign key (Ucak_Marka) references Ucak_Marka(Marka_Id);
alter table Ucak add constraint  fk_ucakmodel_key foreign key (Ucak_Model) references Ucak_Model(Model_Id);


alter table Havalimani add constraint fk_sehir_key foreign key (Havalimani_Sehir_Id) references Sehir(Sehir_Id);



alter table Ucus_Bilgi add constraint fk_pilot_key foreign key (Pilot_İd) references Pilot(Pilot_Id);
alter table Ucus_Bilgi add constraint fk_ucak_key foreign key (Ucak_İd) references Ucak(Ucak_Id);
alter table Ucus_Bilgi add constraint fk_kalkis_key foreign key (Kalkis_No) references Havalimani(Havalimani_Id);
alter table Ucus_Bilgi add constraint fk_inis_key foreign key (İnis_No) references Havalimani(Havalimani_Id);

alter table Ucus_Yolcu add constraint fk_yolcu_key foreign key (Yolcu_İd) references Yolcu(Yolcu_Id);
alter table Ucus_Yolcu add constraint fk_ucak2_key foreign key (Ucus_İd) references Ucak(Ucak_Id);


-- Durumu aktif olan uçakların kapasitelerini 100 olarak güncelleyen sorguyu yazın.
SET SQL_SAFE_UPDATES=0;
update Ucak set Ucak_Kapasite=100 where Ucak_Durum=true;

select * from ucak; 

-- Bagajı olan ve kapı numarası 108A olan uçuştaki yolcuların ad ve soyadı bilgilerini getirin.

-- Alt Sorgu
select Yolcu_Adi,Yolcu_Soyadi from  Yolcu where Yolcu_İd in(select Yolcu_İd from Ucus_Yolcu where Bagaj=true and Kapı_No="A34");
-- İnner Join 
select Yolcu_Adi,Yolcu_Soyadi from  Yolcu y
inner join Ucus_Yolcu uy on y.Yolcu_İd=uy.Yolcu_İd
where Bagaj=true and Kapı_No="A34";

-- İzmir’den kalkan uçakları kullanan pilotların listesi (alt sorgu ile).

-- Alt Sorgu
 select Pilot_Ad from Pilot where  Pilot_İd in
 (select Pilot_İd from Ucus_Bilgi where Kalkis_No  in
 (select Havalimani_Id from Havalimani where Havalimani_Sehir_İd =
 (select Sehir_İd from sehir where Sehir_Adi="İzmir")));

-- İnner Join 
select Pilot_Ad from Ucus_Bilgi ub
inner join Havalimani h on h.Havalimani_Id=ub.Kalkis_No
inner join Pilot p on p.Pilot_İd=ub.Pilot_İd
inner join Sehir s on s. Sehir_İd=h.Havalimani_Sehir_İd
where Sehir_Adi="İzmir";

-- Yolcu_id’si 12345678910 olan yolcunun uçuş bilgilerini getirin (alt sorgu ile).

-- Alt Sorgu

select * from Ucus_Bilgi where Ucak_İd =(select Ucak_İd from Ucak where Ucak_İd=(select Ucus_İd from Ucus_Yolcu where Yolcu_Id in(select Yolcu_Id from Yolcu where Yolcu_İd=1))); 
select * from Ucus_Bilgi where Ucak_İd =(select Ucak_İd from Ucak where Ucak_İd=(select Ucus_İd from Ucus_Yolcu where Yolcu_İd=1)); 

-- İnner Join

select ub.Ucus_Id,ub.Kalkis_No,ub.İnis_No,ub.Tarih,ub.Pilot_İd,ub.Ucak_İd from Ucak u 
inner join Ucus_Yolcu uy on uy.Ucus_İd=u.Ucak_İd
inner join Ucus_Bilgi ub on ub.Ucak_İd=u.Ucak_İd
where uy.Yolcu_İd=1; 

-- Sehirlere göre havalimanları sayısını veren tabloyu oluşturun (group by). 

select count(Havalimani_Sehir_Id) from Havalimani group by Havalimani_Sehir_Id; 	

select s.Sehir_Adi,count(Havalimani_Sehir_Id) as Havalimani_Sayisi from Havalimani h
inner join Sehir s on h.Havalimani_Sehir_Id=s.Sehir_İd
group by Havalimani_Sehir_Id;

-- SAYFA 2 --
-- Ankara’ya gerçekleştirilen uçuşların listesi.

-- İnner Join 
select * from Havalimani h
inner join Sehir s on s.Sehir_İd=h.Havalimani_Sehir_Id
inner join Ucus_Bilgi ub on ub.Kalkis_No=h.Havalimani_Id
where s.Sehir_Adi="Ankara";

-- Alt Sorgu
select * from  Ucus_Bilgi where Kalkis_No in(select Havalimani_Id from Havalimani where Havalimani_Sehir_Id in(select Sehir_İd from Sehir where Sehir_Adi="Ankara" ));

-- Ankara’ya gerçekleştirilen uçuşların listesi (pilot ismi ve uçak adı ile)

-- İnner Join

select p.Pilot_İd,p.Pilot_Ad,uma.Marka_Ad,umo.Model_Ad,u.Ucak_İd from Havalimani h
inner join Sehir s on s.Sehir_İd=h.Havalimani_Sehir_Id
inner join Ucus_Bilgi ub on ub.Kalkis_No=h.Havalimani_Id
inner join Pilot p on ub.Pilot_İd=p.Pilot_İd
inner join Ucak u on u.Ucak_İd=ub.Ucak_İd
inner join Ucak_Model umo on umo.Model_İd=u.Ucak_Model
inner join Ucak_Marka uma on  uma.Marka_İd=u.Ucak_Marka
where s.Sehir_Adi="Ankara" group by u.Ucak_İd;

-- 8 numaralı pilotun kullandığı uçakların modelleri (alt sorgu ile).
-- Alt Sorgu
select * from Ucak_Model where Model_İd in( select Ucak_Model from Ucak where Ucak_id in (select Ucak_İd from Ucus_Bilgi where Pilot_İd in(select Pilot_İd from Pilot where Pilot_İd=2))); 

-- İnner Join
select Model_Id,Model_Ad from Ucus_Bilgi ub
inner join ucak u  on u.Ucak_İd=ub.Ucak_İd
inner join pilot p on ub.Pilot_İd=p.Pilot_İd
inner join Ucak_Model umo on umo.Model_İd=u.Ucak_Model
where p.Pilot_İd=2;

-- 01.01.2019 ile 01.01.2020 tarihleri arasında gerçekleşen uçuş sayısı.
select count(Tarih) as Ucus_Sayisi from Ucus_Bilgi where tarih between '2019-01-01' and '2022-01-01';
select * from Ucus_Bilgi where tarih between '2021-01-02' and '2021-01-21';

-- 2020 yılında en çok uçuş gerçekleştiren pilotun bilgilerini getirin.
select * from Pilot where Pilot_Id in(select Pilot_İd from Ucus_Bilgi where tarih between  '2018-01-01' and '2023-01-10');

SELECT * FROM pilot p 
inner join ucus_bilgi ub on p.pilot_id=ub.pilot_id
where ub.tarih between '2021-01-02' and '2021-01-21' GROUP BY Pilot_Telefon HAVING (COUNT(Pilot_Telefon) > 0) ORDER BY COUNT(*) DESC limit 1;

select* from Ucak;
select*from Ucus_Bilgi;