-- begin CREDIT_CREDIT_TYPE
create table CREDIT_CREDIT_TYPE (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    CODE varchar(9) not null,
    NAME varchar(150) not null,
    COMMENT_ text,
    --
    primary key (ID)
)^
-- end CREDIT_CREDIT_TYPE
-- begin CREDIT_CREDIT
create table CREDIT_CREDIT (
    CARD_ID uuid,
    --
    NUMBER_ varchar(50),
    CREDIT_TYPE_ID uuid,
    BANK_ID uuid,
    DATE_ date,
    AMOUNT double precision,
    --
    primary key (CARD_ID)
)^
-- end CREDIT_CREDIT
-- begin CREDIT_CREDIT_APPLICATION
create table CREDIT_CREDIT_APPLICATION (
    CARD_ID uuid,
    --
    CREDIT_ID uuid,
    INDIVIDUAL_ID uuid,
    --
    primary key (CARD_ID)
)^
-- end CREDIT_CREDIT_APPLICATION
