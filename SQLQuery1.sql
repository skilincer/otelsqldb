/*Kan Grubu*/

create table KanGrubu(
kan_grubu_id int primary key identity(1,1) not null,
kan_grubu_tanim varchar(10) not null,
)

/*Cinsiyet*/

create table Cinsiyet(
cinsiyet_id int primary key identity(1,1) not null,
cinsiyet_tanim varchar(5) not null,
)

/*Maas*/
create table Maas(
maas_id int primary key identity(1,1) not null,
saatlik_ucret int not null,
baslangic_saati time not null,
bitis_saati time not null,
maas int not null,
p_id int foreign key references Personel(p_id) not null,
sezon_id int foreign key references Sezonlar(sezon_id) not null,

)

/*Vardiya */

create table Vardiya(
vardiya_id int primary key identity(1,1) not null,
baslangic_saati time not null,
bitis_saati time not null,
p_id int foreign key references Personel(p_id) not null,
)

/*Bölüm */

create table Bolum(
bolum_id int primary key identity(1,1) not null,
bolum_adý varchar(30) not null,
gorevi varchar(30) not null,
bolum_yöneticisi varchar(30) not null,
otel_id int foreign key references Otel(otel_id) not null,
)

/*Sezonlar */

create table Sezonlar(
sezon_id int primary key identity(1,1) not null,
sezon_tanim varchar(30) not null,
baslangic_tarihi time not null,
bitis_tarihi time not null,
otel_id int foreign key references Otel(otel_id) not null,
)

/*Rezervasyon */

create table Rezervasyon(
r_id int primary key identity(1,1) not null,
rezervasyon_tanim varchar(30) not null,
otel_id int foreign key references Otel(otel_id) not null,
oda_id int foreign key references Oda(oda_id) not null,
sezon_id int foreign key references Sezonlar(sezon_id) not null,

)

/*Oda Durum*/
create table OdaDurum(
durum_id int primary key identity(1,1) not null,
durum_bilgi varchar(50) not null,
)


/*Oda Fiyatlarý*/
create table OdaFiyat(
fiyat_id int primary key identity(1,1) not null,
tarife varchar(30) not null,
oda_id int foreign key references Oda(oda_id) not null,
sezon_id int foreign key references Sezonlar(sezon_id) not null,
)

/*Oda Tipi*/
create table OdaTipi(
tip_id int primary key identity(1,1) not null,
oda_tip_tanim varchar(30) not null,
)

/*Oda  */	

create table Oda(
oda_id int primary key identity(1,1) not null,
bulundugu_kat int not null,
otel_id int foreign key references Otel(otel_id) not null,
tip_id int foreign key references OdaTipi(tip_id) not null,
durum_id int foreign key references OdaDurum(durum_id) not null,
)

/*Otel  */	
create table Otel(
otel_id int primary key identity(1,1) not null,
otel_adi varchar(30) not null,
telefon varchar(15) not null,
mail varchar(20) not null,
oda_sayisi int not null,
adres varchar(50),
website varchar(20),
kalite varchar(10),
)

/*Personel  */	
create table Personel(
p_id int primary key identity(1,1) not null,
tc_kimlik varchar(15) not null,
p_adi varchar(20) not null,
p_soyadi varchar(20) not null,
mail varchar(20) not null,
telefon varchar(15) not null,
adres varchar(50),
yas int not null,
bolum_id int foreign key references Bolum(bolum_id) not null,
cinsiyet_id int foreign key references Cinsiyet(cinsiyet_id) not null,
kan_grubu_id int foreign key references KanGrubu(kan_grubu_id) not null,
)

/*Müþteriler  */	
create table Müþteriler(
m_id int primary key identity(1,1) not null,
tc_kimlik varchar(15) not null,
m_adi varchar(20) not null,
m_soyadi varchar(20) not null,
mail varchar(20) not null,
telefon varchar(15) not null,
adres varchar(50),
uyruk varchar(15),
yas int not null,
medeni_durum varchar(10),
cinsiyet_id int foreign key references Cinsiyet(cinsiyet_id) not null,
kan_grubu_id int foreign key references KanGrubu(kan_grubu_id) not null,
)