/* Calc
 * Author: Léo Cassiau
 * Creation date: 28/09/16
 */
MACHINE
    Calc
ABSTRACT_VARIABLES
    RP , RS
INVARIANT
    RP : NAT & 0 <= RP & RP <= 255
    & RS : NAT & 0 <= RS & RS <= 255
INITIALISATION
    RP := 0
    || RS := 0
OPERATIONS
    setRP ( nx ) =
    PRE
        nx : NAT & nx <= 255 & 0 <= nx
    THEN
        RP := nx
    END ;

    add ( vc ) =
    PRE
        vc : NAT & 0 <= vc & vc <= 255 &
        RP + vc <= 255 & 0 <= RP + vc
    THEN
        RP := RP + vc
    END

END
