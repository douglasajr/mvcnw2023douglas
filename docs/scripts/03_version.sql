CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    version CHAR(32) NOT NULL,
    description VARCHAR(255) COMMENT 'Description',
    create_at DATETIME COMMENT 'Create Time'
) COMMENT '';