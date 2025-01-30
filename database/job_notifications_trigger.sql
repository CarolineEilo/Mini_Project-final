DELIMITER //

DROP TRIGGER IF EXISTS create_nanny_notifications//

CREATE TRIGGER create_nanny_notifications 
AFTER INSERT ON searchnanny
FOR EACH ROW
BEGIN
    DECLARE parent_fullname VARCHAR(150);
    
    -- Get parent name
    SELECT Fullname INTO parent_fullname 
    FROM parentstbl 
    WHERE ID = NEW.parent_id;

    -- Insert notifications for matching nannies
    INSERT INTO notifications (
        parent_id,
        nanny_id,
        parent_name,
        nanny_email,
        message,
        status,
        created_at
    )
    SELECT 
        NEW.parent_id,
        n.ID,
        parent_fullname,
        n.Email,
        CONCAT(
            parent_fullname, 
            ' is looking for a nanny in ', 
            NEW.location, 
            ' for ', 
            NEW.numberOfchildren,
            ' child(ren). Age category: ',
            NEW.ageCategory,
            '. Work type: ',
            NEW.domesticWork,
            '. Offered price: N$',
            NEW.price
        ),
        'pending',
        NOW()
    FROM nannytbl n
    WHERE (n.DomesticWork = NEW.domesticWork 
           OR NEW.domesticWork LIKE CONCAT('%', n.DomesticWork, '%'))
    AND n.Price <= NEW.price;
END//

DELIMITER ;