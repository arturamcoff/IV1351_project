

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `student_id` int(11) NOT NULL,
  `instrument` varchar(100) NOT NULL,
  `skill_level` varchar(100) NOT NULL,
  `advanced_level` varchar(100) NOT NULL,
  `keep_application` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `pk_id` int(11) NOT NULL,
  `date_time_from` datetime(5) NOT NULL,
  `date_time_to` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appointment_instructor`
--

CREATE TABLE `appointment_instructor` (
  `appointment_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `audition`
--

CREATE TABLE `audition` (
  `appointment_id` int(11) NOT NULL,
  `passed` varchar(100) DEFAULT NULL,
  `instrument_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `student_id` int(11) NOT NULL,
  `lesson_fee` decimal(5,0) NOT NULL,
  `rent_fee` decimal(5,0) NOT NULL,
  `sibling_discount` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ensamble`
--

CREATE TABLE `ensamble` (
  `fixed_time_slot_id` int(11) NOT NULL,
  `maximum_attendees` int(11) NOT NULL,
  `minimum_attendees` int(11) NOT NULL,
  `instrument_id` int(11) DEFAULT NULL,
  `price_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ensamble_instruments`
--

CREATE TABLE `ensamble_instruments` (
  `instrument_id` int(11) NOT NULL,
  `ensamble_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_time_slots`
--

CREATE TABLE `fixed_time_slots` (
  `pk_id` int(11) NOT NULL,
  `date_time_from` datetime(5) NOT NULL,
  `date_time_to` datetime(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_time_slots_instructor`
--

CREATE TABLE `fixed_time_slots_instructor` (
  `instructor_id` int(11) NOT NULL,
  `fixed_time_slots_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fixed_time_slot_student`
--

CREATE TABLE `fixed_time_slot_student` (
  `student_id` int(11) NOT NULL,
  `fixed_time_slot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `ensamble_id` int(11) NOT NULL,
  `genre_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `group_lesson`
--

CREATE TABLE `group_lesson` (
  `fixed_time_slot_id` int(11) NOT NULL,
  `lesson_level` varchar(100) NOT NULL,
  `date_time` datetime(5) NOT NULL,
  `maximum_spots` int(11) NOT NULL,
  `minimum_attendees` int(11) DEFAULT NULL,
  `instrument_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `individual_lesson`
--

CREATE TABLE `individual_lesson` (
  `appointment_id` int(11) NOT NULL,
  `lesson_level` varchar(5) NOT NULL,
  `date_time` datetime(5) NOT NULL,
  `instrument_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `insrument_for_rent`
--

CREATE TABLE `insrument_for_rent` (
  `pfk_id` int(11) NOT NULL,
  `instrument_type` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `rent_price` decimal(5,0) NOT NULL,
  `rent_id` int(11) DEFAULT NULL,
  `instrument_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `pk_id` int(11) NOT NULL,
  `teaches_ensambles` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor_instrument`
--

CREATE TABLE `instructor_instrument` (
  `instructor_id` int(11) NOT NULL,
  `instrument_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instrument`
--

CREATE TABLE `instrument` (
  `pk_id` int(11) NOT NULL,
  `instrument_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `pk_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `pfk_id` int(11) NOT NULL,
  `pnr` varchar(12) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_number`
--

CREATE TABLE `phone_number` (
  `pfk_id` int(11) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `price_model`
--

CREATE TABLE `price_model` (
  `pfk_id` int(11) NOT NULL,
  `lesson_level` varchar(100) NOT NULL,
  `day` varchar(100) DEFAULT NULL,
  `price` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `pk_id` int(11) NOT NULL,
  `rent_date` datetime(5) NOT NULL,
  `rent_until` datetime(5) NOT NULL,
  `student_id` int(11) NOT NULL,
  `returned` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salery`
--

CREATE TABLE `salery` (
  `instructor_id` int(11) NOT NULL,
  `total_amount` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `pk_id` int(11) NOT NULL,
  `accepted` char(10) DEFAULT NULL,
  `passedAudition` char(10) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`student_id`,`instrument`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `appointment_instructor`
--
ALTER TABLE `appointment_instructor`
  ADD PRIMARY KEY (`appointment_id`,`instructor_id`),
  ADD KEY `FK_appointment_instructor_1` (`instructor_id`);

--
-- Indexes for table `audition`
--
ALTER TABLE `audition`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `FK_audition_1` (`instrument_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `ensamble`
--
ALTER TABLE `ensamble`
  ADD PRIMARY KEY (`fixed_time_slot_id`),
  ADD KEY `FK_ensamble_1` (`instrument_id`),
  ADD KEY `FK_ensamble_2` (`price_id`);

--
-- Indexes for table `ensamble_instruments`
--
ALTER TABLE `ensamble_instruments`
  ADD PRIMARY KEY (`instrument_id`,`ensamble_id`),
  ADD KEY `FK_ensamble_instruments_1` (`ensamble_id`);

--
-- Indexes for table `fixed_time_slots`
--
ALTER TABLE `fixed_time_slots`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `fixed_time_slots_instructor`
--
ALTER TABLE `fixed_time_slots_instructor`
  ADD PRIMARY KEY (`instructor_id`,`fixed_time_slots_id`),
  ADD KEY `FK_fixed_time_slots_instructor_1` (`fixed_time_slots_id`);

--
-- Indexes for table `fixed_time_slot_student`
--
ALTER TABLE `fixed_time_slot_student`
  ADD PRIMARY KEY (`student_id`,`fixed_time_slot_id`),
  ADD KEY `FK_fixed_time_slot_student_1` (`fixed_time_slot_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ensamble_id`);

--
-- Indexes for table `group_lesson`
--
ALTER TABLE `group_lesson`
  ADD PRIMARY KEY (`fixed_time_slot_id`),
  ADD KEY `FK_group_lesson_1` (`instrument_id`),
  ADD KEY `FK_group_lesson_2` (`price_id`);

--
-- Indexes for table `individual_lesson`
--
ALTER TABLE `individual_lesson`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `FK_individual_lesson_1` (`instrument_id`),
  ADD KEY `FK_individual_lesson_2` (`price_id`);

--
-- Indexes for table `insrument_for_rent`
--
ALTER TABLE `insrument_for_rent`
  ADD PRIMARY KEY (`pfk_id`),
  ADD KEY `FK_insrument_for_rent_0` (`rent_id`),
  ADD KEY `FK_instrument_for_rent_1` (`instrument_id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `instructor_instrument`
--
ALTER TABLE `instructor_instrument`
  ADD PRIMARY KEY (`instructor_id`,`instrument_id`),
  ADD KEY `FK_instructor_instrument_1` (`instrument_id`);

--
-- Indexes for table `instrument`
--
ALTER TABLE `instrument`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`pfk_id`),
  ADD KEY `FK_person_0` (`student_id`),
  ADD KEY `FK_person_1` (`instructor_id`);

--
-- Indexes for table `phone_number`
--
ALTER TABLE `phone_number`
  ADD PRIMARY KEY (`pfk_id`),
  ADD KEY `FK_phone_number_0` (`parent_id`),
  ADD KEY `FK_phone_number_1` (`student_id`);

--
-- Indexes for table `price_model`
--
ALTER TABLE `price_model`
  ADD PRIMARY KEY (`pfk_id`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `FK_rent_0` (`student_id`);

--
-- Indexes for table `salery`
--
ALTER TABLE `salery`
  ADD PRIMARY KEY (`instructor_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `FK_student_0` (`parent_id`),
  ADD KEY `FK_student_2` (`appointment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fixed_time_slots`
--
ALTER TABLE `fixed_time_slots`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `insrument_for_rent`
--
ALTER TABLE `insrument_for_rent`
  MODIFY `pfk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instrument`
--
ALTER TABLE `instrument`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `pfk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_number`
--
ALTER TABLE `phone_number`
  MODIFY `pfk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_model`
--
ALTER TABLE `price_model`
  MODIFY `pfk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `FK_application_0` FOREIGN KEY (`student_id`) REFERENCES `student` (`pk_id`) ON DELETE CASCADE;

--
-- Constraints for table `appointment_instructor`
--
ALTER TABLE `appointment_instructor`
  ADD CONSTRAINT `FK_appointment_instructor_0` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_appointment_instructor_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`pk_id`);

--
-- Constraints for table `audition`
--
ALTER TABLE `audition`
  ADD CONSTRAINT `FK_audition_0` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_audition_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`pk_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_0` FOREIGN KEY (`student_id`) REFERENCES `student` (`pk_id`);

--
-- Constraints for table `ensamble`
--
ALTER TABLE `ensamble`
  ADD CONSTRAINT `FK_ensamble_0` FOREIGN KEY (`fixed_time_slot_id`) REFERENCES `fixed_time_slots` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ensamble_2` FOREIGN KEY (`price_id`) REFERENCES `price_model` (`pfk_id`);

--
-- Constraints for table `ensamble_instruments`
--
ALTER TABLE `ensamble_instruments`
  ADD CONSTRAINT `FK_ensamble_instruments_0` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`pk_id`),
  ADD CONSTRAINT `FK_ensamble_instruments_1` FOREIGN KEY (`ensamble_id`) REFERENCES `ensamble` (`fixed_time_slot_id`) ON DELETE CASCADE;

--
-- Constraints for table `fixed_time_slots_instructor`
--
ALTER TABLE `fixed_time_slots_instructor`
  ADD CONSTRAINT `FK_fixed_time_slots_instructor_0` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`pk_id`),
  ADD CONSTRAINT `FK_fixed_time_slots_instructor_1` FOREIGN KEY (`fixed_time_slots_id`) REFERENCES `fixed_time_slots` (`pk_id`) ON DELETE CASCADE;

--
-- Constraints for table `fixed_time_slot_student`
--
ALTER TABLE `fixed_time_slot_student`
  ADD CONSTRAINT `FK_fixed_time_slot_student_0` FOREIGN KEY (`student_id`) REFERENCES `student` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_fixed_time_slot_student_1` FOREIGN KEY (`fixed_time_slot_id`) REFERENCES `fixed_time_slots` (`pk_id`) ON DELETE CASCADE;

--
-- Constraints for table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `FK_genre_0` FOREIGN KEY (`ensamble_id`) REFERENCES `ensamble` (`fixed_time_slot_id`);

--
-- Constraints for table `group_lesson`
--
ALTER TABLE `group_lesson`
  ADD CONSTRAINT `FK_group_lesson_0` FOREIGN KEY (`fixed_time_slot_id`) REFERENCES `fixed_time_slots` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_group_lesson_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`pk_id`),
  ADD CONSTRAINT `FK_group_lesson_2` FOREIGN KEY (`price_id`) REFERENCES `price_model` (`pfk_id`);

--
-- Constraints for table `individual_lesson`
--
ALTER TABLE `individual_lesson`
  ADD CONSTRAINT `FK_individual_lesson_0` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_individual_lesson_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`pk_id`),
  ADD CONSTRAINT `FK_individual_lesson_2` FOREIGN KEY (`price_id`) REFERENCES `price_model` (`pfk_id`);

--
-- Constraints for table `insrument_for_rent`
--
ALTER TABLE `insrument_for_rent`
  ADD CONSTRAINT `FK_insrument_for_rent_0` FOREIGN KEY (`rent_id`) REFERENCES `rent` (`pk_id`),
  ADD CONSTRAINT `FK_instrument_for_rent_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`pk_id`);

--
-- Constraints for table `instructor_instrument`
--
ALTER TABLE `instructor_instrument`
  ADD CONSTRAINT `FK_instructor_instrument_0` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_instructor_instrument_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`pk_id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FK_person_0` FOREIGN KEY (`student_id`) REFERENCES `student` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_person_1` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`pk_id`) ON DELETE CASCADE;

--
-- Constraints for table `phone_number`
--
ALTER TABLE `phone_number`
  ADD CONSTRAINT `FK_phone_number_0` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`pk_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_phone_number_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`pk_id`) ON DELETE CASCADE;

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `FK_rent_0` FOREIGN KEY (`student_id`) REFERENCES `student` (`pk_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `salery`
--
ALTER TABLE `salery`
  ADD CONSTRAINT `FK_salery_0` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`pk_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_student_0` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`pk_id`),
  ADD CONSTRAINT `FK_student_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`pk_id`) ON DELETE SET NULL;
COMMIT;

