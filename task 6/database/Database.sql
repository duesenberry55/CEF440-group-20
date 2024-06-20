use DisasterManagement;

CREATE TABLE Users (
    username VARCHAR(50) PRIMARY KEY,
    Number VARCHAR(50),
    Location VARCHAR(100)
);

CREATE TABLE Authority (
    ID_Number INT PRIMARY KEY,
    FN_LN VARCHAR(100),
    Location VARCHAR(100),
    Mobile_Number VARCHAR(50),
    Email VARCHAR(100),
    Password VARCHAR(50)
);

CREATE TABLE Respondent (
    ID_Number INT PRIMARY KEY,
    respondent_name VARCHAR(100),
    Password VARCHAR(50),
    Mobile_Number VARCHAR(50),
    Email VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Contacts (
    contact_id INT PRIMARY KEY,
    contact_name VARCHAR(100),
    contact_method VARCHAR(100),
    Phone VARCHAR(50),
    Description TEXT,
    Incident_type VARCHAR(100),
    availability VARCHAR(100),
    Location VARCHAR(100),
    authority_id INT,
    FOREIGN KEY (authority_id) REFERENCES Authority(ID_Number)
);

CREATE TABLE Emergency (
    emergency_name VARCHAR(100) PRIMARY KEY,
    Location VARCHAR(100)
);

CREATE TABLE Reports (
    Title VARCHAR(100) PRIMARY KEY,
    Note TEXT,
    Description TEXT,
    Incident_type VARCHAR(100),
    Location VARCHAR(100),
    Attachment VARCHAR(100),
    emergency_id VARCHAR(100),
    authority_id INT,
    FOREIGN KEY (emergency_id) REFERENCES Emergency(emergency_name),
    FOREIGN KEY (authority_id) REFERENCES Authority(ID_Number)
);

CREATE TABLE Calls (
    call_id INT PRIMARY KEY,
    caller_number VARCHAR(50),
    callee_number VARCHAR(50),
    Mobile_Number VARCHAR(50),
    call_duration INT,
    direction VARCHAR(50),
    notes TEXT,
    authority_id INT,
    user_id VARCHAR(50),
    respondent_id INT,
    FOREIGN KEY (authority_id) REFERENCES Authority(ID_Number),
    FOREIGN KEY (user_id) REFERENCES Users(username),
    FOREIGN KEY (respondent_id) REFERENCES Respondent(ID_Number)
);

CREATE TABLE Alerts (
    Title VARCHAR(100) PRIMARY KEY,
    Incident_types VARCHAR(100),
    Description TEXT,
    Location VARCHAR(100),
    authority_id INT,
    FOREIGN KEY (authority_id) REFERENCES Authority(ID_Number)
);

CREATE TABLE First_aid_and_safety_tips (
    Title VARCHAR(100) PRIMARY KEY,
    Description TEXT
);