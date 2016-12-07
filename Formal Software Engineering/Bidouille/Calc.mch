/* Calc
 * Author: Léo Cassiau
 * Creation date: 28/09/16
 */
MACHINE
    Calc
VARIABLES
    RP, RS
INVARIANT
    RP : NAT & 0 <= RP & RP <= 255  
    & RS : NAT & 0 <= RS & RS <= 255
INITIALISATION
    RP := 0 
    || RS := 0

EVENTS

     toto =
        SELECT
     RP = 0
        THEN
    RP := 1
    END;


    

END
