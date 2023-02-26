-- begin update procCardType for CreditApplication
update wf_proc set card_types = regexp_replace(card_types, ',credit\\$CreditApplication', '') where code in ('Endorsement', 'Resolution', 'Acquaintance', 'Registration')^
update wf_proc set updated_by='system', card_types = card_types || 'credit$CreditApplication,' where code in ('Endorsement', 'Resolution', 'Acquaintance', 'Registration')^
-- end update procCardType for CreditApplication
