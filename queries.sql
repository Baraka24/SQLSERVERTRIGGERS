
CREATE OR REPLACE FUNCTION check_constraints()
RETURNS TRIGGER AS $$
BEGIN
    -- Contrôle de la contrainte 1
    IF NEW.NumVille NOT IN ('01', '07', '26', '38', '42', '69', '73', '74') THEN
        RAISE EXCEPTION 'Le numéro de ville doit être 01, 07, 26, 38, 42, 69, 73, ou 74.';
    END IF;

    -- Contrôle de la contrainte 2
    IF NEW.CONJOINT IS NOT NULL AND NEW.CONJOINT != NEW.NOM THEN
        RAISE EXCEPTION 'Le nom du conjoint doit être le même que celui du client.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_client_constraints
BEFORE INSERT ON CLIENT
FOR EACH ROW
EXECUTE FUNCTION check_constraints();

CREATE TRIGGER check_detenteur_constraints
BEFORE INSERT ON DETENTEUR
FOR EACH ROW
EXECUTE FUNCTION check_constraints();


