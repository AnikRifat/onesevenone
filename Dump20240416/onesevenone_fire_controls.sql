CREATE DATABASE  IF NOT EXISTS `onesevenone_fire` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `onesevenone_fire`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: onesevenone_fire
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `controls`
--

DROP TABLE IF EXISTS `controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `control_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `question` text COLLATE utf8mb4_unicode_ci,
  `guidance` text COLLATE utf8mb4_unicode_ci,
  `additional_text` text COLLATE utf8mb4_unicode_ci,
  `how_to_answer` text COLLATE utf8mb4_unicode_ci,
  `video_ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `control_type` int NOT NULL,
  `answer_type` int NOT NULL,
  `document_req` tinyint(1) NOT NULL DEFAULT '0',
  `nist_controls` text COLLATE utf8mb4_unicode_ci,
  `isoiec_controls` text COLLATE utf8mb4_unicode_ci,
  `section_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `controls_section_id_foreign` (`section_id`),
  CONSTRAINT `controls_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controls`
--

LOCK TABLES `controls` WRITE;
/*!40000 ALTER TABLE `controls` DISABLE KEYS */;
INSERT INTO `controls` VALUES (1,'3.1.1',0,'Limit information system access to authorized users, processes acting on behalf of authorized users, or devices (including other information systems).','What is question 3.1.1',NULL,'','','',1,0,0,'','',1,NULL,NULL,NULL),(2,'3.1.2',2,'Limit information system access to the types of transactions and functions that authorized users are permitted to execute.','What is question 3.1.2',NULL,'','','',1,0,0,'','',1,NULL,NULL,NULL),(3,'3.1.3',4,'Control the flow of CUI in accordance with approved authorizations.','What is question 3.1.3',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(4,'3.1.4',6,'Separate the duties of individuals to reduce the risk of malevolent activity without collusion.','What is question 3.1.4',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(5,'3.1.5',8,'Employ the principle of least privilege, including for specific security functions and privileged accounts.','What is question 3.1.5',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(6,'3.1.6',10,'Use non-privileged accounts or roles when accessing nonsecurity functions.','What is question 3.1.6',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(7,'3.1.7',12,'Prevent non-privileged users from executing privileged functions and audit the execution of such functions.','What is question 3.1.7',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(8,'3.1.8',14,'Limit unsuccessful logon attempts.','What is question 3.1.8',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(9,'3.1.9',16,'Provide privacy and security notices consistent with applicable CUI rules.','What is question 3.1.9',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(10,'3.1.10',18,'Use session lock with pattern-hiding displays to prevent access/viewing of data after period of inactivity.','What is question 3.1.10',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(11,'3.1.11',20,'Terminate (automatically) a user session after a defined condition.','What is question 3.1.11',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(12,'3.1.12',22,'Monitor and control remote access sessions.','What is question 3.1.12',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(13,'3.1.13',24,'Employ cryptographic mechanisms to protect the confidentiality of remote access sessions.','What is question 3.1.13',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(14,'3.1.14',26,'Route remote access via managed access control points.','What is question 3.1.14',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(15,'3.1.15',28,'Authorize remote execution of privileged commands and remote access to security-relevant information.','What is question 3.1.15',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(16,'3.1.16',30,'Authorize wireless access prior to allowing such connections.','What is question 3.1.16',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(17,'3.1.17',32,'Protect wireless access using authentication and encryption.','What is question 3.1.17',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(18,'3.1.18',34,'Control connection of mobile devices.','What is question 3.1.18',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(19,'3.1.19',36,'Encrypt CUI on mobile devices.','What is question 3.1.19',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(20,'3.1.20',38,'Verify and control/limit connections to and use of external information systems.','What is question 3.1.20',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(21,'3.1.21',40,'Limit use of organizational portable storage devices on external information systems.','What is question 3.1.21',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(22,'3.1.22',42,'Control information posted or processed on publicly accessible information systems.','What is question 3.1.22',NULL,'','','',2,0,0,'','',1,NULL,NULL,NULL),(23,'3.2.1',0,'Ensure that managers, systems administrators, and users of organizational information systems are made aware of the security risks associated with their activities and of the applicable policies, standards, and procedures related to the security of organizational information systems.','What is question 3.2.1',NULL,'','','',1,0,0,'','',2,NULL,NULL,NULL),(24,'3.2.2',1,'Ensure that organizational personnel are adequately trained to carry out their assigned information security-related duties and responsibilities.','What is question 3.2.2',NULL,'','','',1,0,0,'','',2,NULL,NULL,NULL),(25,'3.2.3',2,'Provide security awareness training on recognizing and reporting potential indicators of insider threat.','What is question 3.2.3',NULL,'','','',2,0,0,'','',2,NULL,NULL,NULL),(26,'3.3.1',0,'Create, protect, and retain information system audit records to the extent needed to enable the monitoring, analysis, investigation, and reporting of unlawful, unauthorized, or inappropriate information system activity.','What is question 3.3.1',NULL,'','','',1,0,0,'','',3,NULL,NULL,NULL),(27,'3.3.2',1,'Ensure that the actions of individual information system users can be uniquely traced to those users so they can be held accountable for their actions.','What is question 3.3.2',NULL,'','','',1,0,0,'','',3,NULL,NULL,NULL),(28,'3.3.3',2,'Review and update audited events.','What is question 3.3.3',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(29,'3.3.4',3,'Alert in the event of an audit process failure.','What is question 3.3.4',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(30,'3.3.5',4,'Correlate audit review, analysis, and reporting processes for investigation and response to indications of inappropriate, suspicious, or unusual activity.','What is question 3.3.5',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(31,'3.3.6',5,'Provide audit reduction and report generation to support on-demand analysis and reporting.','What is question 3.3.6',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(32,'3.3.7',6,'Provide an information system capability that compares and synchronizes internal system clocks with an authoritative source to generate time stamps for audit records.','What is question 3.3.7',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(33,'3.3.8',7,'Protect audit information and audit tools from unauthorized access, modification, and deletion.','What is question 3.3.8',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(34,'3.3.9',8,'Limit management of audit functionality to a subset of privileged users.','What is question 3.3.9',NULL,'','','',2,0,0,'','',3,NULL,NULL,NULL),(35,'3.4.1',0,'Establish and maintain baseline configurations and inventories of organizational information systems (including hardware, software, firmware, and documentation) throughout the respective system development life cycles.','What is question 3.4.1',NULL,'','','',1,0,0,'','',4,NULL,NULL,NULL),(36,'3.4.2',1,'Establish and enforce security configuration settings for information technology products employed in organizational information systems.','What is question 3.4.2',NULL,'','','',1,0,0,'','',4,NULL,NULL,NULL),(37,'3.4.3',2,'Track, review, approve/disapprove, and audit changes to information systems.','What is question 3.4.3',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(38,'3.4.4',3,'Analyze the security impact of changes prior to implementation.','What is question 3.4.4',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(39,'3.4.5',4,'Define, document, approve, and enforce physical and logical access restrictions associated with changes to the information system.','What is question 3.4.5',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(40,'3.4.6',5,'Employ the principle of least functionality by configuring the information system to provide only essential capabilities.','What is question 3.4.6',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(41,'3.4.7',6,'Restrict, disable, and prevent the use of nonessential programs, functions, ports, protocols, and services.','What is question 3.4.7',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(42,'3.4.8',7,'Apply deny-by-exception (blacklist) policy to prevent the use of unauthorized software or denyall, permit-by-exception (whitelisting) policy to allow the execution of authorized software.','What is question 3.4.8',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(43,'3.4.9',8,'Control and monitor user-installed software.','What is question 3.4.9',NULL,'','','',2,0,0,'','',4,NULL,NULL,NULL),(44,'3.5.1',0,'Identify information system users, processes acting on behalf of users, or devices.','What is question 3.5.1',NULL,'','','',1,0,0,'','',5,NULL,NULL,NULL),(45,'3.5.2',1,'Authenticate (or verify) the identities of those users, processes, or devices, as a prerequisite to allowing access to organizational information systems.','What is question 3.5.2',NULL,'','','',1,0,0,'','',5,NULL,NULL,NULL),(46,'3.5.3',2,'Use multifactor authentication* for local and network access** to privileged accounts and for network access to non-privileged accounts.','What is question 3.5.3',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(47,'3.5.4',3,'Employ replay-resistant authentication mechanisms for network access to privileged and nonprivileged accounts.','What is question 3.5.4',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(48,'3.5.5',4,'Prevent reuse of identifiers for a defined period.','What is question 3.5.5',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(49,'3.5.6',5,'Disable identifiers after a defined period of inactivity.','What is question 3.5.6',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(50,'3.5.7',6,'Enforce a minimum password complexity and change of characters when new passwords are created.','What is question 3.5.7',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(51,'3.5.8',7,'Prohibit password reuse for a specified number of generations.','What is question 3.5.8',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(52,'3.5.9',8,'Allow temporary password use for system logons with an immediate change to a permanent password.','What is question 3.5.9',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(53,'3.5.10',9,'Store and transmit only encrypted representation of passwords.','What is question 3.5.10',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(54,'3.5.11',10,'Obscure feedback of authentication information.','What is question 3.5.11',NULL,'','','',2,0,0,'','',5,NULL,NULL,NULL),(55,'3.6.1',0,'Establish an operational incident-handling capability for organizational information systems that includes adequate preparation, detection, analysis, containment, recovery, and user response activities.','What is question 3.6.1',NULL,'','','',1,0,0,'','',6,NULL,NULL,NULL),(56,'3.6.2',1,'Track, document, and report incidents to appropriate officials and/or authorities both internal and external to the organization.','What is question 3.6.2',NULL,'','','',1,0,0,'','',6,NULL,NULL,NULL),(57,'3.6.3',2,'Test the organizational incident response capability.','What is question 3.6.3',NULL,'','','',2,0,0,'','',6,NULL,NULL,NULL),(58,'3.7.1',0,'Perform maintenance on organizational information systems.*','What is question 3.7.1',NULL,'','','',1,0,0,'','',7,NULL,NULL,NULL),(59,'3.7.2',1,'Provide effective controls on the tools, techniques, mechanisms, and personnel used to conduct information system maintenance.','What is question 3.7.2',NULL,'','','',1,0,0,'','',7,NULL,NULL,NULL),(60,'3.7.3',2,'Ensure equipment removed for off-site maintenance is sanitized of any CUI.','What is question 3.7.3',NULL,'','','',2,0,0,'','',7,NULL,NULL,NULL),(61,'3.7.4',3,'Check media containing diagnostic and test programs for malicious code before the media are used in the information system.','What is question 3.7.4',NULL,'','','',2,0,0,'','',7,NULL,NULL,NULL),(62,'3.7.5',4,'Require multifactor authentication to establish nonlocal maintenance sessions via external network connections and terminate such connections when nonlocal maintenance is complete.','What is question 3.7.5',NULL,'','','',2,0,0,'','',7,NULL,NULL,NULL),(63,'3.7.6',5,'Supervise the maintenance activities of maintenance personnel without required access authorization.','What is question 3.7.6',NULL,'','','',2,0,0,'','',7,NULL,NULL,NULL),(64,'3.8.1',0,'Protect (i.e., physically control and securely store) information system media containing CUI, both paper and digital.','What is question 3.8.1',NULL,'','','',1,0,0,'','',8,NULL,NULL,NULL),(65,'3.8.2',1,'Limit access to CUI on information system media to authorized users.','What is question 3.8.2',NULL,'','','',1,0,0,'','',8,NULL,NULL,NULL),(66,'3.8.3',2,'Sanitize or destroy information system media containing CUI before disposal or release for reuse.','What is question 3.8.3',NULL,'','','',1,0,0,'','',8,NULL,NULL,NULL),(67,'3.8.4',3,'Mark media with necessary CUI markings and distribution limitations.*','What is question 3.8.4',NULL,'','','',2,0,0,'','',8,NULL,NULL,NULL),(68,'3.8.5',4,'Control access to media containing CUI and maintain accountability for media during transport outside of controlled areas.','What is question 3.8.5',NULL,'','','',2,0,0,'','',8,NULL,NULL,NULL),(69,'3.8.6',5,'Implement cryptographic mechanisms to protect the confidentiality of CUI stored on digital media during transport unless otherwise protected by alternative physical safeguards.','What is question 3.8.6',NULL,'','','',2,0,0,'','',8,NULL,NULL,NULL),(70,'3.8.7',6,'Control the use of removable media on information system components.','What is question 3.8.7',NULL,'','','',2,0,0,'','',8,NULL,NULL,NULL),(71,'3.8.8',7,'Prohibit the use of portable storage devices when such devices have no identifiable owner.','What is question 3.8.8',NULL,'','','',2,0,0,'','',8,NULL,NULL,NULL),(72,'3.8.9',8,'Protect the confidentiality of backup CUI at storage locations.','What is question 3.8.9',NULL,'','','',2,0,0,'','',8,NULL,NULL,NULL),(73,'3.9.1',0,'Screen individuals prior to authorizing access to information systems containing CUI.','What is question 3.9.1',NULL,'','','',1,0,0,'','',9,NULL,NULL,NULL),(74,'3.9.2',1,'Ensure that CUI and information systems containing CUI are protected during and after personnel actions such as terminations and transfers.','What is question 3.9.2',NULL,'','','',1,0,0,'','',9,NULL,NULL,NULL),(75,'3.10.1',0,'Limit physical access to organizational information systems, equipment, and the respective operating environments to authorized individuals.','What is question 3.10.1',NULL,'','','',1,0,0,'','',10,NULL,NULL,NULL),(76,'3.10.2',1,'Protect and monitor the physical facility and support infrastructure for those information systems.','What is question 3.10.2',NULL,'','','',1,0,0,'','',10,NULL,NULL,NULL),(77,'3.10.3',2,'Escort visitors and monitor visitor activity.','What is question 3.10.3',NULL,'','','',2,0,0,'','',10,NULL,NULL,NULL),(78,'3.10.4',3,'Maintain audit logs of physical access.','What is question 3.10.4',NULL,'','','',2,0,0,'','',10,NULL,NULL,NULL),(79,'3.10.5',4,'Control and manage physical access devices.','What is question 3.10.5',NULL,'','','',2,0,0,'','',10,NULL,NULL,NULL),(80,'3.10.6',5,'Enforce safeguarding measures for CUI at alternate work sites (e.g., telework sites).','What is question 3.10.6',NULL,'','','',2,0,0,'','',10,NULL,NULL,NULL),(81,'3.11.1',0,'Periodically assess the risk to organizational operations (including mission, functions, image, or reputation), organizational assets, and individuals, resulting from the operation of organizational information systems and the associated processing, storage, or transmission of CUI.','What is question 3.11.1',NULL,'','','',1,0,0,'','',11,NULL,NULL,NULL),(82,'3.11.2',1,'Scan for vulnerabilities in the information system and applications periodically and when new vulnerabilities affecting the system are identified.','What is question 3.11.2',NULL,'','','',2,0,0,'','',11,NULL,NULL,NULL),(83,'3.11.3',2,'Remediate vulnerabilities in accordance with assessments of risk.','What is question 3.11.3',NULL,'','','',2,0,0,'','',11,NULL,NULL,NULL),(84,'3.12.1',0,'Periodically assess the security controls in organizational information systems to determine if the controls are effective in their application.','What is question 3.12.1',NULL,'','','',1,0,0,'','',12,NULL,NULL,NULL),(85,'3.12.2',1,'Develop and implement plans of action designed to correct deficiencies and reduce or eliminate vulnerabilities in organizational information systems.','What is question 3.12.2',NULL,'','','',1,0,0,'','',12,NULL,NULL,NULL),(86,'3.12.3',2,'Monitor information system security controls on an ongoing basis to ensure the continued effectiveness of the controls.','What is question 3.12.3',NULL,'','','',1,0,0,'','',12,NULL,NULL,NULL),(87,'3.13.1',0,'Monitor, control, and protect organizational communications (i.e., information transmitted or received by organizational information systems) at the external boundaries and key internal boundaries of the information systems.','What is question 3.13.1',NULL,'','','',1,0,0,'','',13,NULL,NULL,NULL),(88,'3.13.2',1,'Employ architectural designs, software development techniques, and systems engineering principles that promote effective information security within organizational information systems.','What is question 3.13.2',NULL,'','','',1,0,0,'','',13,NULL,NULL,NULL),(89,'3.13.3',2,'Separate user functionality from information system management functionality.','What is question 3.13.3',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(90,'3.13.4',3,'Prevent unauthorized and unintended information transfer via shared system resources.','What is question 3.13.4',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(91,'3.13.5',4,'Implement subnetworks for publicly accessible system components that are physically or logically separated from internal networks.','What is question 3.13.5',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(92,'3.13.6',5,'Deny network communications traffic by default and allow network communications traffic by exception (i.e., deny all, permit by exception).','What is question 3.13.6',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(93,'3.13.7',6,'Prevent remote devices from simultaneously establishing non-remote connections with the information system and communicating via some other connection to resources in external networks.','What is question 3.13.7',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(94,'3.13.8',7,'Implement cryptographic mechanisms to prevent unauthorized disclosure of CUI during transmission unless otherwise protected by alternative physical safeguards.','What is question 3.13.8',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(95,'3.13.9',8,'Terminate network connections associated with communications sessions at the end of the sessions or after a defined period of inactivity.','What is question 3.13.9',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(96,'3.13.10',9,'Establish and manage cryptographic keys for cryptography employed in the information system.','What is question 3.13.10',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(97,'3.13.11',10,'Employ FIPS-validated cryptography when used to protect the confidentiality of CUI.','What is question 3.13.11',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(98,'3.13.12',11,'Prohibit remote activation of collaborative computing devices and provide indication of devices in use to users present at the device.','What is question 3.13.12',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(99,'3.13.13',12,'Control and monitor the use of mobile code.','What is question 3.13.13',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(100,'3.13.14',13,'Control and monitor the use of Voice over Internet Protocol (VoIP) technologies.','What is question 3.13.14',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(101,'3.13.15',14,'Protect the authenticity of communications sessions.','What is question 3.13.15',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(102,'3.13.16',15,'Protect the confidentiality of CUI at rest.','What is question 3.13.16',NULL,'','','',2,0,0,'','',13,NULL,NULL,NULL),(103,'3.14.1',0,'Identify, report, and correct information and information system flaws in a timely manner.','What is question 3.14.1',NULL,'','','',1,0,0,'','',14,NULL,NULL,NULL),(104,'3.14.2',1,'Provide protection from malicious code at appropriate locations within organizational information systems.','What is question 3.14.2',NULL,'','','',1,0,0,'','',14,NULL,NULL,NULL),(105,'3.14.3',2,'Monitor information system security alerts and advisories and take appropriate actions in response.','What is question 3.14.3',NULL,'','','',1,0,0,'','',14,NULL,NULL,NULL),(106,'3.14.4',3,'Update malicious code protection mechanisms when new releases are available.','What is question 3.14.4',NULL,'','','',2,0,0,'','',14,NULL,NULL,NULL),(107,'3.14.5',4,'Perform periodic scans of the information system and real-time scans of files from external sources as files are downloaded, opened, or executed.','What is question 3.14.5',NULL,'','','',2,0,0,'','',14,NULL,NULL,NULL),(108,'3.14.6',5,'Monitor the information system including inbound and outbound communications traffic, to detect attacks and indicators of potential attacks.','What is question 3.14.6',NULL,'','','',2,0,0,'','',14,NULL,NULL,NULL),(109,'3.14.7',6,'Identify unauthorized use of the information system.','What is question 3.14.7',NULL,'','','',2,0,0,'','',14,NULL,NULL,NULL);
/*!40000 ALTER TABLE `controls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16 14:36:12
