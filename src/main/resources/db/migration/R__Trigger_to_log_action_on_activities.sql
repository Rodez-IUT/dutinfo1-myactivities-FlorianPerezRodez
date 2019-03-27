DROP TRIGGER IF EXISTS check_delete ON activity;

CREATE OR REPLACE FUNCTION insert_action_log() RETURNS trigger AS $$
		DECLARE
		BEGIN
			INSERT INTO action_log VALUES(nextval('id_generator'),'delete','activity','postgres',OLD.id);
			RETURN NULL;
		END
$$LANGUAGE plpgsql;

CREATE TRIGGER check_delete 
    AFTER DELETE ON activity
    FOR EACH ROW
    EXECUTE PROCEDURE insert_action_log();