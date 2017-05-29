/*
Navicat MySQL Data Transfer

Source Server         : server128
Source Server Version : 50522
Source Host           : 192.168.0.128:3306
Source Database       : ais_inventory

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2017-05-19 09:02:06
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of master_jenis
-- ----------------------------
INSERT INTO `master_jenis` VALUES ('1', '8', 'Ekul 3', 'Kursi', null);
INSERT INTO `master_jenis` VALUES ('2', '8', 'Ekul 5', 'Kursi', null);

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
INSERT INTO `master_kategori` VALUES ('8', 'Fu2', 'Furniture');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', '0', '', 'Admin', 'admin123', 'admin123', '99', 'Administrator', '1');
INSERT INTO `pengguna` VALUES ('11', '0', '', 'Agung Supartono', 'kogure13', 'qazplm990', '7', 'Operator', '1');
INSERT INTO `pengguna` VALUES ('12', '0', '', 'M. Ali Suseno', 'smoThink', 'qwe123456', '2', '', '1');
INSERT INTO `pengguna` VALUES ('13', '0', '', 'Aburahman Sidiq', 'rahman89', 'rahman134', '6', '', '1');
INSERT INTO `pengguna` VALUES ('14', '0', '', 'Ivan Haris Prayoga', 'ipank68', 'sahabtsatu', '8', '', '1');

-- ----------------------------
-- Table structure for th_ajaran
-- ----------------------------
DROP TABLE IF EXISTS `th_ajaran`;
CREATE TABLE `th_ajaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_th_ajaran` varchar(10) DEFAULT NULL,
  `nama_th_ajaran` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of th_ajaran
-- ----------------------------
INSERT INTO `th_ajaran` VALUES ('1', '123', '1234');
INSERT INTO `th_ajaran` VALUES ('2', '88888', '663358');
