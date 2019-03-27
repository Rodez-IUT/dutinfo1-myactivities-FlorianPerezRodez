CREATE TRIGGER check_delete
    BEFORE DELETE ON activity
    FOR EACH ROW
    EXECUTE PROCEDURE log_account_update();
$$ LANGUAGE SQL;