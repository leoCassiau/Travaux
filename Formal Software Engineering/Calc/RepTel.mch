/* RepTel
 * Author: 
 * Creation date: 28/09/16
 */
MACHINE
    RepTel

SETS
    PERS;
    NUMS

VARIABLES
    numeroDe,
    pers
    
INVARIANT
    numeroDe : pers<->NUMS &
    pers <: PERS
END
