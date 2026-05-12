-- One-time script: remove all already-retired players from unplayed teamcomps
-- Run once; the trigger handles future retirements automatically.

DO $$
DECLARE
    rec_player RECORD;
    counter INTEGER := 0;
BEGIN
    FOR rec_player IN
        SELECT id, id_club
        FROM players
        WHERE date_retire IS NOT NULL
    LOOP
        PERFORM player_remove_from_teamcomps(rec_player);
        counter := counter + 1;
    END LOOP;

    RAISE NOTICE 'Done: processed % retired player(s).', counter;
END;
$$;
