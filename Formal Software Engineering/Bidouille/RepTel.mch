/* RepTel
 * Author: Léo Cassiau
 * Creation date: 28/09/16
 */
MACHINE
    RepTel
    
SETS
    PERS;
    NUMS

VARIABLES
    NumeroDe,
    Pers

INVARIANT
    NumeroDe : PERS<->NUMS &
    Pers <: PERS
    
INITIALISATION
    Pers := {} ||
    NumeroDe := {}

OPERATIONS
   ajoutPers(np) = 
   PRE
       np : PERS &
       np /: Pers
   THEN
       Pers := Pers \/ {np}
   END;
   
   supprimerPers(np) = 
   PRE
       np : PERS &
       np : dom(NumeroDe)
   THEN
       Pers := Pers - {np} ||
       NumeroDe := {np} <<| NumeroDe
   END;
   
   res <-- listerPers(ni) =
   PRE
       ni : NUMS &
       ni : ran(NumeroDe)
   THEN
       res := NumeroDe~[{ni}]
   END;
   
   nouveauNum(nn, pi) = 
   PRE
       pi : PERS &
       nn : NUMS &
       pi : dom(NumeroDe)
   THEN
       NumeroDe := (NumeroDe - ({pi} <| NumeroDe)) \/ {(pi,nn)}
   END
   
END
