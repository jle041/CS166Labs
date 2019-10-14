DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS work_dept;
DROP TABLE IF EXISTS work_in;
DROP TABLE IF EXISTS work_proj;

CREATE TABLE Professor (ssn numeric(9, 0) NOT NULL,
			name CHAR(20),
			age INTEGER,
			rank CHAR(20),
			specialty CHAR(20),
			PRIMARY KEY(ssn));

CREATE TABLE Department (dno INTEGER NOT NULL,
			dname CHAR(20),
			office CHAR(20),
			runs CHAR(20) NOT NULL,
			PRIMARY KEY(dno),
			FOREIGN KEY(runs) REFERENCES Professor(ssn));

CREATE TABLE Graduate (SSN numeric(9, 0) NOT NULL,
			name CHAR(20),
			age INTEGER,
			deg_pg CHAR(20),
			major CHAR(20) NOT NULL,
			advise CHAR(20) NOT NULL,
			PRIMARY KEY(SSN),
			FOREIGN KEY(major) REFERENCES Department(dno),
			FOREIGN KEY(advise) REFERENCES Graduate(SSN));

CREATE TABLE Project (pno INTEGER NOT NULL,
			sponsor CHAR(20),
			start_date DATE,
			end_date DATE,
			budget INTEGER,
			manage CHAR(20) NOT NULL,
			PRIMARY KEY(pno),
			FOREIGN KEY(manage) REFERENCES Professor(ssn));

CREATE TABLE work_dept (time_pc CHAR(3) NOT NULL,
			ssn numeric(9, 0) NOT NULL,
			dno INTEGER NOT NULL,
			PRIMARY KEY(ssn, dno),
			FOREIGN KEY(ssn) REFERENCES Professors(ssn),
			FOREIGN KEY(dno) REFERENCES Department(dno));

CREATE TABLE work_in (ssn numeric(9, 0) NOT NULL,
			pno INTEGER NOT NULL,
			PRIMARY KEY(ssn, pno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn),
			FOREIGN KEY(pno) REFERENCES Project(pno));

CREATE TABLE work_proj (since DATE NOT NULL,
			pno INTEGER NOT NULL,
			SSN numeric(9, 0) NOT NULL,
			supervise CHAR(20) NOT NULL,
			PRIMARY KEY(pno, SSN),
			FOREIGN KEY(pno) REFERENCES Project(pno),
			FOREIGN KEY(SSN) REFERENCES Graduate(SSN)
			FOREIGN KEY(supervise) REFERENCES Professor(ssn));
