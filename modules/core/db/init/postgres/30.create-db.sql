-- begin insert secPermissions for CreditType
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:create', 0, (select ID from SEC_ROLE where NAME = 'SimpleUser'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:delete', 0, (select ID from SEC_ROLE where NAME = 'SimpleUser'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:create', 1, (select ID from SEC_ROLE where NAME = 'Administrators'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:update', 1, (select ID from SEC_ROLE where NAME = 'Administrators'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:delete', 1, (select ID from SEC_ROLE where NAME = 'Administrators'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:update', 0, (select ID from SEC_ROLE where NAME = 'SimpleUser'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:create', 1, (select ID from SEC_ROLE where NAME = 'ReferenceEditor'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:update', 1, (select ID from SEC_ROLE where NAME = 'ReferenceEditor'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditType:delete', 1, (select ID from SEC_ROLE where NAME = 'ReferenceEditor'))^
-- end insert secPermissions for CreditType
-- begin insert default numerator for Credit
CREATE OR REPLACE FUNCTION baseInsert()
RETURNS integer
AS $$
DECLARE
    cnt integer = 0;
BEGIN
cnt = (select count(id) from DF_NUMERATOR where CODE = 'CreditNumerator' and delete_ts is null);
if(cnt = 0) then
    INSERT INTO DF_NUMERATOR (ID, CREATE_TS, CREATED_BY, VERSION, CODE, NUMERATOR_FORMAT, SCRIPT_ENABLED,
                              PERIODICITY, NUMBER_INITIAL_VALUE, LOC_NAME)
    VALUES ('82f633f5-c643-47ba-8546-c77767fed583', now(), 'system', 1, 'CreditNumerator', '[number]', FALSE, 'Y', 1,
            '{"captionWithLanguageList":[{"language":"ru","caption":"Кредит"},{"language":"en","caption":"Credit"}]}'
    );
end if;

return 0;
END;
$$
LANGUAGE plpgsql;
^

select baseInsert()^
drop function if exists baseInsert()^
-- end insert default numerator for Credit
-- begin insert secConstraints for Credit
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
       values (newid(), now(), 'system', 'credit$Credit', 'left outer join {E}.aclList acl', 'acl.user.id = :session$userId or acl.global = true', '8e6306e2-9e10-414a-b437-24c91ffef804')^
-- end insert secConstraints for Credit
-- begin insert cardType for Credit
insert into TS_CARD_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR, FIELDS_XML)
       values ('2d924992-b1df-4528-bb49-6ee48887536c', now(), 'system', 'credit$Credit', '2000', '<?xml version="1.0" encoding="UTF-8"?>
<fields>
  <field name="number" inDocKind="false" required="false" visible="true" signed="false" />
  <field name="creditType" inDocKind="false" required="false" visible="true" signed="false" />
  <field name="bank" inDocKind="false" required="false" visible="true" signed="false" />
  <field name="date" inDocKind="false" required="false" visible="true" signed="false" />
  <field name="amount" inDocKind="false" required="false" visible="true" signed="false" />
</fields>
')^
-- end insert cardType for Credit
-- begin insert default numerator for CreditApplication
CREATE OR REPLACE FUNCTION baseInsert()
RETURNS integer
AS $$
DECLARE
    cnt integer = 0;
BEGIN
cnt = (select count(id) from DF_NUMERATOR where CODE = 'CreditApplicationNumerator' and delete_ts is null);
if(cnt = 0) then
    INSERT INTO DF_NUMERATOR (ID, CREATE_TS, CREATED_BY, VERSION, CODE, NUMERATOR_FORMAT, SCRIPT_ENABLED,
                              PERIODICITY, NUMBER_INITIAL_VALUE, LOC_NAME)
    VALUES ('3cb8e525-c52b-4866-851f-c7af014f5b13', now(), 'system', 1, 'CreditApplicationNumerator', '[number]', FALSE, 'Y', 1,
            '{"captionWithLanguageList":[{"language":"ru","caption":"Заявка на кредит"},{"language":"en","caption":"Credit application"}]}'
    );
end if;

return 0;
END;
$$
LANGUAGE plpgsql;
^

select baseInsert()^
drop function if exists baseInsert()^
-- end insert default numerator for CreditApplication
-- begin insert cardType for CreditApplication
insert into TS_CARD_TYPE (ID, CREATE_TS, CREATED_BY, NAME, DISCRIMINATOR, FIELDS_XML)
       values ('25ec4603-3619-4ca8-a3d6-e407894db769', now(), 'system', 'credit$CreditApplication', '2100', '<?xml version="1.0" encoding="UTF-8"?>
<fields>
  <field name="date" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="docCategory" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="owner" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="department" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="comment" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="finishDatePlan" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="resolution" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="number" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="organization" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="parentCard" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="theme" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="credit" inDocKind="true" required="false" visible="true" signed="false" />
  <field name="individual" inDocKind="true" required="false" visible="true" signed="false" />
</fields>
')^
-- end insert cardType for CreditApplication
-- begin update procCardType for CreditApplication
update wf_proc set card_types = regexp_replace(card_types, ',credit\\$CreditApplication', '') where code in ('Endorsement', 'Resolution', 'Acquaintance', 'Registration')^
update wf_proc set updated_by='system', card_types = card_types || 'credit$CreditApplication,' where code in ('Endorsement', 'Resolution', 'Acquaintance', 'Registration')^
-- end update procCardType for CreditApplication
-- begin insert docKind for CreditApplication
CREATE OR REPLACE FUNCTION baseInsert()
RETURNS integer
AS $$
DECLARE
    cnt integer = 0;
BEGIN
    cnt = (select count(CATEGORY_ID) from DF_DOC_KIND where CATEGORY_ID = 'dc2ba89c-f92f-48d3-a7c8-6f8d71367e41');
    if (cnt = 0) then
        insert into SYS_CATEGORY (ID, NAME, ENTITY_TYPE, IS_DEFAULT, CREATE_TS, CREATED_BY, VERSION, DISCRIMINATOR)
        values ('dc2ba89c-f92f-48d3-a7c8-6f8d71367e41', 'Заявка на кредит', 'credit$CreditApplication', false, now(), 'system', 1, 1);

        insert into DF_DOC_KIND (CATEGORY_ID, CREATE_TS, CREATED_BY, VERSION, DOC_TYPE_ID, NUMERATOR_ID,
                                 NUMERATOR_TYPE, CATEGORY_ATTRS_PLACE, TAB_NAME, PORTAL_PUBLISH_ALLOWED, DISABLE_ADD_PROCESS_ACTORS, CREATE_ONLY_BY_TEMPLATE)
        values ('dc2ba89c-f92f-48d3-a7c8-6f8d71367e41', now(), 'system', 1, '25ec4603-3619-4ca8-a3d6-e407894db769', '3cb8e525-c52b-4866-851f-c7af014f5b13',
                1, 1, 'Доп. поля', false, false, false);
end if;
return 0;
END;
$$
LANGUAGE plpgsql;
^
select baseInsert();^
drop function if exists baseInsert();^
-- end insert docKind for CreditApplication
-- begin insert secPermissions for CreditApplication
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:create', 0, (select ID from SEC_ROLE where NAME = 'SimpleUser'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:delete', 0, (select ID from SEC_ROLE where NAME = 'SimpleUser'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:create', 1, (select ID from SEC_ROLE where NAME = 'Administrators'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:update', 1, (select ID from SEC_ROLE where NAME = 'Administrators'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:delete', 1, (select ID from SEC_ROLE where NAME = 'Administrators'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:create', 1, (select ID from SEC_ROLE where NAME = 'doc_initiator'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:update', 1, (select ID from SEC_ROLE where NAME = 'doc_initiator'))^
insert into SEC_PERMISSION (ID, CREATE_TS, CREATED_BY, VERSION, UPDATE_TS, UPDATED_BY, DELETE_TS, DELETED_BY, PERMISSION_TYPE, TARGET, VALUE_, ROLE_ID)
values (newid(), now(), 'system', 1, now(), null, null, null, 20, 'credit$CreditApplication:delete', 1, (select ID from SEC_ROLE where NAME = 'doc_initiator'))^
-- end insert secPermissions for CreditApplication
