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
