alter table CREDIT_CREDIT add constraint FK_CREDIT_CREDIT_ON_CREDIT_TYPE foreign key (CREDIT_TYPE_ID) references CREDIT_CREDIT_TYPE(ID);
alter table CREDIT_CREDIT add constraint FK_CREDIT_CREDIT_ON_BANK foreign key (BANK_ID) references DF_BANK(ID);
alter table CREDIT_CREDIT add constraint FK_CREDIT_CREDIT_ON_CARD foreign key (CARD_ID) references WF_CARD(ID) on delete CASCADE;
create index IDX_CREDIT_CREDIT_ON_CREDIT_TYPE on CREDIT_CREDIT (CREDIT_TYPE_ID);
create index IDX_CREDIT_CREDIT_ON_BANK on CREDIT_CREDIT (BANK_ID);
