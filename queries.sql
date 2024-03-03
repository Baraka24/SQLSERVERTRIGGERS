
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


CREATE OR REPLACE FUNCTION auto_increment()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifier si la valeur de CLENUM est NULL ou non définie
    IF NEW.CLENUM IS NULL THEN
        -- Trouver le maximum actuel de CLENUM dans la table
        SELECT COALESCE(MAX(CLENUM), 0) + 1 INTO NEW.CLENUM FROM VOTRE_TABLE;

        -- Si aucun enregistrement n'existe encore, initialiser à 1
        IF NEW.CLENUM IS NULL THEN
            NEW.CLENUM := 1;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER increment_trigger
BEFORE INSERT ON VOTRE_TABLE
FOR EACH ROW
EXECUTE FUNCTION auto_increment();
