/*
Navicat MySQL Data Transfer

Source Server         : server128
Source Server Version : 50719
Source Host           : 192.168.0.128:3306
Source Database       : ais_inventory

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-06 12:28:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for data_check_in
-- ----------------------------
DROP TABLE IF EXISTS `data_check_in`;
CREATE TABLE `data_check_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_check_in` varchar(255) DEFAULT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `qty_jenis` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `keterangan` text,
  `user_check_in` int(11) DEFAULT NULL,
  `date_check_in` date DEFAULT NULL,
  `sample_foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of data_check_in
-- ----------------------------

-- ----------------------------
-- Table structure for data_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `data_pegawai`;
CREATE TABLE `data_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_induk` varchar(255) DEFAULT NULL,
  `nama_pegawai` varchar(255) DEFAULT NULL,
  `jabatan_pegawai` int(11) DEFAULT NULL,
  `level_pegawai` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `status_pegawai` varchar(255) DEFAULT NULL,
  `foto_pegawai` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of data_pegawai
-- ----------------------------

-- ----------------------------
-- Table structure for data_profile_sekolah
-- ----------------------------
DROP TABLE IF EXISTS `data_profile_sekolah`;
CREATE TABLE `data_profile_sekolah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sekolah` varchar(255) DEFAULT NULL,
  `logo_sekolah` varchar(255) DEFAULT NULL,
  `alamat_sekolah` varchar(255) DEFAULT NULL,
  `tlp_sekolah` varchar(20) DEFAULT NULL,
  `fax_sekolah` varchar(20) DEFAULT NULL,
  `email_sekolah` varchar(255) DEFAULT NULL,
  `web_sekolah` varchar(255) DEFAULT NULL,
  `sejarah_sekolah` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of data_profile_sekolah
-- ----------------------------

-- ----------------------------
-- Table structure for master_department
-- ----------------------------
DROP TABLE IF EXISTS `master_department`;
CREATE TABLE `master_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_department` varchar(255) DEFAULT NULL,
  `nama_department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_department
-- ----------------------------
INSERT INTO `master_department` VALUES ('5', 'EC', 'Early Childhood');
INSERT INTO `master_department` VALUES ('6', 'Pr', 'Primary');
INSERT INTO `master_department` VALUES ('7', 'Sec', 'Secondary');
INSERT INTO `master_department` VALUES ('8', 'JC', 'Junior Colage');
INSERT INTO `master_department` VALUES ('9', 'ADM', 'Addmission');
INSERT INTO `master_department` VALUES ('10', 'MU', 'Maintenance Unit');
INSERT INTO `master_department` VALUES ('11', 'SPO', 'SP-Office');

-- ----------------------------
-- Table structure for master_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `master_jabatan`;
CREATE TABLE `master_jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_jabatan` varchar(255) DEFAULT NULL,
  `nama_jabatan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_jabatan
-- ----------------------------

-- ----------------------------
-- Table structure for master_jenis
-- ----------------------------
DROP TABLE IF EXISTS `master_jenis`;
CREATE TABLE `master_jenis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(11) DEFAULT NULL,
  `kode_jenis` varchar(255) DEFAULT NULL,
  `nama_jenis` varchar(255) DEFAULT NULL,
  `sample_foto` varchar(255) DEFAULT NULL,
  `date_purchase` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_jenis
-- ----------------------------
INSERT INTO `master_jenis` VALUES ('1', '8', 'Meja Venus', 'Meja Samping Venus.VD 100x45x65 Abu', '', '2007-01-18', '2');
INSERT INTO `master_jenis` VALUES ('2', '8', 'Lemari', 'Laci Gantung Venus.VP 82 Abu-Abu', '', '2007-01-18', '1');
INSERT INTO `master_jenis` VALUES ('3', '8', 'Kursi Chitose', 'Kursi Sakata  N Chitose Biru', '', '2007-01-22', '8');
INSERT INTO `master_jenis` VALUES ('4', '8', 'Lemari Arsip', 'Filling Cabinet Type C4-BK1-18', '', '2007-03-26', '1');
INSERT INTO `master_jenis` VALUES ('5', '8', 'Lemari', 'Rak / Organizer u/ menyimpan Brosur ', '', '2007-04-19', '1');
INSERT INTO `master_jenis` VALUES ('6', '8', 'Kursi Chitose', 'Kursi Chitose New Caesar N Chair', '', '2007-06-07', '4');
INSERT INTO `master_jenis` VALUES ('7', '8', 'Meja', 'Meja 120x60x75 Venus. VD102G Abu-Abu', '', '2007-06-07', '4');
INSERT INTO `master_jenis` VALUES ('8', '8', 'Lemari', 'Lemari Venus. VS78G Abu-Abu', '', '2007-06-07', '1');
INSERT INTO `master_jenis` VALUES ('9', '8', 'Meja', 'GO Working Table 6 Workstation', '', '2007-06-28', '4');
INSERT INTO `master_jenis` VALUES ('10', '8', 'Lemari', 'Rak Buku Perpustakaan', '', '2007-07-19', '10');
INSERT INTO `master_jenis` VALUES ('11', '8', 'Kursi Oya', 'Kursi Oya Kids', '', '2007-07-31', '4');
INSERT INTO `master_jenis` VALUES ('12', '8', 'Meja Oya', 'Meja Oya Kids', '', '2007-07-31', '1');
INSERT INTO `master_jenis` VALUES ('13', '8', '', '.elian 1 bh. Meja Mimbar u/ Mushola', '', '2007-08-01', '1');
INSERT INTO `master_jenis` VALUES ('14', '8', 'Kursi Dhanka', '25 bh. Kursi Dankha D.300.NS22', '', '2007-08-01', '25');
INSERT INTO `master_jenis` VALUES ('15', '8', 'Kursi Dhanka', '2 bh. Kursi Dankha D.610.AL048', '', '2007-08-01', '2');
INSERT INTO `master_jenis` VALUES ('16', '8', '', '6 bh. Meja Kantor Venus VD102G 120x60x75 cm', '', '2007-08-01', '6');
INSERT INTO `master_jenis` VALUES ('17', '8', '', '2 bh. Lemari Buku Kantor Venus VS78G', '', '2007-08-01', '2');
INSERT INTO `master_jenis` VALUES ('18', '8', '', 'Meja Kantor Venus VD60C 160x75x75 cm', '', '2007-08-01', '1');
INSERT INTO `master_jenis` VALUES ('19', '8', '', '1 bh. Meja Kantor Venus VD02C', '', '2007-08-01', '1');
INSERT INTO `master_jenis` VALUES ('20', '8', '', '1 bh. Laci Meja Kantor Venus VP82C', '', '2007-08-01', '1');
INSERT INTO `master_jenis` VALUES ('21', '8', '', ' 5 lbr Karpet Uk 4 x 7.5 m u/ Mushola', '', '2007-08-01', '5');
INSERT INTO `master_jenis` VALUES ('22', '8', '', '26 Meja & Kursi Makan u/ Kantin AIS', '', '2007-08-01', '26');
INSERT INTO `master_jenis` VALUES ('23', '8', 'Kursi Oya', '\"Oya Kids Chair & Table\" u/ Kelas', '', '2007-08-08', '4');
INSERT INTO `master_jenis` VALUES ('24', '8', 'Kursi Oya', '\"Oya Kids Chair & Table\" u/ Kelas', '', '2007-08-09', '4');
INSERT INTO `master_jenis` VALUES ('25', '8', '', '8 Lembar Karpet u/ di Mushola AIS', '', '2007-08-23', '8');
INSERT INTO `master_jenis` VALUES ('26', '8', '', '36 Unit Locker Siswa', '', '2007-08-30', '36');
INSERT INTO `master_jenis` VALUES ('27', '8', '', '25 Unit meja Komputer', '', '2007-08-30', '25');
INSERT INTO `master_jenis` VALUES ('28', '8', 'Kursi Tunggu', '4 Bh. Kursi Tunggu Fiber 4 Dudukan', '', '2007-10-05', '25');
INSERT INTO `master_jenis` VALUES ('29', '8', '', 'Meja Periksa Polos / Ruang UKS', '', '2007-11-01', '25');
INSERT INTO `master_jenis` VALUES ('30', '8', '', 'Vertical Blind Type 6609 - 1839 m2', '', '2007-11-22', '25');
INSERT INTO `master_jenis` VALUES ('31', '8', '', 'Kursi & Meja Echool No 3', '', '2007-12-26', '100');
INSERT INTO `master_jenis` VALUES ('32', '8', '', 'Kursi & Meja Echool No  5 ', '', '2007-12-26', '80');
INSERT INTO `master_jenis` VALUES ('33', '8', '', 'Filling Cabinet Type 104-Laci 4', '', '2008-01-07', '1');
INSERT INTO `master_jenis` VALUES ('34', '8', '', 'Filling Cabinet Type VS78 Grey', '', '2008-01-07', '1');
INSERT INTO `master_jenis` VALUES ('35', '8', '', 'Tandu', '', '2008-03-31', '1');
INSERT INTO `master_jenis` VALUES ('36', '8', 'Lemari', 'Key Box', '', '2008-04-18', '1');
INSERT INTO `master_jenis` VALUES ('37', '8', '', 'Meja Laboratorium u/ Demonstrasi Guru', '', '2008-04-18', '1');
INSERT INTO `master_jenis` VALUES ('38', '8', 'Kursi Chitose', 'Kursi Chitose Echool No. 5', '', '2008-08-07', '25');
INSERT INTO `master_jenis` VALUES ('39', '8', 'Meja Chitose', 'Meja Chitose Echool No. 5', '', '2008-08-07', '25');
INSERT INTO `master_jenis` VALUES ('40', '8', 'Kursi Chitose', 'Kursi Chitose Caesar N', '', '2008-08-07', '3');
INSERT INTO `master_jenis` VALUES ('41', '8', '', 'Etalase Koperasi Uk. 150 x 44 x 100 Cm', '', '2008-08-15', '2');
INSERT INTO `master_jenis` VALUES ('42', '8', '', 'Etalase Kantin Uk. 150 x 70 x 148 Cm', '', '2008-08-15', '1');
INSERT INTO `master_jenis` VALUES ('43', '8', '', 'Lemari ( u/ Zat & Perlengkapan Lab. Science)', '', '2008-08-21', '1');
INSERT INTO `master_jenis` VALUES ('44', '8', '', 'Meja Guru 1/2 Biro Kayu', '', '2008-09-20', '5');
INSERT INTO `master_jenis` VALUES ('45', '8', '', ' Locker Siswa', '', '2008-09-25', '5');
INSERT INTO `master_jenis` VALUES ('46', '8', '', 'Meja & Kursi Kantin Sekolah Al-Irsyad Satya', '', '2009-01-21', '2');
INSERT INTO `master_jenis` VALUES ('47', '8', '', 'Meja Praktikum', '', '2009-02-05', '8');
INSERT INTO `master_jenis` VALUES ('48', '8', '', 'Meja Layanan Wastafel & Gas', '', '2009-02-05', '2');
INSERT INTO `master_jenis` VALUES ('49', '8', '', 'Kursi Praktikum', '', '2009-02-05', '16');
INSERT INTO `master_jenis` VALUES ('50', '8', '', 'Filling Cabinet', '', '2009-03-13', '2');
INSERT INTO `master_jenis` VALUES ('51', '8', '', 'Lemari Pintu Kaca', '', '2009-04-06', '2');
INSERT INTO `master_jenis` VALUES ('52', '8', '', 'Lemari Pintu Biasa', '', '2009-04-06', '4');
INSERT INTO `master_jenis` VALUES ('53', '8', '', 'Flipchart Bergaris 60 x 90 cm', '', '2009-04-06', '2');
INSERT INTO `master_jenis` VALUES ('54', '8', '', 'Meja 1/2 Biro Venus VD40-A', '', '2009-04-06', '1');
INSERT INTO `master_jenis` VALUES ('55', '8', '', 'White Board 120 x 240 cm', '', '2009-04-06', '2');
INSERT INTO `master_jenis` VALUES ('56', '8', '', 'White Board 90 x 180 cm', '', '2009-04-06', '5');
INSERT INTO `master_jenis` VALUES ('57', '8', '', 'Karpet ul Ruangan Kelas Art & Music', '', '2009-04-17', '1');
INSERT INTO `master_jenis` VALUES ('58', '8', '', 'Meja 1/2 Biro Kayu u/ Guru', '', '2009-05-15', '1');
INSERT INTO `master_jenis` VALUES ('59', '8', '', '.. Vertikal Blind u/ Ruangan Kelas Komputer', '', '2009-07-27', '1');
INSERT INTO `master_jenis` VALUES ('60', '8', '', 'Kursi Baca - Chitose Ceasar N', '', '2009-07-30', '10');
INSERT INTO `master_jenis` VALUES ('61', '8', '', 'Kursi Guru - Chitose Ceasar N', '', '2009-07-30', '2');
INSERT INTO `master_jenis` VALUES ('62', '8', '', 'Lemari Pintu Tanpa Kaca', '', '2009-08-13', '5');
INSERT INTO `master_jenis` VALUES ('63', '8', '', 'Lemari Pintu Kaca', '', '2009-08-13', '2');
INSERT INTO `master_jenis` VALUES ('64', '8', '', 'Panggung Uk. 120x120x50 cm', '', '2009-09-17', '8');
INSERT INTO `master_jenis` VALUES ('65', '8', '', 'Locker u/ Siswa', '', '2009-10-05', '14');
INSERT INTO `master_jenis` VALUES ('66', '8', '', 'Meja 1/2 Giro', '', '2009-10-05', '2');
INSERT INTO `master_jenis` VALUES ('67', '8', '', 'Kursi & Meja Chitose Echoll No. 5', '', '2009-10-15', '13');
INSERT INTO `master_jenis` VALUES ('68', '8', '', 'Meja Rapat UNO-UCT 1731 A (Beech)', '', '2009-12-04', '5');
INSERT INTO `master_jenis` VALUES ('69', '8', '', 'Meja Persegi UNO-UOD 1036 (Beech)', '', '2009-12-04', '3');
INSERT INTO `master_jenis` VALUES ('70', '8', '', 'Meja / Station Layanan Kelas Lab.', '', '2010-01-25', '2');
INSERT INTO `master_jenis` VALUES ('71', '8', '', 'Filling Cabinet Lion - L44', '', '2010-02-22', '3');
INSERT INTO `master_jenis` VALUES ('72', '8', '', 'Lemari Besi Lion - L33', '', '2010-02-22', '1');
INSERT INTO `master_jenis` VALUES ('73', '8', '', 'Meja-Kursi Lab. Komputer (u/ 20 Siswa)', '', '2010-03-22', '1');
INSERT INTO `master_jenis` VALUES ('74', '8', '', 'Meja-Kursi Future ClassRoom  20 Siswa 1 Guru', '', '2010-03-22', '1');
INSERT INTO `master_jenis` VALUES ('75', '8', '', 'Meja - Kursi Guru', '', '2010-08-09', '4');
INSERT INTO `master_jenis` VALUES ('76', '8', '', 'Meja Kursi Chitose Echool No. 3', '', '2010-08-16', '12');
INSERT INTO `master_jenis` VALUES ('77', '8', '', 'Meja Kursi Chitose Echool No. 6', '', '2010-08-16', '50');
INSERT INTO `master_jenis` VALUES ('78', '8', '', 'Locker Siswa', '', '2010-08-16', '20');
INSERT INTO `master_jenis` VALUES ('79', '8', '', 'Lemari Seragam', '', '2010-08-27', '1');
INSERT INTO `master_jenis` VALUES ('80', '8', '', 'Lemari Buku', '', '2010-08-27', '1');
INSERT INTO `master_jenis` VALUES ('81', '8', '', 'Meja 1/2 Biro 120x60x75 cm Grey', '', '2010-09-07', '6');
INSERT INTO `master_jenis` VALUES ('82', '8', '', ' Lemari Tanpa Pintu 80x40x87 cm Grey', '', '2010-09-07', '18');
INSERT INTO `master_jenis` VALUES ('83', '8', '', 'Lemari Pintu 80x40x87 cm Grey', '', '2010-09-07', '18');
INSERT INTO `master_jenis` VALUES ('84', '8', '', 'Stasiun Layanan @Rp.3.000.000', '', '2010-09-30', '2');
INSERT INTO `master_jenis` VALUES ('85', '8', '', 'Meja Praktikum Siswa @Rp.2.500.000', '', '2010-09-30', '4');
INSERT INTO `master_jenis` VALUES ('86', '8', '', 'Kursi Praktikum Siswa @Rp.235.000', '', '2010-09-30', '8');
INSERT INTO `master_jenis` VALUES ('87', '8', '', '1 Set Vertical Blind  u/ 5 Jendela', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('88', '8', '', '1 Set Rak Selving', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('89', '8', '', '1 Set Fire Blanket', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('90', '8', '', '1 Unit Lemari Material', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('91', '8', '', '1 Set Hanging Cabinet', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('92', '8', '', '1 Unit Laptop Cupboard 10 Laci', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('93', '8', '', '2 Unit Meja Kerja tanpa Laci', '', '2010-10-11', '2');
INSERT INTO `master_jenis` VALUES ('94', '8', 'Kursi', '16 unit Kursi Putar', '', '2010-10-11', '16');
INSERT INTO `master_jenis` VALUES ('95', '8', '', '1 Set Meja Kursi Guru', '', '2010-10-11', '1');
INSERT INTO `master_jenis` VALUES ('96', '8', '', 'locker 4 pintu 22 bh u/ siswa', '', '2011-08-01', '22');
INSERT INTO `master_jenis` VALUES ('97', '8', 'Meja', ' meja bangku kantin sekolah AISIS 3 set', '', '2011-08-15', '3');
INSERT INTO `master_jenis` VALUES ('98', '8', '', 'By beli 4 bh kursi Chitose u/ R. P\'Johari', '', '2011-08-22', '4');
INSERT INTO `master_jenis` VALUES ('99', '8', '', '22 Set Echool No. 5', '', '2011-09-05', '22');
INSERT INTO `master_jenis` VALUES ('100', '8', '', '44 Set Echool No. 6', '', '2011-09-05', '44');
INSERT INTO `master_jenis` VALUES ('101', '8', '', '11 Set Meja Trapesium + Kursi', '', '2011-09-05', '11');
INSERT INTO `master_jenis` VALUES ('102', '8', '', '1 Set Cubical 12 Seat', '', '2011-09-05', '1');
INSERT INTO `master_jenis` VALUES ('103', '8', '', ' Locker 4 Pintu / Finish Semi Duco', '', '2011-09-13', '10');
INSERT INTO `master_jenis` VALUES ('104', '8', '', 'Lemari Tinggi Atas Pintu Kaca Bawah Panel', '', '2011-09-13', '1');
INSERT INTO `master_jenis` VALUES ('105', '8', '', 'Meja Bulat 120 Chery', '', '2011-09-13', '1');
INSERT INTO `master_jenis` VALUES ('106', '8', '', '1 set Vertical Blind 6609', '', '2011-09-26', '1');
INSERT INTO `master_jenis` VALUES ('107', '8', '', '7 Set Chitose Echool No. 5', '', '2011-10-03', '7');
INSERT INTO `master_jenis` VALUES ('108', '8', '', '4 Set Chitose Echool No. 6', '', '2011-10-03', '4');
INSERT INTO `master_jenis` VALUES ('109', '8', '', 'Meja kursi kantin ', '', '2011-11-07', '3');
INSERT INTO `master_jenis` VALUES ('110', '8', '', 'Rak buku brother B-90', '', '2011-12-09', '5');
INSERT INTO `master_jenis` VALUES ('111', '8', '', 'Kursi Laboratorium Fisika', '', '2012-05-09', '28');
INSERT INTO `master_jenis` VALUES ('112', '8', '', 'Meja 1/2 Biru Abu Dankha MTS211-A', '', '2012-07-30', '6');
INSERT INTO `master_jenis` VALUES ('113', '8', '', 'Kursi Susun Chitose Caesar p-m', '', '2012-07-30', '6');
INSERT INTO `master_jenis` VALUES ('114', '8', '', 'Lemari Tanpa Pintu Abu Venus VS37-A', '', '2012-07-30', '1');
INSERT INTO `master_jenis` VALUES ('115', '8', '', 'Meja Rapat Sedang Abu 75x160x60 Venus VF76-A', '', '2012-07-30', '6');
INSERT INTO `master_jenis` VALUES ('116', '8', '', 'Lemari Atas Pintu Sorok Venus VS57-A', '', '2012-07-30', '25');
INSERT INTO `master_jenis` VALUES ('117', '8', '', '3 Unit rak Buku Metal Boyher 902', '', '2012-07-30', '3');
INSERT INTO `master_jenis` VALUES ('118', '8', '', '4 Unit Meja-Kursi Echool No. 3', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('119', '8', '', '40 Set Meja-Kursi Echool No. 5', '', '2012-08-07', '40');
INSERT INTO `master_jenis` VALUES ('120', '8', '', '32 Set Meja-Kursi Echool No. 6', '', '2012-08-07', '32');
INSERT INTO `master_jenis` VALUES ('121', '8', '', '21 Set  Locker 4 Pintu', '', '2012-08-07', '21');
INSERT INTO `master_jenis` VALUES ('122', '8', '', '1 Set Cubical 10 Seat', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('123', '8', '', '1 Set Cubical 6 Seat', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('124', '8', '', '37 Set Locker 4 Pintu', '', '2012-08-07', '37');
INSERT INTO `master_jenis` VALUES ('125', '8', '', '20 Set Kursi-Meja Trapesium', '', '2012-08-07', '20');
INSERT INTO `master_jenis` VALUES ('126', '8', '', '24 Set Meja-Kursi Echool No. 3', '', '2012-08-07', '24');
INSERT INTO `master_jenis` VALUES ('127', '8', '', '49 Set Meja-Kursi Echool No.6', '', '2012-08-07', '49');
INSERT INTO `master_jenis` VALUES ('128', '8', '', ' Kursi Meeting - Finish rangka powder coat', '', '2012-08-07', '12');
INSERT INTO `master_jenis` VALUES ('129', '8', '', 'Meja-Kursi Kantin 80x244x70 30x244x40', '', '2012-08-13', '3');
INSERT INTO `master_jenis` VALUES ('130', '8', '', 'Dining Table + 6 Chair ex Puri Apartemen', '', '2013-02-04', '13');
INSERT INTO `master_jenis` VALUES ('131', '8', '', 'Stove - Type 7400 CAB ex Puri Apartemen', '', '2013-02-04', '2');
INSERT INTO `master_jenis` VALUES ('132', '8', '', 'Sofa 3 Seater ex Puri Apartemen', '', '2013-02-04', '6');
INSERT INTO `master_jenis` VALUES ('133', '8', '', 'Type Kayu Kotak', '', '2013-02-04', '11');
INSERT INTO `master_jenis` VALUES ('134', '8', '', 'Wardrobe 4 Doors ex Puri Apartemen', '', '2013-02-04', '9');
INSERT INTO `master_jenis` VALUES ('135', '8', '', 'Book Shelf  ex Puri Apartement', '', '2013-02-04', '10');
INSERT INTO `master_jenis` VALUES ('136', '8', '', 'Sofa 2 Seater ex Puri Apartement', '', '2013-02-04', '1');
INSERT INTO `master_jenis` VALUES ('137', '8', '', 'Wardrobe 3 Doors ex Puri Apartemen', '', '2013-02-04', '8');
INSERT INTO `master_jenis` VALUES ('138', '8', '', 'Rak Buku Metal 5 Tahap Brother 902', '', '2013-05-20', '2');
INSERT INTO `master_jenis` VALUES ('139', '8', '', 'Meja Trapesium - Pre School', '', '2013-07-23', '21');
INSERT INTO `master_jenis` VALUES ('140', '8', '', 'Kursi Trapesium - Pre School', '', '2013-07-23', '21');
INSERT INTO `master_jenis` VALUES ('141', '8', '', 'Locker 4 Pintu', '', '2013-07-23', '1');
INSERT INTO `master_jenis` VALUES ('142', '8', '', 'Meja Echool No. 3', '', '2013-07-23', '70');
INSERT INTO `master_jenis` VALUES ('143', '8', '', 'Kursi Echool No. 3', '', '2013-07-23', '61');
INSERT INTO `master_jenis` VALUES ('144', '8', '', 'Meja Echool No. 5', '', '2013-07-23', '90');
INSERT INTO `master_jenis` VALUES ('145', '8', '', 'Kursi Echool No. 5', '', '2013-07-23', '100');
INSERT INTO `master_jenis` VALUES ('146', '8', '', 'Meja Echool No. 6', '', '2013-07-23', '119');
INSERT INTO `master_jenis` VALUES ('147', '8', '', 'Kursi Echool No. 6', '', '2013-07-23', '121');
INSERT INTO `master_jenis` VALUES ('148', '8', '', 'Meja + Kursi Kantin AISIS ( 4 Set )', '', '2013-11-21', '4');
INSERT INTO `master_jenis` VALUES ('149', '8', '', 'Kursi Stacking Fortuner 716P', '', '2013-11-28', '18');
INSERT INTO `master_jenis` VALUES ('150', '8', '', 'Meja 1/2 Biro 75x120 Venus VD20-A', '', '2013-11-28', '5');
INSERT INTO `master_jenis` VALUES ('151', '8', '', '10 Set Meja Kursi Kantin', '', '2014-07-02', '10');
INSERT INTO `master_jenis` VALUES ('152', '8', '', '12 Unit Kursi Trapesium', '', '2014-08-06', '12');
INSERT INTO `master_jenis` VALUES ('153', '8', '', '12 Unit Meja Trapesium', '', '2014-08-06', '12');
INSERT INTO `master_jenis` VALUES ('154', '8', '', '26 Bh Kursi Belajar SD', '', '2014-08-21', '26');
INSERT INTO `master_jenis` VALUES ('155', '8', '', '26 Bh Meja Belajar SD', '', '2014-08-21', '26');
INSERT INTO `master_jenis` VALUES ('156', '8', '', '61 Bh Kursi Belajar SMP & SMA', '', '2014-08-21', '61');
INSERT INTO `master_jenis` VALUES ('157', '8', '', '29 Bh Meja Belajar Siswa SMP & SMA', '', '2014-08-21', '29');
INSERT INTO `master_jenis` VALUES ('158', '8', '', '64 Set Locker 4 Pintu u/ Siswa', '', '2014-08-21', '64');
INSERT INTO `master_jenis` VALUES ('159', '8', 'Meja', ' Meja Saji Kantin', '', '2014-09-01', '4');
INSERT INTO `master_jenis` VALUES ('160', '8', '', 'Meja Saji Kantin', '', '2014-09-01', '2');
INSERT INTO `master_jenis` VALUES ('161', '8', '', 'Filling Cabinet 4 Laci 0.6mm Abu', '', '2014-12-02', '4');
INSERT INTO `master_jenis` VALUES ('162', '8', '', 'Whiteboard Kensi Double Force + Kaki 120x240', '', '2014-12-09', '1');
INSERT INTO `master_jenis` VALUES ('163', '8', '', '1 Pcs Lemari Asap / Laboratorium', '', '2014-12-16', '1');
INSERT INTO `master_jenis` VALUES ('164', '8', '', 'Meja Percobaan Siswa 165x105x80 cm', '', '2014-12-16', '1');
INSERT INTO `master_jenis` VALUES ('165', '8', '', '1 Pcs Lemari Penyimpanan Mikroskop', '', '2014-12-16', '1');
INSERT INTO `master_jenis` VALUES ('166', '8', '', '2 Pcs Lemari Laboratorium Type I 80cm', '', '2014-12-16', '2');
INSERT INTO `master_jenis` VALUES ('167', '8', '', 'Acrylic Digital / Sign Library', '', '2015-01-08', '1');
INSERT INTO `master_jenis` VALUES ('168', '8', '', 'Rak Brother B.901 @Rp.1.144.000', '', '2015-02-26', '3');
INSERT INTO `master_jenis` VALUES ('169', '8', '', 'Rak Brother B.902 @Rp.1.580.000', '', '2015-02-26', '1');
INSERT INTO `master_jenis` VALUES ('170', '8', '', 'Whiteboard Dblface+Kaki (senior principal)', '', '2015-03-24', '1');
INSERT INTO `master_jenis` VALUES ('171', '8', '', '1 Lemari Arsip Kaca Barata 205 - Mr. Anba', '', '2015-03-31', '1');
INSERT INTO `master_jenis` VALUES ('172', '8', '', '1 Lemari Arsip Dankha BC992 - Mr. Anba', '', '2015-03-31', '1');
INSERT INTO `master_jenis` VALUES ('173', '8', '', '1 Softboard gantung Mantari - Mr. Anba', '', '2015-03-31', '1');
INSERT INTO `master_jenis` VALUES ('174', '8', '', '1 Meja Kerja Dankha MTS 322', '', '2015-03-31', '1');
INSERT INTO `master_jenis` VALUES ('175', '8', '', '20 Set Meja / Workstation Guru SD AIS', '', '2015-05-07', '1');
INSERT INTO `master_jenis` VALUES ('176', '8', '', '3 Set Vertical Blind Ruang Senior Principal', '', '2015-05-12', '1');
INSERT INTO `master_jenis` VALUES ('177', '8', '', '1 Unit Meja Meeting Oval 180', '', '2015-05-12', '1');
INSERT INTO `master_jenis` VALUES ('178', '8', '', '1 Unit Meja Meeting Oval 240', '', '2015-05-12', '1');
INSERT INTO `master_jenis` VALUES ('179', '8', '', '18 Unit Kursi Lipat Chitose', '', '2015-05-12', '1');
INSERT INTO `master_jenis` VALUES ('180', '8', '', 'Gordyn u/ ruang Art TK-SD', '', '2015-07-23', '1');
INSERT INTO `master_jenis` VALUES ('181', '8', '', '60 Unit Meja Echool 5 @Rp.470.000', '', '2015-08-26', '60');
INSERT INTO `master_jenis` VALUES ('182', '8', '', '60 Unit Kursi Echool 5 @Rp.250.000', '', '2015-08-26', '60');
INSERT INTO `master_jenis` VALUES ('183', '8', '', '58 Unit Meja Echool 6 @Rp.470.000', '', '2015-08-26', '58');
INSERT INTO `master_jenis` VALUES ('184', '8', '', '70 Unit Kursi Echool 6 @Rp.250.000', '', '2015-08-26', '70');
INSERT INTO `master_jenis` VALUES ('185', '8', '', '22 Unit Locker 6 Pintu @Rp.2.900.000', '', '2015-08-26', '22');
INSERT INTO `master_jenis` VALUES ('186', '8', '', '5 Unit Locker 3 Pintu @Rp.1.750.000', '', '2015-08-26', '5');
INSERT INTO `master_jenis` VALUES ('187', '8', '', '2 bh Cello Bench ( Kursi Drum )', '', '2016-03-22', '2');
INSERT INTO `master_jenis` VALUES ('188', '8', '', '2 bh Cello Stand', '', '2016-03-22', '2');
INSERT INTO `master_jenis` VALUES ('189', '8', '', '1 Unit Dust Bin Green 660L', '', '2016-03-29', '1');
INSERT INTO `master_jenis` VALUES ('190', '8', '', '1 Unit Meja Ecool 3 / Forsuner type Sun 929', '', '2016-06-14', '1');
INSERT INTO `master_jenis` VALUES ('191', '8', '', '8 Unit Kursi Ecool 3 /  Forsuner Type Sun 909', '', '2016-06-14', '8');
INSERT INTO `master_jenis` VALUES ('192', '8', '', '45 Unit Meja Ecool 5 / Forsuner type Sun 929', '', '2016-06-14', '45');
INSERT INTO `master_jenis` VALUES ('193', '8', '', '56 Unit Kursi Ecool 5 /  Forsuner Type Sun 909', '', '2016-06-14', '56');
INSERT INTO `master_jenis` VALUES ('194', '8', '', '21 Unit Meja Ecool 6 / Forsuner type Sun 929', '', '2016-06-14', '21');
INSERT INTO `master_jenis` VALUES ('195', '8', '', '46 Unit Kursi Ecool 6 /  Forsuner Type Sun 909', '', '2016-06-14', '46');
INSERT INTO `master_jenis` VALUES ('196', '8', '', '10 Unit Locker 6 Pintu Uk 80x90x40 cm', '', '2016-06-14', '10');
INSERT INTO `master_jenis` VALUES ('197', '8', 'Lemari', '1 Unit Loker 3 Pintu Uk. 40x90x40', '', '2016-06-14', '1');
INSERT INTO `master_jenis` VALUES ('198', '8', '', '4 Unit Rak Serba Guna 5 Tahap', '', '2016-07-26', '4');
INSERT INTO `master_jenis` VALUES ('199', '8', '', '5 Rak Berkas 100x200x60cm / TK AIS', '', '2016-08-02', '5');
INSERT INTO `master_jenis` VALUES ('200', '8', '', '16 Unit Kursi Merk Rakuda type kp 327+gas', '', '2016-08-09', '16');
INSERT INTO `master_jenis` VALUES ('201', '8', 'Meja', ' Meja Kerja Rangka Jati Merk VIV MV501', '', '2016-08-09', '1');
INSERT INTO `master_jenis` VALUES ('202', '8', '', '3 Unit Whiteboard 7mx1.2m', '', '2016-08-09', '3');
INSERT INTO `master_jenis` VALUES ('203', '8', '', '8 Set Partisi L (Meja di Ruang Guru )', '', '2016-08-09', '8');
INSERT INTO `master_jenis` VALUES ('204', '8', '', '5 Unit Lemari Piala AIS', '', '2016-08-15', '5');
INSERT INTO `master_jenis` VALUES ('205', '8', '', '1 Unit Filling Cabinet 4 Laci Lion Ekonomi', '', '2016-08-23', '1');
INSERT INTO `master_jenis` VALUES ('206', '8', '', '4 Unit Lemari Buku Pendek', '', '2016-08-23', '4');
INSERT INTO `master_jenis` VALUES ('207', '8', '', '3 Set partisi 6 Konfigurasi T-100', '', '2016-08-23', '3');
INSERT INTO `master_jenis` VALUES ('208', '8', '', 'Kursi Gabung 4 Unit', '', '2016-09-06', '4');
INSERT INTO `master_jenis` VALUES ('209', '8', '', 'Filing Cabinet 4 Laci Brother B 104 5 Unit', '', '2016-09-06', '5');
INSERT INTO `master_jenis` VALUES ('210', '8', '', 'Rak Buku Brother B 902 2 Unit', '', '2016-09-06', '2');
INSERT INTO `master_jenis` VALUES ('211', '10', 'Telephone', 'Mesin Fax', '', '2007-01-03', '1');
INSERT INTO `master_jenis` VALUES ('212', '10', '', 'Tabung Gas Elpiji', '', '2007-01-31', '1');
INSERT INTO `master_jenis` VALUES ('213', '10', '', 'Dispenser Uchida MD-04 PAS', '', '2007-01-31', '1');
INSERT INTO `master_jenis` VALUES ('214', '10', '', 'Kompor Gas Rinnai RI-602 E + Selang + Regulator', '', '2007-01-31', '1');
INSERT INTO `master_jenis` VALUES ('215', '10', '', 'Dispenser Hot & Cold Uchida MD 03 Pas', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('216', '10', '', 'Kompor Gas Rinnai 302 E', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('217', '10', '', 'Microwave Sharp R 208 E', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('218', '10', '', 'CTV Sony KV-AW 21P50 Flat AV Stereo', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('219', '10', '', 'Lemari Es Sharp 2 Pintu SJ 20 SE', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('220', '10', '', 'Magic Com Cosmos CJ 326', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('221', '10', '', 'Mesin Cuci Samsung 1 tabung WA 70 B 5', '', '2007-02-16', '2');
INSERT INTO `master_jenis` VALUES ('222', '10', '', 'Water Heater Gas Paloma Ph-5RFE', '', '2007-02-16', '4');
INSERT INTO `master_jenis` VALUES ('223', '10', '', 'Tabung Gas + Isi, Selang Gas & Regulator', '', '2007-02-16', '6');
INSERT INTO `master_jenis` VALUES ('224', '10', '', 'Computer HP / COMPAQ DX7200', '', '2007-05-31', '1');
INSERT INTO `master_jenis` VALUES ('225', '10', '', 'Printer HP LJ 1020', '', '2007-05-31', '1');
INSERT INTO `master_jenis` VALUES ('226', '10', '', 'Soft Board Pengumuman uk. 90 x 180', '', '2007-08-01', '25');
INSERT INTO `master_jenis` VALUES ('227', '10', '', 'Soft Board uk. 120 x 680 cm', '', '2007-08-01', '25');
INSERT INTO `master_jenis` VALUES ('228', '10', '', 'Soft Board uk. 120 x 450 cm', '', '2007-08-01', '25');
INSERT INTO `master_jenis` VALUES ('229', '10', '', 'White Board', '', '2007-08-09', '25');
INSERT INTO `master_jenis` VALUES ('230', '10', '', 'Outdoor Playground', '', '2007-08-09', '25');
INSERT INTO `master_jenis` VALUES ('231', '10', '', 'Rubber Mat u/ Outdoor Playgroung  AIS', '', '2007-10-05', '25');
INSERT INTO `master_jenis` VALUES ('232', '10', '', 'Sistem Tata Surya', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('233', '10', '', 'Planetarium', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('234', '10', '', 'Model Torso Pria', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('235', '10', '', 'Model Rangka Manusia', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('236', '10', '', 'Model Gigi Manusia', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('237', '10', '', 'Model Pencernaan Manusia', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('238', '10', '', 'Model Pernafasan Manusia', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('239', '10', '', 'Model Peredaran Darah Manusia', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('240', '10', '', 'Mikroskop Lanjuran', '', '2007-11-15', '1');
INSERT INTO `master_jenis` VALUES ('241', '10', '', 'Mikroskop Siswa', '', '2007-11-15', '4');
INSERT INTO `master_jenis` VALUES ('242', '10', '', 'Projector Sanyo XW 55', '', '2007-12-06', '1');
INSERT INTO `master_jenis` VALUES ('243', '10', '', 'DVD Compo Sharp GXX3 DVT ', '', '2007-12-28', '1');
INSERT INTO `master_jenis` VALUES ('244', '10', '', 'Paper Cutter u/ Adm. AIS', '', '2008-01-24', '80');
INSERT INTO `master_jenis` VALUES ('245', '10', '', 'Kamera Digital Canon A570IS', '', '2008-01-24', '1');
INSERT INTO `master_jenis` VALUES ('246', '10', '', 'Bel Sekolah', '', '2008-02-14', '1');
INSERT INTO `master_jenis` VALUES ('247', '10', '', 'CTV 29\" Flat Sharp 29 GXF 500 A', '', '2008-02-01', '1');
INSERT INTO `master_jenis` VALUES ('248', '10', '', 'Whiteboard', '', '2008-02-21', '1');
INSERT INTO `master_jenis` VALUES ('249', '10', '', '1 Set Sound System', '', '2008-03-28', '1');
INSERT INTO `master_jenis` VALUES ('250', '10', '', 'Tiang Gawang Sepak Bola', '', '2008-03-28', '1');
INSERT INTO `master_jenis` VALUES ('251', '10', '', 'Pianica Yamaha ', '', '2008-04-23', '1');
INSERT INTO `master_jenis` VALUES ('252', '10', '', 'Sepeda Roda 4 16\" Taro N87', '', '2008-05-13', '1');
INSERT INTO `master_jenis` VALUES ('253', '10', '', 'Sepeda Roda 4 12\" Girvin Syder Ndewu', '', '2008-05-13', '1');
INSERT INTO `master_jenis` VALUES ('254', '10', '', 'Laptop Ion Portiva $ 3.045 x. Rp. 9.325', '', '2008-05-16', '5');
INSERT INTO `master_jenis` VALUES ('255', '10', '', 'Antena Panel $280 x Rp 9.390', '', '2008-05-27', '2');
INSERT INTO `master_jenis` VALUES ('256', '10', '', '. Tabung Gas u/ Ruang LabScience ', '', '2008-06-30', '1');
INSERT INTO `master_jenis` VALUES ('257', '10', '', 'Server IBM Netfinity X Series 232', '', '2008-07-17', '1');
INSERT INTO `master_jenis` VALUES ('258', '10', '', 'PC + Units Monitor CRT 15\"', '', '2008-07-17', '3');
INSERT INTO `master_jenis` VALUES ('259', '10', '', 'Linksys Wireless Access Point 200', '', '2008-07-17', '2');
INSERT INTO `master_jenis` VALUES ('260', '10', '', 'Soft Board Single Face Gantung 120x730 cm', '', '2008-08-07', '1');
INSERT INTO `master_jenis` VALUES ('261', '10', '', 'Soft Board Single Face Gantung 120x380 cm', '', '2008-08-07', '1');
INSERT INTO `master_jenis` VALUES ('262', '10', '', ' Soft Board Single Face Gantung 120x250 cm', '', '2008-08-07', '1');
INSERT INTO `master_jenis` VALUES ('263', '10', '', 'Soft Board Single Face Gantung 120x490 cm', '', '2008-08-07', '1');
INSERT INTO `master_jenis` VALUES ('264', '10', '', 'Printer HP B/W LJ 1006', '', '2008-08-12', '1');
INSERT INTO `master_jenis` VALUES ('265', '10', '', 'Canon Scanner UDE p0 HJ / UAS', '', '2008-08-12', '1');
INSERT INTO `master_jenis` VALUES ('266', '10', '', 'Hekter Besar u/ Jilid', '', '2008-08-21', '1');
INSERT INTO `master_jenis` VALUES ('267', '10', '', ' UPSAPC SUA750i US$ 323 x Rp. 9.160', '', '2008-08-22', '1');
INSERT INTO `master_jenis` VALUES ('268', '10', '', 'Whiteboard Frame Geser 6.8 m', '', '2008-09-25', '3');
INSERT INTO `master_jenis` VALUES ('269', '10', '', 'Tiang Bola Volley.', '', '2008-09-25', '1');
INSERT INTO `master_jenis` VALUES ('270', '10', '', 'Printer Fuji Xerox DPC 1110', '', '2008-10-31', '1');
INSERT INTO `master_jenis` VALUES ('271', '10', '', 'Pengadaan Software & Hardware USD1200 X Rp.11.000', '', '2008-11-12', '1');
INSERT INTO `master_jenis` VALUES ('272', '10', '', 'Gitar Aquistic u/ Kelas Art-Culture', '', '2009-03-31', '1');
INSERT INTO `master_jenis` VALUES ('273', '10', '', '1 Set Angklung Unit Sedang', '', '2009-04-29', '1');
INSERT INTO `master_jenis` VALUES ('274', '10', '', 'Troli Lipat Dorong 150 Kg ', '', '2009-05-29', '1');
INSERT INTO `master_jenis` VALUES ('275', '10', '', 'Notebook IBM Livorno G430-1145 Rp.10.350/USD', '', '2009-07-01', '5');
INSERT INTO `master_jenis` VALUES ('276', '10', '', 'Motherboard, Casing & HD Komputer AISIS', '', '2009-07-01', '1');
INSERT INTO `master_jenis` VALUES ('277', '10', '', 'Super Play House & Rabbit Slide', '', '2009-07-21', '1');
INSERT INTO `master_jenis` VALUES ('278', '10', '', ' White Board Geser', '', '2009-07-21', '2');
INSERT INTO `master_jenis` VALUES ('279', '10', '', 'Soft Board uk. 120x490 cm', '', '2009-07-30', '1');
INSERT INTO `master_jenis` VALUES ('280', '10', '', 'Soft Board uk. 120x380 cm', '', '2009-07-30', '1');
INSERT INTO `master_jenis` VALUES ('281', '10', '', 'Soft Board uk. 120x240 cm', '', '2009-07-30', '1');
INSERT INTO `master_jenis` VALUES ('282', '10', '', 'Meja Tenis Super Silver', '', '2009-09-11', '1');
INSERT INTO `master_jenis` VALUES ('283', '10', '', 'Proyektor Multimedia + Tripod', '', '2009-10-13', '1');
INSERT INTO `master_jenis` VALUES ('284', '10', '', 'White Board 120x240 u/ Lab Science', '', '2009-12-04', '1');
INSERT INTO `master_jenis` VALUES ('285', '10', '', 'Kulkas u/ Kelas Lab. AISIS', '', '2009-12-16', '1');
INSERT INTO `master_jenis` VALUES ('286', '10', '', 'Unit PC Lenovo A58 RY1', '', '2009-12-29', '1');
INSERT INTO `master_jenis` VALUES ('287', '10', '', 'Grinder/Alat Pemotong Keramik ', '', '2009-03-31', '1');
INSERT INTO `master_jenis` VALUES ('288', '10', '', 'Walkie Talkie Motorola 5720 + Charger', '', '2010-01-22', '1');
INSERT INTO `master_jenis` VALUES ('289', '10', '', '3 Unit NEC True XPA NP210 + Tas', '', '2010-03-25', '3');
INSERT INTO `master_jenis` VALUES ('290', '10', '', '3 Unit Screenview Manual Screen 178x178 cm', '', '2010-03-25', '3');
INSERT INTO `master_jenis` VALUES ('291', '10', '', 'Pemurni Air SF PAUF 10', '', '2010-04-05', '1');
INSERT INTO `master_jenis` VALUES ('292', '10', '', 'Basin Air Siap Minum', '', '2010-04-05', '1');
INSERT INTO `master_jenis` VALUES ('293', '10', '', 'Bracket, Kabel VGA-Video-Listrik-Duck', '', '2010-05-06', '3');
INSERT INTO `master_jenis` VALUES ('294', '10', '', 'White Board + Softboard Sliding', '', '2010-06-28', '3');
INSERT INTO `master_jenis` VALUES ('295', '10', '', 'Soft Bpard Single Face Gantung 120x720 cm', '', '2010-06-28', '2');
INSERT INTO `master_jenis` VALUES ('296', '10', '', 'Soft Board Single Face Gantung 120x376 cm', '', '2010-06-28', '1');
INSERT INTO `master_jenis` VALUES ('297', '10', '', 'Soft Board Single Face Gantung 120x384 cm', '', '2010-06-28', '1');
INSERT INTO `master_jenis` VALUES ('298', '10', 'Projector', 'Projector NEC Tyoe NP115', '', '2010-07-14', '2');
INSERT INTO `master_jenis` VALUES ('299', '10', '', 'Braket, Kabel VGA-Video-Listrik-Duck', '', '2010-08-27', '2');
INSERT INTO `master_jenis` VALUES ('300', '10', '', 'Neraca Digital Ohaus 200g 0.1g / Lab Science IGCSE', '', '2010-09-07', '1');
INSERT INTO `master_jenis` VALUES ('301', '10', '', '2 Unit UPS Prolink Pro 600', '', '2010-10-15', '2');
INSERT INTO `master_jenis` VALUES ('302', '10', '', '1 Unit Switch 16 D Link', '', '2010-10-15', '1');
INSERT INTO `master_jenis` VALUES ('303', '10', '', '2 Unit Speaker Simbada CTS Z 51000N', '', '2010-10-15', '2');
INSERT INTO `master_jenis` VALUES ('304', '10', '', '1 Unit Hard Disk External 320 Gb Seagate', '', '2010-10-15', '1');
INSERT INTO `master_jenis` VALUES ('305', '10', '', 'Handphone u/ School Transportation', '', '2010-10-30', '1');
INSERT INTO `master_jenis` VALUES ('307', '10', '', 'Digital Voice Recorder ICD-PX820M', '', '2011-01-13', '5');
INSERT INTO `master_jenis` VALUES ('308', '10', '', 'Active Speaker EDIFIER E3100', '', '2011-01-13', '2');
INSERT INTO `master_jenis` VALUES ('309', '10', '', 'TOA Wireles Amplifier Set', '', '2011-01-28', '1');
INSERT INTO `master_jenis` VALUES ('310', '10', '', 'Megaphone TOA', '', '2011-01-28', '1');
INSERT INTO `master_jenis` VALUES ('311', '10', '', 'Mesin Bor Rotary Hammer Bosch GBH-2-18 RE', '', '2011-03-31', '1');
INSERT INTO `master_jenis` VALUES ('312', '10', '', 'Window Multipoint 1 Server+5 CAL USD.258xRp.8.725', '', '2011-04-19', '1');
INSERT INTO `master_jenis` VALUES ('314', '10', '', 'N-Computing Device X Series USD.430xRp.8.725', '', '2011-04-19', '1');
INSERT INTO `master_jenis` VALUES ('315', '10', '', 'Hand Phone u/ Hotline Services  Nokia 1800/Black', '', '2011-04-05', '1');
INSERT INTO `master_jenis` VALUES ('317', '10', '', 'Sony Handycam DCR SD-44E No. 1779037.K', '', '2011-04-29', '1');
INSERT INTO `master_jenis` VALUES ('318', '10', '', 'Nikon D-3100 Kit AFS-18-55 VR + Mem 4G + Bat', '', '2011-04-29', '1');
INSERT INTO `master_jenis` VALUES ('319', '10', '', 'RAM & Mikrotic Reuterboard /Komputer Perpustakaan', '', '2011-05-25', '1');
INSERT INTO `master_jenis` VALUES ('320', '10', '', '3 Lenovo Think Center USD 536.36xRp.8.535', '', '2011-07-27', '1');
INSERT INTO `master_jenis` VALUES ('321', '10', '', '.. lemari atas pintu sorok 1 rak abu - 5 bh', '', '2011-08-01', '5');
INSERT INTO `master_jenis` VALUES ('322', '10', '', '.. lemari atas tanpa pintu 1 rak abu - 5 bh', '', '2011-08-01', '5');
INSERT INTO `master_jenis` VALUES ('323', '10', '', 'External HDD Adata SH93 500GB', '', '2011-08-16', '1');
INSERT INTO `master_jenis` VALUES ('324', '10', '', 'External HDD Adata CH94 320GB', '', '2011-08-16', '1');
INSERT INTO `master_jenis` VALUES ('325', '10', '', '2 bh External HDD Adata SH02 320GB', '', '2011-08-16', '2');
INSERT INTO `master_jenis` VALUES ('326', '10', '', '5 Set Whiteboard Sliding Aplikasi Khusus', '', '2011-09-05', '5');
INSERT INTO `master_jenis` VALUES ('327', '10', '', '9 Unit Softboard Single Face Gantung  Aneka Uk.', '', '2011-09-05', '9');
INSERT INTO `master_jenis` VALUES ('328', '10', '', '1 Set Soft Board Single Face Gantung 160x40', '', '2011-09-05', '1');
INSERT INTO `master_jenis` VALUES ('329', '10', '', 'Mesin Absensi Sidik Jari Nitgen NAC-2500 plus', '', '2011-09-26', '1');
INSERT INTO `master_jenis` VALUES ('330', '10', '', 'Box Acrilic Pelindung Mesin Absensi Sidik Jari', '', '2011-09-26', '1');
INSERT INTO `master_jenis` VALUES ('331', '10', '', '2 Bh. Printer Canon Pixma LP 2770', '', '2011-09-23', '2');
INSERT INTO `master_jenis` VALUES ('332', '10', '', '1 Bh. Printer Canon MP 258', '', '2011-09-23', '1');
INSERT INTO `master_jenis` VALUES ('333', '10', '', '1 Adobe CS.5 Tlp For Win', '', '2011-09-30', '1');
INSERT INTO `master_jenis` VALUES ('334', '10', '', '1 Corel Draw Graphic Suite X5 ML', '', '2011-09-30', '1');
INSERT INTO `master_jenis` VALUES ('335', '10', '', '16 MS Window Pro 7 OAEM', '', '2011-09-30', '16');
INSERT INTO `master_jenis` VALUES ('336', '10', '', '23 MS Office STD 2010 SNGL OLP ACMC', '', '2011-09-30', '23');
INSERT INTO `master_jenis` VALUES ('337', '10', '', 'Modem Eksternal (T-Flash) / Mr. Johari', '', '2011-10-06', '1');
INSERT INTO `master_jenis` VALUES ('338', '10', '', 'By beli 1 bh tlp TX 24 TXH u/ operator AISIS', '', '2011-11-07', '1');
INSERT INTO `master_jenis` VALUES ('339', '10', '', '2 Unit Radio/Comp Polytron GD512 - Kelas TK', '', '2011-11-29', '1');
INSERT INTO `master_jenis` VALUES ('340', '10', '', 'Printer u/ Senior Principal', '', '2011-11-24', '1');
INSERT INTO `master_jenis` VALUES ('341', '10', '', 'Chitose Echool No. 5', '', '2011-10-03', '7');
INSERT INTO `master_jenis` VALUES ('342', '10', '', 'Chitose Echool No. 6', '', '2011-10-03', '4');
INSERT INTO `master_jenis` VALUES ('343', '10', '', 'By beli 7 unit meja laboratosium Fisika', '', '2012-04-03', '7');
INSERT INTO `master_jenis` VALUES ('344', '10', '', '2 BH. HANDRAIL STAINLESS STEEL W/ BELT', '', '2012-04-18', '7');
INSERT INTO `master_jenis` VALUES ('345', '10', '', ' 2 BH ROBOT SCI ROBO ES 2', '', '2012-05-30', '2');
INSERT INTO `master_jenis` VALUES ('346', '10', '', '1 BH VACUM CLEANER 30 LTR', '', '2012-05-30', '1');
INSERT INTO `master_jenis` VALUES ('347', '10', '', 'Bel Otomatis', '', '2012-07-30', '3');
INSERT INTO `master_jenis` VALUES ('348', '10', '', ' TOA Type ZH-610S', '', '2012-07-30', '2');
INSERT INTO `master_jenis` VALUES ('349', '10', '', 'Whiteboard-Soft Board Slidding 120x500 cm', '', '2012-08-07', '2');
INSERT INTO `master_jenis` VALUES ('350', '10', '', '11 Unit Notice Board 1 x 1 m', '', '2012-08-07', '11');
INSERT INTO `master_jenis` VALUES ('351', '10', '', 'Notice Board 80 cm x 1,5 m', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('352', '10', '', '2 Unit Notice Board 1,5 m x 1 m', '', '2012-08-07', '2');
INSERT INTO `master_jenis` VALUES ('353', '10', '', 'Whiteboard-Softboard Sliding 125x700 cm', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('354', '10', '', 'Whiteboard-Softboard Slidding 120x500 cm', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('355', '10', '', '1 Unit Softboard 120x620 cm', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('356', '10', '', 'Soft Board 120x400 cm', '', '2012-08-07', '1');
INSERT INTO `master_jenis` VALUES ('357', '10', '', 'Softboard Single Face (Gantung) 120x720 cm', '', '2012-08-13', '2');
INSERT INTO `master_jenis` VALUES ('358', '10', '', 'Softboard Single Face (Gantung) 120x244 cm', '', '2012-08-13', '2');
INSERT INTO `master_jenis` VALUES ('359', '10', '', 'Softboard Singleface (Gantung) 120x244 cm', '', '2012-08-13', '2');
INSERT INTO `master_jenis` VALUES ('360', '10', '', 'Softboard Single Face (Gantung) 120x500cm', '', '2012-08-13', '2');
INSERT INTO `master_jenis` VALUES ('361', '10', '', 'Softboard single face (Gantung) 120x380 cm', '', '2012-08-13', '1');
INSERT INTO `master_jenis` VALUES ('362', '10', '', 'Catu Daya 3A, 36 W / Lab Science', '', '2012-09-10', '5');
INSERT INTO `master_jenis` VALUES ('363', '10', '', 'Osiloskop 20 MHz, GOS 622 G / Lab. Science', '', '2012-09-10', '1');
INSERT INTO `master_jenis` VALUES ('364', '10', '', 'Pesawat Atwood 1.5 m / Lab. Science', '', '2012-09-10', '6');
INSERT INTO `master_jenis` VALUES ('365', '10', '', 'Miksroskop[ Lanjutan 50x-1000x / Lab Science', '', '2012-09-10', '6');
INSERT INTO `master_jenis` VALUES ('366', '10', '', 'Barcode scanner u/ library', '', '2012-09-14', '1');
INSERT INTO `master_jenis` VALUES ('367', '10', '', 'Printer u/ library', '', '2012-09-14', '1');
INSERT INTO `master_jenis` VALUES ('368', '10', '', 'Komputer LNV A70-Q2A/E5700', '', '2012-09-18', '24');
INSERT INTO `master_jenis` VALUES ('369', '10', '', 'Public Adress System Indoor', '', '2012-09-18', '1');
INSERT INTO `master_jenis` VALUES ('370', '10', '', 'Public System Outdoor', '', '2012-09-18', '1');
INSERT INTO `master_jenis` VALUES ('371', '10', '', 'MS.Office (1.656,00 x $9700)+(165,60xRp.9579)', '', '2012-09-27', '24');
INSERT INTO `master_jenis` VALUES ('372', '10', '', 'External DVD Lite On', '', '2012-10-31', '1');
INSERT INTO `master_jenis` VALUES ('373', '10', '', '1 Unit Brancard Lipat 2 Helper / Tandu', '', '2012-12-10', '1');
INSERT INTO `master_jenis` VALUES ('374', '10', 'Projector', 'Projector NEC NPV260G', '', '2012-12-10', '11');
INSERT INTO `master_jenis` VALUES ('375', '10', '', 'Wallmount 8U depth 500mm', '', '2012-12-12', '2');
INSERT INTO `master_jenis` VALUES ('376', '10', '', 'OTB RackMount E w/ 12 ST Coupler', '', '2012-12-12', '1');
INSERT INTO `master_jenis` VALUES ('377', '10', '', '4 Unit Media Converter SM Mbps', '', '2012-12-12', '1');
INSERT INTO `master_jenis` VALUES ('378', '10', '', '2 Unit OTB RackMount E w/ 24 ST Coupler', '', '2012-12-12', '1');
INSERT INTO `master_jenis` VALUES ('379', '10', '', '10 Whiteboard-Softboard Slidding 120x160cm', '', '2012-12-19', '10');
INSERT INTO `master_jenis` VALUES ('380', '10', '', '10 unit Softboard Slidding 120x160cm', '', '2012-12-19', '10');
INSERT INTO `master_jenis` VALUES ('381', '10', '', '11 Unit Glassboard uk. 90x120cm', '', '2012-12-26', '1');
INSERT INTO `master_jenis` VALUES ('382', '10', '', 'UPS Untuk Lab Komputer', '', '2012-12-13', '1');
INSERT INTO `master_jenis` VALUES ('383', '10', '', 'Projector Hitachi CP-X4014WN + USB Adaptor', '', '2013-01-18', '1');
INSERT INTO `master_jenis` VALUES ('384', '10', '', ' Bh Lemari Es - Ex Puri', '', '2013-02-04', '2');
INSERT INTO `master_jenis` VALUES ('385', '10', '', ' TV 21 - Ex Puri', '', '2013-02-04', '4');
INSERT INTO `master_jenis` VALUES ('386', '10', '', 'AC Split ex Puri Apartemen', '', '2013-02-04', '11');
INSERT INTO `master_jenis` VALUES ('387', '10', 'Jam', 'jam meja digital portable', '', '2013-06-04', '2');
INSERT INTO `master_jenis` VALUES ('388', '10', '', ' Handy Talky', '', '2013-07-02', null);
INSERT INTO `master_jenis` VALUES ('389', '10', '', 'UPS APC BX650CI-AS', '', '2013-07-12', '6');
INSERT INTO `master_jenis` VALUES ('390', '10', '', 'UPS APC BR1200GI', '', '2013-07-12', '4');
INSERT INTO `master_jenis` VALUES ('391', '10', '', 'Monitor LG LED 16\" 16EN33S', '', '2013-07-12', '10');
INSERT INTO `master_jenis` VALUES ('392', '10', '', 'NComputing L230', '', '2013-07-12', '10');
INSERT INTO `master_jenis` VALUES ('393', '10', '', 'PC Lenovo Thinkcenter M82E', '', '2013-07-12', '6');
INSERT INTO `master_jenis` VALUES ('394', '10', '', 'Komp. IBM X3100M4/E3-1220', '', '2013-07-18', null);
INSERT INTO `master_jenis` VALUES ('395', '10', '', 'Komp. IBM X3100M4/E3-1220 10%xUSD.1.545.45', '', '2013-07-18', null);
INSERT INTO `master_jenis` VALUES ('396', '10', '', '28 Unit Software $820 x Rp. 10.350', '', '2013-07-18', '28');
INSERT INTO `master_jenis` VALUES ('397', '10', '', '28 Unit Software 10%xUSD.820', '', '2013-07-18', '28');
INSERT INTO `master_jenis` VALUES ('398', '10', '', ' Printer HP LaserJet P1102', '', '2013-07-29', '2');
INSERT INTO `master_jenis` VALUES ('399', '10', '', 'UPS Prolink Pro 700A', '', '2013-07-29', '6');
INSERT INTO `master_jenis` VALUES ('400', '10', '', '2 Speaker Aktive Merk Huper', '', '2013-08-30', '2');
INSERT INTO `master_jenis` VALUES ('401', '10', '', '2 Set ( 4 Unit ) Microphone Wireless Merk Depon', '', '2013-08-30', '4');
INSERT INTO `master_jenis` VALUES ('402', '10', '', 'Dosing Pump Prominent Type Beta 4b0708PVT', '', '2013-09-19', '1');
INSERT INTO `master_jenis` VALUES ('404', '10', '', 'Smart DVR JMK 9416HD u/ CCTV', '', '2013-09-19', '1');
INSERT INTO `master_jenis` VALUES ('405', '10', '', '3 Unit Outdoor Camera JMK KJS338 u/ CCTV', '', '2013-09-19', '3');
INSERT INTO `master_jenis` VALUES ('406', '10', '', 'Outdoor TPY-705HRS lens 16mm u/ CCTV', '', '2013-09-19', '1');
INSERT INTO `master_jenis` VALUES ('407', '10', '', '3 Unit Outdoor RGS-93 u/ CCTV', '', '2013-09-19', '3');
INSERT INTO `master_jenis` VALUES ('408', '10', '', '5 Unit Indoor RGS-10HRS u/ CCTV', '', '2013-09-19', '5');
INSERT INTO `master_jenis` VALUES ('409', '10', 'Monitor', 'TCL LED 32\" TV Monitor u/ CCTV', '', '2013-09-19', '1');
INSERT INTO `master_jenis` VALUES ('410', '10', '', '2 Unit Seagate HDD 2TB u/ CCTV', '', '2013-09-19', '2');
INSERT INTO `master_jenis` VALUES ('411', '10', '', 'Prolink UPS 1200VA u/ CCTV', '', '2013-09-19', '1');
INSERT INTO `master_jenis` VALUES ('413', '10', '', 'Kamera digital utk lapangan', '', '2013-11-08', '1');
INSERT INTO `master_jenis` VALUES ('414', '10', '', '1 Unit IBM Server X3100 M4 USD2.000xRp11.600', '', '2014-03-07', '1');
INSERT INTO `master_jenis` VALUES ('416', '10', '', '5 Pcs MS Winsvrstd 2012 USD.33.95xRp.11.450', '', '2014-04-15', '5');
INSERT INTO `master_jenis` VALUES ('418', '10', '', '1 Pc MS Winsrvstd 2012R2 USD.203xRp.11.450', '', '2014-04-15', '1');
INSERT INTO `master_jenis` VALUES ('420', '10', '', 'Keyboard Casio CT7000 dan Stand', '', '2014-04-29', '1');
INSERT INTO `master_jenis` VALUES ('421', '10', '', '12 Pcs Sound Speaker Kelas AISIS', '', '2014-06-03', '12');
INSERT INTO `master_jenis` VALUES ('422', '10', '', '1 Bh Mesin Las', '', '2014-06-17', '1');
INSERT INTO `master_jenis` VALUES ('424', '10', '', 'RAM & HDD Internal', '', '2014-07-24', '1');
INSERT INTO `master_jenis` VALUES ('425', '10', '', 'Mesin Dynamic 330', '', '2014-08-06', '1');
INSERT INTO `master_jenis` VALUES ('426', '10', '', 'Neraca Digital Ohause 200g 0.1 g', '', '2014-12-16', '1');
INSERT INTO `master_jenis` VALUES ('427', '10', '', '1 Pcs Alat Pemadam Api', '', '2014-12-16', '1');
INSERT INTO `master_jenis` VALUES ('428', '10', '', 'Solution Absen Sidik Jari X100C', '', '2014-12-22', '1');
INSERT INTO `master_jenis` VALUES ('430', '10', '', 'Scanner Panasonic + Software SMR', '', '2015-01-08', '1');
INSERT INTO `master_jenis` VALUES ('432', '10', '', 'Portable Active Speaker Type MO32362W', '', '2015-01-13', '6');
INSERT INTO `master_jenis` VALUES ('433', '10', 'Projector', 'Projector Microvision MS 330', '', '2015-01-13', '8');
INSERT INTO `master_jenis` VALUES ('434', '10', '', 'Screen 70\" Manual u/ Projector', '', '2015-01-13', '8');
INSERT INTO `master_jenis` VALUES ('435', '10', '', '1 Set Conga', '', '2015-01-27', '1');
INSERT INTO `master_jenis` VALUES ('436', '10', '', 'RAM', '', '2015-01-27', '1');
INSERT INTO `master_jenis` VALUES ('437', '10', '', 'HDD Internal', '', '2015-01-27', '1');
INSERT INTO `master_jenis` VALUES ('438', '10', '', 'Enclosure', '', '2015-01-27', '1');
INSERT INTO `master_jenis` VALUES ('439', '10', '', 'Papper Ahredder EzSC-6315 A1', '', '2015-02-26', '1');
INSERT INTO `master_jenis` VALUES ('440', '10', '', 'Pemotong Kertas A3', '', '2015-02-24', '1');
INSERT INTO `master_jenis` VALUES ('441', '10', '', 'Rangka Manusia Rusuk Berwarna', '', '2015-03-17', '1');
INSERT INTO `master_jenis` VALUES ('442', '10', '', '1 Unit Canon Pixma', '', '2015-03-23', '1');
INSERT INTO `master_jenis` VALUES ('443', '10', '', '1 Unit Dispenser Miyako', '', '2015-03-23', '1');
INSERT INTO `master_jenis` VALUES ('444', '10', '', '1 Unit AC Split Panasonic Standar 1.5 Pk', '', '2015-05-19', '1');
INSERT INTO `master_jenis` VALUES ('445', '10', '', '7 Paket Multimedia Projector + Instalasi', '', '2015-06-23', '1');
INSERT INTO `master_jenis` VALUES ('446', '10', '', 'HP Hotline AIS', '', '2015-08-19', '1');
INSERT INTO `master_jenis` VALUES ('447', '10', '', '1 Unit PC Lenovo Edge 73+ Monitor 18.5 LED', '', '2015-09-15', '1');
INSERT INTO `master_jenis` VALUES ('449', '10', '', '1 Unit UPS APC 650 VA, 230 V, AVR', '', '2015-09-15', '1');
INSERT INTO `master_jenis` VALUES ('451', '10', '', '1 Unit HP Lasetjet Pro P1102w', '', '2015-09-15', '1');
INSERT INTO `master_jenis` VALUES ('453', '10', '', '6 Unit PC Lenovo Edge 73 + Monitor 18.5 LED', '', '2015-09-15', '1');
INSERT INTO `master_jenis` VALUES ('455', '10', '', '16 Unit UPS ICA 1200 CS1238', '', '2015-09-15', '1');
INSERT INTO `master_jenis` VALUES ('457', '10', '', '1 Unit AC Single Split Merk Daikin (1.5 Pk)', '', '2015-10-01', '1');
INSERT INTO `master_jenis` VALUES ('459', '10', '', '2 Unit AC Single Split Merk Daikin (2Pk)', '', '2015-10-01', '1');
INSERT INTO `master_jenis` VALUES ('461', '10', '', '7 Unit Office 2013 SNGL OLP NL Acdmc', '', '2015-12-01', '1');
INSERT INTO `master_jenis` VALUES ('463', '10', '', '2bh Tenda Dome 2x2 m', '', '2015-12-10', '1');
INSERT INTO `master_jenis` VALUES ('464', '10', '', '2bh Tenda Pramuka 3x4m', '', '2015-12-10', '1');
INSERT INTO `master_jenis` VALUES ('465', '10', '', 'Media Converter Fiber Optic FL-811GMA-11-5-A', '', '2016-01-19', '1');
INSERT INTO `master_jenis` VALUES ('466', '10', '', '3 Unit Switch 16 Port Gigabyte D-link', '', '2016-01-19', '3');
INSERT INTO `master_jenis` VALUES ('468', '10', 'Monitor', '2 bh Monitor u/ di Labkom (LG LED)', '', '2016-01-20', '2');
INSERT INTO `master_jenis` VALUES ('469', '10', '', ' 2 Unit Sound System Aubern Pop Table PSB', '', '2016-02-16', '2');
INSERT INTO `master_jenis` VALUES ('470', '10', '', '3bh Speaker untuk level EC', '', '2016-03-17', '3');
INSERT INTO `master_jenis` VALUES ('471', '10', '', 'Scanner untuk level EC', '', '2016-03-17', '1');
INSERT INTO `master_jenis` VALUES ('472', '10', '', '1 Bh Alat Music Cello Merk Astig 3/4', '', '2016-03-22', '1');
INSERT INTO `master_jenis` VALUES ('473', '10', '', '1 Bh Alat Music Cello Merk Astig 4/4', '', '2016-03-22', '1');
INSERT INTO `master_jenis` VALUES ('474', '10', 'Jam', '2 Unit Jam LED 48x19x5', '', '2016-08-23', '2');
INSERT INTO `master_jenis` VALUES ('475', '10', '', 'PC Lenovo S500 utk TK-SMA AIS', '', '2016-10-04', '7');
INSERT INTO `master_jenis` VALUES ('477', '10', '', 'Scanner Canon Lide R. Guru&Kelas AIS', '', '2016-10-04', '2');
INSERT INTO `master_jenis` VALUES ('479', '10', '', 'UPS ICA CE600', '', '2016-10-18', '5');
INSERT INTO `master_jenis` VALUES ('480', '10', '', 'Printer Epson L360', '', '2016-10-18', '1');
INSERT INTO `master_jenis` VALUES ('481', '10', '', 'Printer Epson L120', '', '2016-10-18', '2');
INSERT INTO `master_jenis` VALUES ('482', '10', '', 'Printer HP Laserjet', '', '2016-10-18', '2');
INSERT INTO `master_jenis` VALUES ('483', '10', '', 'Projector AIS & Screen Manual', '', '2016-10-25', '18');
INSERT INTO `master_jenis` VALUES ('484', '10', '', 'Timbangan Electronic Comp. Scale w/ Pole', '', '2016-10-25', '1');
INSERT INTO `master_jenis` VALUES ('485', '10', '', 'Voice Recorder SonyType UX 560 F', '', '2016-10-25', '10');
INSERT INTO `master_jenis` VALUES ('486', '10', '', 'Speaker Harman Kardon Onyx Studio 3 Black', '', '2016-10-25', '6');
INSERT INTO `master_jenis` VALUES ('487', '10', '', 'Pembl. 4 unit Whiteboard Portable', '', '2017-01-17', '4');
INSERT INTO `master_jenis` VALUES ('488', '10', '', 'Pemb. 1 Unit Lemari Es Aqua AQRD25914(S)', '', '2017-01-24', '1');
INSERT INTO `master_jenis` VALUES ('489', '10', '', '6 Bh Wall Fan Regency TW 14\"', '', '2017-01-25', '6');
INSERT INTO `master_jenis` VALUES ('490', '10', '', '10 Bh Wall Fan Regency TW 16\"', '', '2017-01-25', '10');
INSERT INTO `master_jenis` VALUES ('491', '10', '', '3 Bh Wall Fan Regency TW 20\"', '', '2017-01-25', '3');
INSERT INTO `master_jenis` VALUES ('492', '10', '', 'Pembl. 8 unit Amplifier utk kelas', '', '2017-04-11', '8');
INSERT INTO `master_jenis` VALUES ('493', '10', 'BELL', 'Round Bell', null, '2017-06-01', '1');

-- ----------------------------
-- Table structure for master_kategori
-- ----------------------------
DROP TABLE IF EXISTS `master_kategori`;
CREATE TABLE `master_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kategori` varchar(5) DEFAULT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_kategori
-- ----------------------------
INSERT INTO `master_kategori` VALUES ('8', 'FU', 'Furniture');
INSERT INTO `master_kategori` VALUES ('10', 'ECL', 'Electronic');

-- ----------------------------
-- Table structure for master_kondisi
-- ----------------------------
DROP TABLE IF EXISTS `master_kondisi`;
CREATE TABLE `master_kondisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_kondisi` varchar(255) DEFAULT NULL,
  `nama_kondisi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_kondisi
-- ----------------------------

-- ----------------------------
-- Table structure for master_level
-- ----------------------------
DROP TABLE IF EXISTS `master_level`;
CREATE TABLE `master_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_level` varchar(255) DEFAULT NULL,
  `nama_level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_level
-- ----------------------------

-- ----------------------------
-- Table structure for master_location
-- ----------------------------
DROP TABLE IF EXISTS `master_location`;
CREATE TABLE `master_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_location` varchar(255) DEFAULT NULL,
  `nama_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_location
-- ----------------------------
INSERT INTO `master_location` VALUES ('1', 'E-UG-1', 'Ruang Maintenance Unit');
INSERT INTO `master_location` VALUES ('2', 'F-UG-1', 'Ruang Seni Musik');
INSERT INTO `master_location` VALUES ('3', 'G-UG-1', 'Ruang Mandi Putra');
INSERT INTO `master_location` VALUES ('4', 'G-UG-2', 'Ruang Olah Raga / PE Room');
INSERT INTO `master_location` VALUES ('5', 'G-UG-3', 'Ruang Mandi Putri');
INSERT INTO `master_location` VALUES ('6', 'H-G-1', 'Aula Makan / Dinning Hall');
INSERT INTO `master_location` VALUES ('7', 'H-G-1A', 'Healthy Lunch Booth');
INSERT INTO `master_location` VALUES ('8', 'H-G-1B', 'Uniform Booth');
INSERT INTO `master_location` VALUES ('9', 'H-G-1C', 'Denver Chicken Booth');

-- ----------------------------
-- Table structure for master_pengguna
-- ----------------------------
DROP TABLE IF EXISTS `master_pengguna`;
CREATE TABLE `master_pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_phone` varchar(20) DEFAULT NULL,
  `role_access` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_pengguna
-- ----------------------------

-- ----------------------------
-- Table structure for master_ruangan
-- ----------------------------
DROP TABLE IF EXISTS `master_ruangan`;
CREATE TABLE `master_ruangan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_ruangan` varchar(255) DEFAULT NULL,
  `nama_ruangan` varchar(255) DEFAULT NULL,
  `id_tahun_ajaran` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ruangan_tahun_ajaran` (`id_tahun_ajaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_ruangan
-- ----------------------------

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_induk` int(11) NOT NULL,
  `kode_user` varchar(20) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `status` int(11) DEFAULT '0',
  `login_status` int(11) DEFAULT '0',
  `foto_profile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', '0', '', 'Admin', 'admin123', 'admin123!!', '99', 'Administrator', '1', '0', null);
INSERT INTO `pengguna` VALUES ('11', '0', '', 'Agung Supartono', 'kogure13', 'qazplm990', '7', 'Operator', '1', '0', 'server/uploads/images/s200_agung.supartono.jpg');
INSERT INTO `pengguna` VALUES ('12', '0', '', 'M. Ali Suseno', 'smoo7hink', 'qwe123456', '2', 'Moderator', '1', '1', 'server/uploads/images/mas.1986.jpg');
INSERT INTO `pengguna` VALUES ('13', '0', '', 'Aburahman Sidiq', 'rahman898', 'rahman134', '6', 'Operator', '1', '0', null);
INSERT INTO `pengguna` VALUES ('14', '0', '', 'Ivan Haris Prayoga', 'ipank68', 'sahabat1', '8', 'Auditor', '1', '0', null);

-- ----------------------------
-- Table structure for th_ajaran
-- ----------------------------
DROP TABLE IF EXISTS `th_ajaran`;
CREATE TABLE `th_ajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_th_ajaran` varchar(15) DEFAULT NULL,
  `nama_th_ajaran` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of th_ajaran
-- ----------------------------
INSERT INTO `th_ajaran` VALUES ('1', '1617a', '2016/2017 - Ganjil');
INSERT INTO `th_ajaran` VALUES ('2', '1617b', '2016/2017 - Genap');
