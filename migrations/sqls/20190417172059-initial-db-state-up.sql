CREATE TABLE IF NOT EXISTS Campaigns (
    campaign_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(256) NOT NULL UNIQUE,
    name VARCHAR(256) NOT NULL,
    date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    campaign_date_start TIMESTAMP NOT NULL,
    campaign_date_end TIMESTAMP NOT NULL,
    description VARCHAR(1024) NOT NULL,
    body VARCHAR(2048) NOT NULL,

    PRIMARY KEY (campaign_id)
);

CREATE TRIGGER uuid_before_campaign_insert
    BEFORE INSERT ON Campaigns
    FOR EACH ROW
    SET new.uuid = uuid();

CREATE TABLE IF NOT EXISTS Sms (
    sms_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(256) NOT NULL UNIQUE,
    campaign_id INT(11) UNSIGNED NOT NULL,
    phone_number INT(16) UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(64),
    surname VARCHAR(64),
    discount_desc VARCHAR(64),
    product_desc VARCHAR(64),

    PRIMARY KEY (sms_id),
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id)
);

CREATE TRIGGER uuid_before_sms_insert
    BEFORE INSERT ON Sms
    FOR EACH ROW
    SET new.uuid = uuid();

CREATE TABLE IF NOT EXISTS Campaign_status (
    campaign_status_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    uuid VARCHAR(256) NOT NULL UNIQUE,
    sms_id INT(11) UNSIGNED NOT NULL,
    campaign_id INT(11) UNSIGNED NOT NULL,
    date_logged TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    success BOOLEAN,

    PRIMARY KEY (campaign_status_id),
    FOREIGN KEY (campaign_id) REFERENCES Campaigns(campaign_id),
    FOREIGN KEY (sms_id) REFERENCES Sms(sms_id)
);

CREATE TRIGGER uuid_before_campaign_status_insert
    BEFORE INSERT ON Campaign_status
    FOR EACH ROW
    SET new.uuid = uuid();


