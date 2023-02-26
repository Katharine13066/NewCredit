-- begin insert secConstraints for Credit
insert into SEC_CONSTRAINT (ID, CREATE_TS, CREATED_BY, ENTITY_NAME, JOIN_CLAUSE, WHERE_CLAUSE, GROUP_ID)
       values (newid(), now(), 'system', 'credit$Credit', 'left outer join {E}.aclList acl', 'acl.user.id = :session$userId or acl.global = true', '8e6306e2-9e10-414a-b437-24c91ffef804')^
-- end insert secConstraints for Credit
