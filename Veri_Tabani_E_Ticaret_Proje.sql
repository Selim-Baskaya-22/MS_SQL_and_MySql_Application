create database Veri_Tabani_E_Ticaret_Proje_Ödevi;
use Veri_Tabani_E_Ticaret_Proje_Ödevi;
create table Personel(
Personel_Sicil_No int,
Personel_Adi varchar(15),
Personel_Soyadi varchar (20),
Personel_Yasi char(3),
Personel_Gorev_Bilgisi_No int,
Personel_Egitim_Bilgi_No int,
Personel_Calistigi_Magaza_No int,
Personel_Ise_Baslama_Tarihi int,
Personel_Isten_Ayrilma_Tarihi int,
primary key (Personel_Sicil_No)
);

create table Gorev(
Gorev_No int,
Gorev_Adi varchar(20),
primary key (Gorev_No)
);
create table Egitim_Duzeyi(
Egitim_no int,
Egitim_Düzeyi varchar(20),
primary key(Egitim_no)
);
create table Urun(
Urun_Kodu int,
Urun_Adı varchar(30),
Urun_Fiyati int,
primary key(Urun_Kodu)
);
create table Ucret(
Personel_Sicil_No int,
Maas_Bilgisi int,
Maas_Aldigi_Yil int,
primary key (Personel_Sicil_No)
);
create table Magaza(
Magaza_No int,
Magaza_Adi varchar(20),
Magaza_Adresi varchar(100),
Magaza_Acilis_Tarihi int,
Magaza_Kapanis_Tarihi int,
primary key (Magaza_no)
);
create table Magaza_Urun(
Magaza_No int,
Urun_Kod_Bilgi int,
primary key(Magaza_No)
);

create table Meslek(
Meslek_No int,
Meslek_Adı varchar(20),
primary key(Meslek_No)
);
create table Musteri(
Musteri_No int,
Musteri_Adi varchar(15),
Musteri_Soyadi varchar(20),
Musteri_Egitim_Bilgi_No int,
Musteri_Meslek_Bilgi_No int,
Musteri_Telefon_No char(11),
primary key(Musteri_No)
);
create table Satin_Alinan(
Musteri_No int,
Urun_Kodu int,
Urun_Adedi int,
Siparis_Tarihi int,
Magaza_No int,
primary key (Musteri_No)
);


alter table personel add constraint fk_gorev_bilgi foreign key (Personel_Gorev_Bilgisi_No) references Gorev(Gorev_No);
alter table personel add constraint fk_egitim_bilgi foreign key (Personel_Egitim_Bilgi_No) references Egitim_Duzeyi(Egitim_no);
alter table personel add constraint fk_magaza_bilgi foreign key (Personel_Calistigi_Magaza_No) references Magaza(Magaza_No);

alter table Ucret add constraint fk_sicil_no foreign key (Personel_Sicil_No) references  Personel(Personel_Sicil_No);

alter table Magaza_Urun add constraint fk_magaza_no foreign key (Magaza_No) references Magaza(Magaza_No);
alter table Magaza_Urun add constraint fk_urun_kod_bilgi foreign key (Urun_Kod_Bilgi) references Urun(Urun_Kodu);

alter table Musteri add constraint fk_egitim_bilgi2 foreign key (Musteri_Egitim_Bilgi_No) references Egitim_Duzeyi(Egitim_no);
alter table Musteri add constraint fk_meslek_bilgi foreign key (Musteri_Meslek_Bilgi_No) references Meslek(Meslek_No);

alter table Satin_Alinan add constraint fk_mussteri_no foreign key (Musteri_No) references Musteri(Musteri_No);
alter table Satin_Alinan add constraint fk_urun_kodu foreign key (Urun_Kodu) references Urun(Urun_Kodu);
alter table Satin_Alinan add constraint fk_magaza_noo foreign key (Magaza_No) references Magaza(Magaza_No);


insert into Gorev values (1,'Pazarlama');
insert into Gorev values (2,'Mühendislik');
insert into Gorev values (3,'Teknik');
insert into Gorev values (4,'Bilgi İşlem');
insert into Gorev values (5,'Muhasebe');
insert into Gorev values (6,'Güvenlik');
insert into Gorev values (7,'İnsan Kaynakları');
insert into Gorev values (8,'Sağlık');
insert into Gorev values (9,'Yönetim');
insert into Gorev values (10,'İş Geliştirme');


insert into Egitim_Duzeyi values (11,'İlkokul');
insert into Egitim_Duzeyi values (12,'Ortaokul');
insert into Egitim_Duzeyi values (13,'Lise');
insert into Egitim_Duzeyi values (14,'Üniversite');
insert into Egitim_Duzeyi values (15,'Ön Lisans');
insert into Egitim_Duzeyi values (16,'Yüksek Lisans');


insert into Urun values (111,'CASPER-Excalibur Masaüstü PC',11399.99);
insert into Urun values (112,'ACER-Win10 All In One Bilgisayar Gri',5999.99);
insert into Urun values (113,'LENOVO-IdeaCentre Masaüstü Bilgisayar',7999.99);
insert into Urun values (114,'APPLE-MacBook Retina/ Laptop Gold',14399.99);
insert into Urun values (115,'GENERAL MOBILE-64GB Akıllı Telefon',1999.99);
insert into Urun values (116,'Dell Intel Core i5 Taşınabilir Bilgisayar',7999.99);
insert into Urun values (117,'XIAOMI-Redmi 9 4+64 RAM Akıllı Telefon',2549.99);
insert into Urun values (118,'OPPO Reno-4 Lite 128 GB Akıllı Telefon',3699.99);
insert into Urun values (119,'SONY-189 Ekran Uydu Alıcılı Android Smart 4K Ultra HD LED TV',18997.99);
insert into Urun values (120,'PHILIPS-108 Ekran Uydu Alıcılı Smart Full HD LED TV',3329.99);
insert into Urun values (121,'PEAQ-80 Ekran Uydu Alıcılı Smart Android LED TV',1299.99);


insert into Magaza values (11,'Teknosa','Küçüksu Cd. No: 64, 34768 Ümraniye/İstanbul','2000/07/25',null);
insert into Magaza values (12,'Akusta','Dr. Gülriz Özbek, Kültür Mah No: 53, 35220 Konak/İzmir','1993/04/17',null);
insert into Magaza values (13,'Extreme Audio','Üsküdar-İçerenköy Cd No:47, 34752 Ataşehir/İstanbul','2002/05/29',null);
insert into Magaza values (14,'Bimeks','Turgut Reis, 408. Sk. No:1, 34200 Esenler/İstanbul','1990/11/23',null);
insert into Magaza values (15,'Vatan Bilgisayar','Atatürk Cd. No:124 D:13B, 34885 Sancaktepe/İstanbul','1983/09/26',null);
insert into Magaza values (16,'Egemen Elektronik','Ihlamurkuyu Mah Malazgirt Cd, Şendal Sk. No:1, 34771 Ümraniye','2013/07/20',null);
insert into Magaza values (17,'Formnet',' Şerifali, Şht. Sk. 16/1, 34775 Ümraniye/İstanbul','1994/06/28',null);
insert into Magaza values (18,'Media Markt','Aydınevler Mah. Siteler Yolu Sok. Hilltown Avm. 34854 Maltepe/İstanbul','2007/09/18',null);
insert into Magaza values (19,'Electro World','Mustafa Kemal Paşa, Huzur Sok. No:31, 77200 Yalova Merkez/Yalova','2002/01/01',null);
insert into Magaza values (20,'Best Buy','369 Gateway Dr, Brooklyn, NY 11239, Birleşik Devletler','1966/08/14',null);

insert into Meslek values(111,'Veri Bilimci');
insert into Meslek values(112,'Yazılım Mühendisi');
insert into Meslek values(113,'Ağ ve Bilgisayar Sistemleri Yöneticisi');
insert into Meslek values(114,'Bilgisayar Programcısı');
insert into Meslek values(115,'Web Geliştirme Uzmanı');
insert into Meslek values(116,'Ağ Uzmanı');
insert into Meslek values(117,'Bilgi Güvenliği Analisti');
insert into Meslek values(118,'Full Stack Geliştirici');
insert into Meslek values(119,'Autocad Teknik Ressam');
insert into Meslek values(120,'Belge Yönetim Uzmanı');
insert into Meslek values(121,'Arama Pazarı Stratejisti');


insert into Musteri values(1,'Ahmet','Cansever',13,113,'0545 556 5853');
insert into Musteri values(2,'Mehmet','Aydın',14,114,'0 545 550 4237');
insert into Musteri values(3,'Aliye','Seven',14,114,'0 535 551 8826');
insert into Musteri values(4,'Burak','Kılıç',15,115,'0 555 558 0598');
insert into Musteri values(5,'Beyza','Sayın',15,121,'0 505 557 6591');
insert into Musteri values(6,'İlkay','Kahrıman',14,119,'0 505 552 6974');
insert into Musteri values(7,'Abdullah','Demir',16,120,'0 545 551 0647');
insert into Musteri values(8,'Ayşe','Genç',16,112,'0 545 553 3622');
insert into Musteri values(9,'Gülşen','Ekmel',15,111,'0 505 553 1226');
insert into Musteri values(10,'Sedat','Üstün',16,116,'0 555 552 3833');
insert into Musteri values(11,'Atahan','Adanır',16,115,'0 545 558 4993');
insert into Musteri values(12,'Şennur','Batur',11,118,'0 545 551 8013');
insert into Musteri values(13,'Mügenur','Ağnar',12,121,'0 545 554 5562');
insert into Musteri values(14,'İclal','Gırgın',12,117,'0 505 557 2500');
insert into Musteri values(15,'Nergiz','İpekoğlu',13,119,'0 505 554 0009');
insert into Musteri values(16,'Bergüzar','Kızıl',12,119,'0 505 557 8642');
insert into Musteri values(17,'Yaşar Fatih','Morgül',11,121,'0 545 555 9293');


insert into Personel values(111,'Evren Burak','Kızılırmak',21,1,13,12,'2011/08/11',null);
insert into Personel values(112,'Enes','Kızmaz',23,3,13,12,'2012/09/01',null);
insert into Personel values(113,'Yiğithan','İnal',34,2,16,11,'2005/11/08',null);
insert into Personel values(114,'Zerin','Okcu',32,7,15,18,'2007/09/19',null);
insert into Personel values(115,'Tunahan','Önen',45,5,14,19,'2003/05/02',null);
insert into Personel values(116,'Zeynep Tuba','Palut',25,4,14,15,'1996/05/09',null);
insert into Personel values(117,'Aysu','Portakal',28,10,14,14,'1994/08/23',null);
insert into Personel values(118,'Kevser','Sabah',52,9,16,20,'1968/10/10',null);
insert into Personel values(119,'Çağla','Şeref',26,1,13,16,'2015/11/05',null);
insert into Personel values(120,'Mehveş','Tabak',32,10,15,15,'1985/03/22',null);
insert into Personel values(121,'Miraç Ayberk','Türkmenoğlu',27,3,13,13,'2002/07/22',null);
insert into Personel values(122,'Lalezar','Uçar',29,2,15,17,'2009/04/19',null);
insert into Personel values(123,'Arife Gülbiz','Özata',28,5,14,20,'1971/02/16',null);
insert into Personel values(124,'Kolçak','Yerliyurt',32,6,11,19,'2003/10/28',null);
insert into Personel values(125,'Alaaddin','Zeybekci',37,9,16,14,'1994/02/26',null);


insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(111,2112.50,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(111,2598.24,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(111,3032.45,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(111,3567.45,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(111,3850.49,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(111,4320.28,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(112,1874.34,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(112,2249.32,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(112,2537.46,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(112,2727.27,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(112,3361.46,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(112,3992.28,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(113,1642.84,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(113,1978.52,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(113,2537.76,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(113,2727.67,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(113,3121.36,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(113,3992.28,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(114,1532.81,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(114,2178.53,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(114,2647.46,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(114,2727.63,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(114,3303.45,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(114,4102.46,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(115,1462.45,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(115,1671.82,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(115,2337.26,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(115,2947.25,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(115,3641.29,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(115,4392.24,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(116,2342.24,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(116,2978.72,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(116,3537.56,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(116,4757.47,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(116,5139.56,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(116,6986.87,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(117,1832.54,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(117,2178.72,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(117,2737.36,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(117,3727.26,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(117,4411.11,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(117,5292.52,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(118,2434.64,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(118,3178.23,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(118,3832.26,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(118,4727.74,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(118,5671.67,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(118,7292.67,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(119,2852.24,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(119,3438.52,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(119,4737.36,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(119,5727.92,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(119,6416.01,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(119,8292.32,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(120,1332.21,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(120,1732.87,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(120,2434.34,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(120,3837.16,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(120,4412.18,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(120,5292.36,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(121,5232.56,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(121,5633.73,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(121,6432.74,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(121,6954.31,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(121,7432.45,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(121,8391.34,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(122,1352.11,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(122,1919.93,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(122,2611.14,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(122,3333.21,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(122,4200.35,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(122,5322.32,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(123,2342.54,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(123,2833.83,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(123,3321.21,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(123,4535.10,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(123,5414.19,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(123,6199.92,2020);


insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(124,2891.51,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(124,3531.63,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(124,4351.24,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(124,5233.21,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(124,6412.65,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(124,7792.72,2020);

insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(125,1100.51,2015);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(125,1476.63,2016);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(125,1998.94,2017);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(125,2532.31,2018);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(125,2921.35,2019);
insert into ucret(Personel_Sicil_No,Maas_Tutar,Maas_Aldigi_Yil) values(125,3699.72,2020);


insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(1,111,1,'2020/02/21',13);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(1,116,1,'2020/02/21',16);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(2,111,1,'2020/07/14',11);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(3,118,2,'2020/01/01',17);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(4,114,3,'2019/12/30',12);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(5,120,1,'2020/04/12',20);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(6,121,2,'2020/07/18',12);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(7,112,1,'2020/04/19',11);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(8,112,1,'2020/03/11',11);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(9,115,2,'2019/11/21',11);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(10,117,3,'2019/11/22',17);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(11,119,1,'2020/01/04',19);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(11,111,1,'2020/01/04',11);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(12,114,2,'2020/03/26',14);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(13,121,1,'2020/08/14',18);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(14,112,4,'2020/01/03',16);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(15,112,6,'2020/01/01',16);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(16,112,2,'2020/01/02',12);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(17,115,1,'2020/09/12',13);
insert into Satin_Alinan(Musteri_No,Urun_Kodu,Urun_Adedi,Siparis_Tarihi,Magaza_No) values(17,118,4,'2020/01/01',14);

insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (11,111);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (11,112);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (11,115);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (12,112);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (12,121);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (12,114);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (13,111);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (13,115);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (13,113);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (14,114);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (14,115);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (14,118);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (15,115);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (15,112);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (16,112);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (16,116);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (17,117);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (17,118);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (18,118);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (18,121);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (19,119);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (19,111);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (20,120);
insert into Magaza_Urun(Magaza_No,Urun_Kod_Bilgi) values (20,111);

/*-----------------------SORGULAR------------------------*/


/*Ürün adı A veya D ile başlayan ürünlerin ilk 3 tanesinin ‘ürün adı’ ve ‘mağaza adı’ bilgilerini görüntüleyiniz*/

select u.Urun_Adı,m.Magaza_Adi from urun u
inner join magaza_urun mu on u.urun_kodu=mu.urun_kod_bilgi
inner join magaza m on m.magaza_no=mu.magaza_no
where Urun_Adı like 'a%' or Urun_Adı like 'd%' group by u.Urun_Adı limit 3;


/*Her ürünün hangi mağazada kaçar adet satıldığını görüntüleyiniz.*/

select m.Magaza_Adi,s.Urun_Adedi,u.Urun_Adı from Magaza m 
inner join Satin_Alinan s on m.Magaza_No=s.Magaza_No
inner join Urun u on s.Urun_Kodu = u.Urun_Kodu;



/*Personellere her yıl toplam ne kadar maaş ödendiğini grup bazlı gösteriniz.*/
select p.Personel_Adi,p.Personel_Soyadi,u.Maas_Tutar*12 as Yillik_Aldigi_Maas,u.Maas_Aldigi_Yil from Personel p
inner join Ucret u on p.Personel_Sicil_No=u.Personel_Sicil_No;



/*Var olan bir ürünün fiyatını güncelleyiniz.*/
update Urun set Urun.Urun_Fiyati=11503.7 where Urun_Kodu=111;
select Urun_Adı,Urun_Fiyati from urun where Urun_Kodu=111;

/*2019 yılı içersinde toplamda en fazla maaş alan personelin adını ve çalıştığı mağazanın adını görüntüleyen sorguyu yazınız.*/

select p.Personel_Adi,m.Magaza_Adi,max(u.Maas_Tutar)  from Magaza m 
inner join Personel p on p.Personel_Calistigi_Magaza_No = m.Magaza_No
inner join Ucret u  on p.Personel_Sicil_No=u.Personel_Sicil_No
where u.Maas_Aldigi_Yil=2019 group by u.Personel_Sicil_No order by u.Maas_Tutar desc limit 1;

-- create view kullanımları--
create view personelmagazaucret
as select p.Personel_Adi,m.Magaza_Adi,u.Maas_Tutar,u.Maas_Aldigi_Yil  from Magaza m 
inner join Personel p on p.Personel_Calistigi_Magaza_No = m.Magaza_No
inner join Ucret u  on p.Personel_Sicil_No=u.Personel_Sicil_No;
select Personel_Adi,Magaza_Adi from personelmagazaucret where  Maas_Aldigi_Yil=2019 order by maas_tutar desc limit 1;

-- 2 --
create view urunaved as
select u.Urun_Adı,m.Magaza_Adi from urun u
inner join magaza_urun mu on u.Urun_Kodu=mu.Urun_Kod_Bilgi
inner join magaza m on m.Magaza_No=mu.magaza_no
where u.Urun_Adı like 'a%' or u.Urun_Adı like 'd%' group by u.Urun_Adı limit 3;

-- 3 --
create view urunadet as
select u.Urun_Adı,m.Magaza_Adi,sa.Urun_Adedi from satin_alinan sa
inner join urun u on sa.Urun_Kodu=u.Urun_Kodu
inner join magaza m on m.Magaza_No=sa.Magaza_No;
select * from urunadet;

-- 4 --

create view persyılmaas as
select * from personel p
right join ucret u on p.Personel_Sicil_No=u.Personel_Sicil_No;

/*eğitim düzeyi yüksek lisans olan personellerin çalışttıpğı mağaza adı ve personel adı*/

select p.Personel_Adi,p.Personel_Soyadi,m.Magaza_Adi,ed.Egitim_Düzeyi from  egitim_duzeyi ed
inner join personel p on ed.egitim_no=p.Personel_Egitim_Bilgi_No
inner join magaza m on m.magaza_no=p.Personel_Calistigi_Magaza_No
where ed.Egitim_Düzeyi='Yüksek Lisans';

/*görevi mühendislik olan personellerin adını,görevini,çalıştığı mağazayı ve  eğitim düzeyini gösteren sorgu*/

select p.Personel_Adi,m.Magaza_Adi,g.Gorev_Adi,ed.Egitim_Düzeyi from gorev g 
inner join personel p on g.gorev_no=p.Personel_Gorev_Bilgisi_No
inner join egitim_duzeyi ed on ed.egitim_no=p.Personel_Egitim_Bilgi_No
inner join magaza m on m.magaza_no=p.Personel_Calistigi_Magaza_No
where g.Gorev_Adi='Mühendislik';

/*musterilerin aldığı ürün ve bu ürünü hangi mağazadan kaç adet aldığı bilgisini gösteren sorgu*/

select mu.Musteri_Adi,s.Urun_Adedi,u.Urun_Adı,m.Magaza_Adi from urun u 
inner join satin_alinan s on u.Urun_Kodu=s.Urun_Kodu
inner join magaza m on m.Magaza_no=s.Magaza_no
inner join musteri mu on mu.Musteri_No=s.Musteri_No;
