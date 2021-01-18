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
