create database uas_a1143ug2_a11202113254;
use uas_a1143ug2_a11202113254;

create user 'a11202113254'@'%' identified by 'dimaspratama'; -- untuk membuat user
grant all privileges on uas_a1143ug2_a11202113254.* to 'a11202113254'@'%';   -- untuk memberikan hak akses ke user 13254
flush privileges; -- untuk menyimpan perubahan

create table data_sekolah_madrasah_aliyah(
    nsm_ma varchar(12) primary key,
    npsn varchar(8)not null unique,
    nama_m_aliyah varchar(100) not null,
    status_lembaga enum('MAN','MAS') not null,
    alamat text not null,
    provinsi varchar(50) not null,
    kabupaten_atau_kota varchar(50) not null,
    kecamatan varchar(50) not null,
    desa_atau_kelurahan varchar(50) not null,
    kode_pos varchar(5) not null
);

create table data_siswa_madrasah_aliyah(
    nis_lokal varchar(18) primary key,
    nisn varchar(10) unique not null,
    nik varchar(16) unique not null,
    nama_siswa varchar(100) not null,
    kota_kelahiran varchar(50) not null,
    tanggal date not null,
    jenis_kelamin enum('L','P') not null,
    tingkat_kelas enum('10', '11', '12') not null,
    jurusan enum('0', '1', '2', '3', '4') not null,
    kelas_paralel int unsigned not null,
    nomor_absen int unsigned not null,
    ranking_kelas int unsigned not null,
    tahun_masuk year(4) not null, -- klo ndak bisa jd varchar dulu
    nomor_urut_siswa varchar(4) not null,
    status_siswa enum('1', '2', '3', '4', '5') not null,
    asal_sekolah enum('1', '2', '3', '4', '5', '6'),
    hobi enum('1', '2', '3', '4', '5', '6') not null,
    cita_cita enum('1', '2', '3', '4', '5', '6', '7', '8') not null,
    jumlah_saudara int unsigned not null,
    agama enum('1', '2', '3', '4', '5', '6') not null,
    pilihan_bahasa_asing enum('1', '2', '3', '4', '5', '6'),
    status_tempat_tinggal_siswa enum('1', '2', '3', '4', '5', '6', '7') not null,
    wali_kelas varchar(100) not null,
    nsm_ma varchar(12) not null
);

create table data_alamat_siswa(
    jarak_rumah_sekolah enum('1', '2', '3', '4', '5') not null,
    jenis_transportasi enum('1', '2', '3', '4', '5', '6', '7', '8') not null,
    alamat text not null,
    provinsi varchar(50) not null,
    kabupaten_atau_kota varchar(50) not null,
    kecamatan varchar(50) not null,
    desa_atau_kelurahan varchar(50) not null,
    kode_pos varchar(5) not null,
    nis_lokal varchar(18) not null
);

create table data_nasional_siswa(
    nomor_peserta_un varchar(25) primary key,
    nomor_skhun varchar(25) not null unique,
    nomor_seri_ijazah varchar(25) not null unique,
    total_nilai_un int not null,
    tanggal date not null,
    nis_lokal varchar(18) unique null,
    npsn varchar(8) not null
);

create table data_jenjang_sekolah_sebelumnya(
    npsn varchar(8) primary key,
    jenis_sekolah enum('1', '2', '3', '4', '5', '6', '7') not null,
    status_sekolah enum ('1','2') not null,
    kabupaten_atau_kota varchar(50) not null
);

create table jenis_prestasi_siswa(
    kode_prestasi varchar(10) primary key,
    bidang_prestasi enum('1', '2', '3', '4', '5', '6', '7', '8', '9') not null
);

create table data_prestasi_siswa_terbaik(
    kode_prestasi varchar(10) primary key,
    bidang_prestasi enum('1', '2', '3', '4', '5', '6', '7', '8', '9') not null,
    tingkat_prestasi enum('1', '2', '3', '4') not null,
    peringkat_diraih enum('1', '2', '3', '4', '5', '6', '7') not null,
    tahun_meraih varchar(4) not null,
    nis_lokal varchar(18) not null
);

create table data_ortu_siswa(
    nomor_kk varchar(16) primary key,
    ratarata_penghasilan ENUM('1', '2', '3', '4', '5', '6') not null
);

create table extend_data_ortu_siswa(
    nomor_kk varchar(16) not null,
    nisn varchar(10) not null unique
);

create table data_ayah_kandung_siswa(
    nik_atau_nomorktp varchar(16) primary key,
    nama_ayah varchar(100) not null,
    pendidikan enum('1', '2', '3', '4', '5', '6', '7', '8', '9') not null,
    pekerjaan enum('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18') not null,
    nomor_kk varchar(16) not null
);

create table data_ibu_kandung_siswa(
    nik_atau_nomorktp varchar(16) primary key,
    nama_ibu varchar(100) not null,
    pendidikan enum('1', '2', '3', '4', '5', '6', '7', '8', '9') not null,
    pekerjaan enum('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18') not null,
    nomor_kk varchar(16) not null
);

create table data_wali_siswa(
    nik_atau_nomorktp varchar(16) primary key,
    nama varchar(100) not null,
    tahun_lahir year(4),
    pendidikan enum('1', '2', '3', '4', '5', '6', '7', '8', '9') not null,
    pekerjaan enum('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18') not null,
    penghasilan enum('1', '2', '3', '4', '5', '6') not null
);

create table extend_data_wali_siswa(
    nik_atau_nomorktp varchar(16) not null,
    nisn varchar(10) not null unique
);
-- membuat function
delimiter $$
create procedure prestasi(
    in kode_prestasi varchar(5),
    in bidang_prestasi enum('1', '2', '3', '4', '5', '6', '7', '8', '9')
)
begin
    insert into jenis_prestasi_siswa(kode_prestasi, bidang_prestasi) values(kode_prestasi, bidang_prestasi);
end$$


alter table data_siswa_madrasah_aliyah
    add constraint fk_data_siswa_madrasah_aliyah_nis_lokal
        foreign key data_siswa_madrasah_aliyah(nsm_ma) references data_sekolah_madrasah_aliyah(nsm_ma) on update cascade;

alter table data_prestasi_siswa_terbaik
    add constraint fk_prestasi_data_siswa_madrasah_aliyah
        foreign key data_prestasi_siswa_terbaik(nis_lokal) references data_siswa_madrasah_aliyah(nis_lokal) on update cascade;

alter table data_alamat_siswa
    add constraint fk_tempat_tinggal_data_siswa_madrasah_aliyah
        foreign key data_alamat_siswa(nis_lokal) references data_siswa_madrasah_aliyah(nis_lokal) on update cascade;

alter table data_nasional_siswa
    add constraint fk_dokumen_data_siswa_madrasah_aliyah
        foreign key data_nasional_siswa(nis_lokal) references data_siswa_madrasah_aliyah(nis_lokal) on update cascade;

alter table data_nasional_siswa
    add constraint fk_dokumen_asal_sekolah
        foreign key data_nasional_siswa(npsn) references data_jenjang_sekolah_sebelumnya(npsn) on update cascade;

alter table data_ayah_kandung_siswa
    add constraint fk_data_ayah_kandung_siswa_nomor_kk
        foreign key data_ayah_kandung_siswa(nomor_kk) references data_ortu_siswa(nomor_kk) on update cascade;

alter table data_ibu_kandung_siswa
    add constraint fk_data_ibu_kandung_siswa_nomor_kk
        foreign key data_ibu_kandung_siswa(nomor_kk) references data_ortu_siswa(nomor_kk) on update cascade;

alter table jenis_prestasi_siswa
    add constraint fk_jenis_prestasi_kode
        foreign key jenis_prestasi_siswa(kode_prestasi) references data_prestasi_siswa_terbaik(kode_prestasi) on update cascade;

alter table extend_data_ortu_siswa
    add constraint fk_wali_ortu_nomor_kk
        foreign key extend_data_ortu_siswa(nomor_kk) references data_ortu_siswa(nomor_kk) on update cascade;

alter table extend_data_ortu_siswa
    add constraint fk_wali_ortu_nis_lokal
        foreign key extend_data_ortu_siswa(nisn) references data_siswa_madrasah_aliyah(nisn) on update cascade;

alter table extend_data_wali_siswa
    add constraint fk_wali_bukan_ortu_nomor_kk
        foreign key extend_data_wali_siswa(nik_atau_nomorktp) references data_wali_siswa(nik_atau_nomorktp) on update cascade;

alter table extend_data_wali_siswa
    add constraint fk_extend_data_wali_siswa_nisn
        foreign key extend_data_wali_siswa(nisn) references data_siswa_madrasah_aliyah(nisn) on update cascade;

delimiter $$
create trigger insert_nis_lokal
    before insert on data_siswa_madrasah_aliyah for each row
begin declare nis_lokal varchar(18);
    set nis_lokal = concat(new.nsm_ma, substring(new.tahun_masuk, 3, 2), lpad(new.nomor_urut_siswa, 4, '0'));
    set new.nis_lokal = nis_lokal;
end$$

delimiter $$
create function format_tanggal(tanggal date)
    returns varchar(10) deterministic
begin return date_format(tanggal, '%d/%m/%Y');
end $$

insert into data_sekolah_madrasah_aliyah values
('148833032751','84257259','Madrasah Aliyah Negeri 2 Semarang','1','Jl. Bangetayu Raya No.1','Jawa Tengah','Kota Semarang','Genuk','Bangetayu Kulon','50115');

insert into data_siswa_madrasah_aliyah
    (nisn, nik, nama_siswa, kota_kelahiran, tanggal, jenis_kelamin,
     tingkat_kelas, jurusan, kelas_paralel, nomor_absen, ranking_kelas, tahun_masuk,
     nomor_urut_siswa, status_siswa, asal_sekolah, hobi, cita_cita, jumlah_saudara,
     agama, pilihan_bahasa_asing, status_tempat_tinggal_siswa, wali_kelas, nsm_ma) values
('0010999752','6558002438017609','Hana Mardhiyah','Sabang','2007-12-14','P','10','3','01','5','3','2023','1','5','4','2','2','1','1','1','1','Pak Sopo','148833032751'),
('0089904502','6873890701416766','Ricky Sihombing','Bandung','2007-12-21','L','10','3','02','1','4','2023','2','5','1','4','1','1','1','3','2','Pak Sopo','148833032751'),
('0041747417','4445428416085647','Jarwo Dirgantoro','Malang','2006-01-26','L','10','2','01','4','4','2023','3','5',NULL,'4','1','3','1',NULL,'1','Pak Adit','148833032751'),
('0009652943','2503924502639539','Nabila Pertiwi','Weda','2006-06-20','P','10','3','03','4','1','2023','4','5','4','5','6','1','1','1','1','Pak Adit','148833032751'),
('0089548345','8195253591138174','Zulfa Laksita','Curup','2007-03-27','P','10','2','01','1','1','2023','5','5','1','1','1','2','1',NULL,'3','Pak Jarwo','148833032751'),
('0086837311','9787791608027638','Argono Suwarno','Takengon','2007-04-06','L','10','4','01','2','5','2023','6','5','1','2','3','2','1',NULL,'1','Pak Adit','148833032751'),
('0031014689','4862752412215041','Janet Novitasari','Tarempa','2007-08-13','P','10','3','02','4','1','2023','7','5','4','3','1','1','1','1','2','Pak Sopo','148833032751'),
('0021029226','1124415591887662','Fitriani Mulyani','Andolo','2006-05-11','P','10','2','02','5','2','2023','8','5',NULL,'6','5','3','1',NULL,'1','Pak Jarwo','148833032751'),
('0040034482','8730232580572014','Bala Tampubolon','Paringin','2007-05-04','L','10','3','02','2','3','2023','9','5',NULL,'3','1','1','1','1','1','Pak Jarwo','148833032751'),
('0013471285','6677259669637506','Edi Nasrudin','Semarang','2007-05-29','L','10','4','03','1','3','2023','10','5','2','2','1','1','1',NULL,'3','Pak Jarwo','148833032751'),
('0005604803','6727800929571720','Aisyah Rahmawati','Cianjur','2006-05-19','P','10','2','01','3','2','2023','11','5','1','1','4','1','1',NULL,'2','Pak Sopo','148833032751'),
('0036201716','5045734112312927','Mulyono Dabuk','Surabaya','2006-06-09','L','10','4','03','2','2','2023','12','5','1',1,'1','2','1',NULL,'1','Pak Adit','148833032751'),
('0041928040','7374094479300677','Halima Winarsih','Balikpapan','2006-11-03','P','10','1','02','3','5','2023','13','5','2','3','1','2','1',NULL,'1','Pak Adit','148833032751'),
('0038342945','4530674826417263','Danang Saefullah','Palembang','2006-12-29','L','10','4','03','5','4','2023','14','5','1','2','6','2','1',NULL,'3','Pak Jarwo','148833032751'),
('0047558525','4182538619295154','Kurni Wibowo','Magelang','2006-01-28','P','10','2','03','3','5','2023','15','5','1','2','1','1','1',NULL,'2','Pak Sopo','148833032751');

insert into data_ortu_siswa values
('3917848269027845','4'),
('0881902534550605','2'),
('9489357418640496','2'),
('2718464290570532','3'),
('4913397441967633','3'),
('1918886090103313','2'),
('2597195615221804','3'),
('3502619792856072','3'),
('1407968283231633','3'),
('1223960001557047','4'),
('2639468388635686','4'),
('3536667093160022','5'),
('7874942478776684','4');

insert into extend_data_ortu_siswa values
('3917848269027845','0010999752'),
('0881902534550605','0089904502'),
('9489357418640496','0041747417'),
('2718464290570532','0009652943'),
('4913397441967633','0089548345'),
('1918886090103313','0031014689'),
('2597195615221804','0021029226'),
('3502619792856072','0040034482'),
('1407968283231633','0013471285'),
('1223960001557047','0036201716'),
('2639468388635686','0041928040'),
('3536667093160022','0038342945'),
('7874942478776684','0047558525');

insert into data_ayah_kandung_siswa values
('6558002438017609','Pandu Hardiansyah','6','17','3917848269027845'),
('6873890701416766','Cahyanto Hutagalung','5','11','0881902534550605'),
('4445428416085647','Enteng Wacana','6','15','9489357418640496'),
('2503924502639539','Harto Maulana','5','15','2718464290570532'),
('8195253591138174','Dartono Putra','5','7','4913397441967633'),
('4862752412215041','Wasis Sitorus','8','6','1918886090103313'),
('1124415591887662','Gada Ramadhan','7','6','2597195615221804'),
('8730232580572014','Opung Hidayanto','7','5','3502619792856072'),
('6677259669637506','Cahyo Damanik','6','17','1407968283231633'),
('5045734112312927','Jono Wibowo','6','8','1223960001557047'),
('7374094479300677','Satya Waskita','7','6','2639468388635686'),
('4530674826417263','Narji Uwais','7','10','3536667093160022'),
('4182538619295154','Bagus Rajata','8','13','7874942478776684');

insert into data_ibu_kandung_siswa values
('6558002438017609','Tari Zulaika','5','5','3917848269027845'),
('6873890701416766','Aisyah Safitri','5','13','0881902534550605'),
('4445428416085647','Janet Nuraini','8','11','9489357418640496'),
('2503924502639539','Usyi Nasyiah','7','7','2718464290570532'),
('8195253591138174','Ratna Agustina','5','3','4913397441967633'),
('4862752412215041','Lili Pudjiastuti','6','8','1918886090103313'),
('1124415591887662','Nabila Hasanah','7','4','2597195615221804'),
('8730232580572014','Titin Narunah','5','6','3502619792856072'),
('6677259669637506','Zulaikha Winarsih','5','3','1407968283231633'),
('5045734112312927','Dinda Melani','7','5','1223960001557047'),
('7374094479300677','Kezia Pratiwi','6','6','2639468388635686'),
('4530674826417263','Cornelia Safitri','5','5','3536667093160022'),
('4182538619295154','Dewi Astuti','8','4','7874942478776684');

insert into data_wali_siswa values
('3471641196810060','Vero Maheswara','1981','5','3','2'),
('0942128325282286','Jaya Susilo','1984','4','1','5');

insert into extend_data_wali_siswa values
('3471641196810060','0086837311'),
('0942128325282286','0005604803');

insert into data_prestasi_siswa_terbaik values
('A1134','1','1','1','2023','148833032751230005'),
('A1487','2','1','1','2023','148833032751230009');

call prestasi('A1134','1');
call prestasi('A1487','2');

insert into data_alamat_siswa values
('1','3','Jl Imam Bonjol 16','Jawa Tengah','Semarang','Banyumanik','Ngesrep','34269','148833032751230001'),
('2','3','Jl Thamrin 75','Jawa Tengah','Semarang','Tembalang','Bulusan','94458','148833032751230002'),
('3','4','Jl Mampang Prapatan Raya 1','Jawa Tengah','Semarang','Tugu','Jerakah','00338','148833032751230003'),
('2','3','Jl Jendral Achmad Yani 94','Jawa Tengah','Semarang','Tembalang','Jangli','71300','148833032751230004'),
('1','3','Jl Sindang Palah 9','Jawa Tengah','Semarang','Tugu','Karanganyar','61159','148833032751230005'),
('1','4','Jl Imam Bonjol 533','Jawa Tengah','Semarang','Tugu','Mangkang Wetan','33243','148833032751230006'),
('2','1','Jl Cipinang Lontar 2','Jawa Tengah','Semarang','Banyumanik','Pudakpayung','31064','148833032751230007'),
('2','3','Jl Abdul Rahman Saleh 30','Jawa Tengah','Semarang','Pedurungan','Gemah','42180','148833032751230008'),
('2','5','Jl Letjen Haryono 11','Jawa Tengah','Semarang','Tembalang','Meteseh','53733','148833032751230009'),
('2','6','Jl Kokosan 5','Jawa Tengah','Semarang','Tembalang','Sambiroto','81592','148833032751230010'),
('3','6','Jl Percetakan Negara 23','Jawa Tengah','Semarang','Tugu','Mangunharjo','13491','148833032751230006'),
('1','3','Jl Kokrosono 7','Jawa Tengah','Semarang','Pedurungan','Kalisari','31541','148833032751230007'),
('1','3','Jl Budi Luhur 106','Jawa Tengah','Semarang','Pedurungan','Muktiharjo','37261','148833032751230008'),
('1','6','Jl Pungkur 36','Jawa Tengah','Semarang','Banyumanik','Gedawang','86328','148833032751230009'),
('3','3','Jl Sisingamangaraja 32','Jawa Tengah','Semarang','Tembalang','Kedungmundu','93140','148833032751230010');

select * from data_siswa_madrasah_aliyah;
select * from extend_data_ortu_siswa;
select * from extend_data_wali_siswa;
select * from data_ortu_siswa;
select * from data_prestasi_siswa_terbaik;
select * from jenis_prestasi_siswa;
select nis_lokal,nama_siswa,kelas_paralel from data_siswa_madrasah_aliyah;
select format_tanggal(tanggal) from data_siswa_madrasah_aliyah;

create view data_keluarga as
select data_siswa_madrasah_aliyah.nisn, data_siswa_madrasah_aliyah.nama_siswa,data_ortu_siswa.nomor_kk,data_ayah_kandung_siswa.nama_ayah,data_ibu_kandung_siswa.nama_ibu
from data_siswa_madrasah_aliyah
inner join extend_data_ortu_siswa on data_siswa_madrasah_aliyah.nisn = extend_data_ortu_siswa.nisn
inner join data_ortu_siswa on extend_data_ortu_siswa.nomor_kk = data_ortu_siswa.nomor_kk
inner join data_ayah_kandung_siswa on data_ortu_siswa.nomor_kk = data_ayah_kandung_siswa.nomor_kk
inner join data_ibu_kandung_siswa on data_ortu_siswa.nomor_kk = data_ibu_kandung_siswa.nomor_kk;
select * from data_keluarga;

create view data_wali_siswa_madrasah as
select data_siswa_madrasah_aliyah.nisn, data_siswa_madrasah_aliyah.nama_siswa,data_wali_siswa.nik_atau_nomorktp,data_wali_siswa.nama
from data_siswa_madrasah_aliyah
inner join extend_data_wali_siswa on data_siswa_madrasah_aliyah.nisn = extend_data_wali_siswa.nisn
inner join data_wali_siswa on extend_data_wali_siswa.nik_atau_nomorktp = data_wali_siswa.nik_atau_nomorktp;

select * from data_wali_siswa_madrasah;
select * from data_keluarga;
select format_tanggal(tanggal) as 'Tanggal Lahir' from data_siswa_madrasah_aliyah;
select format_tanggal(tanggal) as 'Tanggal Masuk' from data_nasional_siswa;
select * from data_siswa_madrasah_aliyah;

# drop database uas_a1143ug2_a11202113254;

-- mengecek user
select user,host from mysql.user;

-- menghapus user
# drop user 'a11202113254'@'%';