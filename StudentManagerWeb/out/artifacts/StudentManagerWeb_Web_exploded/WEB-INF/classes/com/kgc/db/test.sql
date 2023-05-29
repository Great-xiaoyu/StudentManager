-- ----------------------------
-- Table structure for `s_course`
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course`
(
    `id`           int(5)      NOT NULL AUTO_INCREMENT,
    `name`         varchar(32) NOT NULL,
    `teacher_id`   int(5)      NOT NULL,
    `course_date`  varchar(32)          DEFAULT NULL,
    `selected_num` int(5)      NOT NULL DEFAULT '0',
    `max_num`      int(5)      NOT NULL DEFAULT '50',
    `info`         varchar(128)         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `course_teacher_foreign` (`teacher_id`),
    CONSTRAINT `course_teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course`
VALUES ('1', '大学英语', '9', '周三上午8点', '2', '50', '英语。');
INSERT INTO `s_course`
VALUES ('2', '大学数学', '10', '周三上午10点', '3', '50', '数学。');
INSERT INTO `s_course`
VALUES ('3', '计算机基础', '11', '周三上午', '2', '50', '计算机课程。');
INSERT INTO `s_course`
VALUES ('14', '网络工程', '11', '周五早上', '2', '56', '网络基础知识。');


CREATE TABLE `s_selected_course`
(
    `id`         int(5) NOT NULL AUTO_INCREMENT,
    `student_id` int(5) NOT NULL,
    `course_id`  int(5) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `selected_course_student_fk` (`student_id`),
    KEY `selected_course_course_fk` (`course_id`),
    CONSTRAINT `selected_course_course_fk` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`),
    CONSTRAINT `selected_course_student_fk` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of s_selected_course
-- ----------------------------
INSERT INTO `s_selected_course`
VALUES ('4', '1', '2');
INSERT INTO `s_selected_course`
VALUES ('6', '1', '14');
INSERT INTO `s_selected_course`
VALUES ('8', '2', '1');
INSERT INTO `s_selected_course`
VALUES ('9', '4', '3');
INSERT INTO `s_selected_course`
VALUES ('10', '9', '14');
INSERT INTO `s_selected_course`
VALUES ('11', '1', '3');
INSERT INTO `s_selected_course`
VALUES ('12', '4', '2');
INSERT INTO `s_selected_course`
VALUES ('13', '9', '1');
INSERT INTO `s_selected_course`
VALUES ('14', '2', '2');


CREATE TABLE `s_attendance`
(
    `id`         int(5)      NOT NULL AUTO_INCREMENT,
    `course_id`  int(5)      NOT NULL,
    `student_id` int(5)      NOT NULL,
    `type`       varchar(11) NOT NULL,
    `date`       varchar(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `attendance_course_foreign_key` (`course_id`),
    KEY `attendace_student_foreign_key` (`student_id`),
    CONSTRAINT `attendace_student_foreign_key` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`),
    CONSTRAINT `attendance_course_foreign_key` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of s_attendance
-- ----------------------------
INSERT INTO `s_attendance`
VALUES ('1', '1', '1', '上午', '2018-09-04');
INSERT INTO `s_attendance`
VALUES ('2', '1', '1', '下午', '2018-09-04');
INSERT INTO `s_attendance`
VALUES ('3', '1', '1', '上午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('4', '1', '2', '上午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('6', '1', '1', '下午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('7', '1', '2', '下午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('8', '2', '2', '上午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('9', '2', '2', '下午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('11', '3', '4', '上午', '2018-09-05');
INSERT INTO `s_attendance`
VALUES ('12', '3', '4', '下午', '2018-09-05');


CREATE TABLE `s_leave`
(
    `id`         int(5)     NOT NULL AUTO_INCREMENT,
    `student_id` int(5)     NOT NULL,
    `info`       varchar(512)        DEFAULT NULL,
    `status`     tinyint(1) NOT NULL DEFAULT '0',
    `remark`     varchar(512)        DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `leave_student_foreign_key` (`student_id`),
    CONSTRAINT `leave_student_foreign_key` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of s_leave
-- ----------------------------
INSERT INTO `s_leave`
VALUES ('1', '1', '世界那么大，我想去看看！', '1', '同意，你很6.');
INSERT INTO `s_leave`
VALUES ('4', '9', '感冒了。', '1', '回家吃个感冒药，好好睡一觉。');
INSERT INTO `s_leave`
VALUES ('5', '2', '老子不想上课了。', '-1', '给老子滚回去上课，找打。');
INSERT INTO `s_leave`
VALUES ('7', '1', '失恋了，没信息上课。', '-1', '不找到新对象别来上学。');
INSERT INTO `s_leave`
VALUES ('12', '1', '肚子疼。疼死了。老师快审核呀，十万火急。', '1', '赶紧去，别拉在裤子里了。');


CREATE TABLE `s_score` (
                           `id` int(5) NOT NULL AUTO_INCREMENT,
                           `student_id` int(5) NOT NULL,
                           `course_id` int(5) NOT NULL,
                           `score` double(5,2) NOT NULL,
                           `remark` varchar(128) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `selected_course_student_fk` (`student_id`),
                           KEY `selected_course_course_fk` (`course_id`),
                           CONSTRAINT `s_score_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`),
                           CONSTRAINT `s_score_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_score
-- ----------------------------
INSERT INTO `s_score` VALUES ('18', '1', '1', '87.50', '中上等。');
INSERT INTO `s_score` VALUES ('46', '1', '14', '87.00', 'null');
INSERT INTO `s_score` VALUES ('49', '4', '2', '88.80', 'null');
INSERT INTO `s_score` VALUES ('51', '9', '1', '77.00', 'null');
INSERT INTO `s_score` VALUES ('54', '1', '3', '56.00', 'null');
INSERT INTO `s_score` VALUES ('56', '2', '1', '98.00', '很好');
INSERT INTO `s_score` VALUES ('57', '2', '2', '56.00', 'null');
INSERT INTO `s_score` VALUES ('58', '4', '3', '44.00', '差劲');
INSERT INTO `s_score` VALUES ('59', '9', '14', '66.00', '及格');
INSERT INTO `s_score` VALUES ('61', '1', '2', '66.00', '及格万岁！');
INSERT INTO `s_score` VALUES ('62', '4', '1', '61.00', '');
