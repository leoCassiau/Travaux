/* Systeme
 * Auteurs : Léo Cassiau, TODO vous rajoutez (désolé je connais pas vos noms)
 * Impossible de séparer processus, noms et services car leurs ensembles ont des dépendances
 * Date de création : 05/10/16
 */
MACHINE
    Systeme

SETS
    PROFILS ;
    SERVICES ;
    PROCESSUS ;
    NOMS


ABSTRACT_VARIABLES
    services ,   // Services du système
    processus ,  // Processus du système
    noms ,       // Noms du systèmes
    nomDe ,      // Noms des services du systèmes
    contraint ,  // Service contraint ou non ?
    exclusif ,   // Service exclusif ou non ?
    actif ,      // Service actif ou non ?
    souscrit ,   // Processus inscrits au services
    profilDe ,   // Profil des processus
    profilsAutorises // Profils autorises des services

INVARIANT
    services <: SERVICES
    & processus <: PROCESSUS
    & noms <: NOMS
    & contraint : services --> BOOL
    & exclusif : services --> BOOL
    & actif : services --> BOOL
    & souscrit : processus <-> services
    & profilDe : processus --> PROFILS
    & profilsAutorises : services <-> PROFILS
    & nomDe : services >->> noms
    & ( ( ( profilsAutorises /= {} ) & ( contraint ~ [ { FALSE } ] /= {} ) ) => ( profilsAutorises [ contraint ~ [ { FALSE } ] ] <: PROFILS ) ) // les services non contraints autorisent tous les profils de processus
    & ( ( card ( profilsAutorises ) >= 1 ) => ( card ( profilsAutorises [ contraint ~ [ { TRUE } ] ] ) >= 1 ) ) // les services contraints autorisent au moins un profil de processus
    //& ((card(souscrit) >= 1) => (actif[ran(souscrit)] = {TRUE})) // un processus ne peut pas être souscrit à un service désactivé

INITIALISATION
   actif := {}
   || nomDe := {}
   || contraint := {}
   || exclusif := {}
   || souscrit := {}
   || services := {}
   || profilDe := {}
   || profilsAutorises := {}
   || noms := {}
   || processus := {}

OPERATIONS

    res <-- ajouterService ( nom , cc , ee ) = // Ajout du service res aux services du système. nom : nom du service, cc : service contraint ou non ?, ee : service exclusif ou non ?
    PRE
        nom : NOMS
        & nom /: ran ( nomDe )
        & cc : BOOL
        & ee : BOOL

    THEN
        ANY ss WHERE
            ss : SERVICES
            & ss /: services
            & ss /: dom ( profilsAutorises )
            & ss /: ran ( souscrit )
            & ss /: dom ( nomDe )
            & ss /: dom ( contraint )
            & ss /: dom ( exclusif )
            & ss /: dom ( actif )
        THEN
            noms := noms \/ { nom }
            || nomDe ( ss ) := nom
            || contraint ( ss ) := cc
            || profilsAutorises := profilsAutorises \/ { ss } * PROFILS
            || exclusif ( ss ) := ee
            || actif ( ss ) := FALSE
            || services := services \/ { ss }
            || res := ss
        END
    END ;

    souscrire ( pp , ss ) = // pp processus qui souscrit au service ss
    PRE
        pp : processus
        & ss : services
        & ( pp |-> ss ) /: souscrit // le processus ne doit pas être déjà souscrit au service
        & actif [ { ss } ] = { TRUE } // on ne peut pas souscrire à un service inactif
        //& ss /: (exclusif~[{TRUE}] /\ ran(souscrit))// on peut pas pas souscrire un service exclusif qui a déjà un processus souscrit
    THEN
        souscrit := souscrit \/ { ( pp |-> ss ) }
    END ;

    suspendre ( pp , ss ) = // pp processus qui suspend une souscription au service ss
    PRE
        pp : processus
        & ss : services
        & ( pp |-> ss ) : souscrit
    THEN
        souscrit := souscrit - { ( pp |-> ss ) }

    END ;

    activerService ( ns ) = // permet d'activer un service dont le nom est donné en parametre, ns∈ nom du service
    PRE
        ns : noms
        & ns : ran ( nomDe ) // le nom doit correspondre à un service
        & actif [ nomDe ~ [ { ns } ] ] = { FALSE } // le service qui correspond au nom est non actif       
    THEN
        ANY ss WHERE
                        ss : services
            & ss = nomDe ~ ( ns )
        THEN
            actif ( ss ) := TRUE
        END
    END ;

    interrompreService ( ns ) = // permet d'interrompre un service dont le nom est donné en parametre, ns: nom du service
    PRE
        ns : noms
        & ns : ran ( nomDe ) // le nom doit correspondre à un service
        & actif [ nomDe ~ [ { ns } ] ] = { TRUE } // le service qui correspond au nom est actif
    THEN
        ANY ss WHERE
                        ss : services
            & ss = nomDe ~ ( ns )
        THEN
            actif ( ss ) := FALSE
            // TODO dans le raffinement : informer les processus que ce service est désactivé
        END

    END ;

    res <-- ajouterProcessus ( profil ) = // ajout du processus res avec le profil indiqué aux processus du système
    PRE
        profil : PROFILS
    THEN
        ANY pp WHERE
            pp : PROCESSUS &
            pp /: processus
        THEN
            profilDe ( pp ) := profil
            || processus := processus \/ { pp }
            || res := pp
        END
    END ;

    supprimerProcessus ( pp ) = // suppression du processus pp du système
    PRE
        pp : processus
        & pp : dom ( profilDe )
        & pp : dom ( souscrit )
    THEN
        processus := processus - { pp }
        || profilDe := { pp } <<| profilDe
        || souscrit := { pp } <<| souscrit
    END ;

    modifierProfil ( pp , np ) = // modifie le profil du processus pp en profil np
    PRE
        pp : processus
        & np : PROFILS
    THEN
        profilDe ( pp ) := np
    END ;

    res <-- estActif ( ss ) = // retourne vrai si le service ss est actif, faux sinon
    PRE
        ss : services &
        actif ( ss ) = TRUE
    THEN
        res := actif ( ss )
    END ;

    mettreExclusifService ( ns ) = // permet de mettre en exclusif un service dont le nom est donné en parametre, ns: nom du service
    PRE
        ns : noms
        & ns : ran ( nomDe ) // le nom doit correspondre à un service
    THEN
        exclusif ( nomDe ~ ( ns ) ) := TRUE
    END ;

     mettreNonExclusifService ( ns ) =
 // permet de mettre en non exclusif un service dont le nom est donné en parametre, ns: nom du service
    PRE
        ns : noms
        & ns : ran ( nomDe ) // le nom doit correspondre à un service
    THEN
        exclusif ( nomDe ~ ( ns ) ) := FALSE
    END ;



    mettreContraint ( ns ) = // permet de mettre contraint un service dont le nom est en parametre , ns: nom du service
    PRE
        ns : noms
        & ns : ran ( nomDe ) // le nom doit correspondre à un service
    THEN
        ANY ss WHERE
                            ss : services
            & ss = nomDe ~ ( ns )
        THEN
            contraint ( ss ) := TRUE
        END
    END ;

    mettreNonContraint ( ns ) =   // permet de mettre non contraint un service dont le nom est en                                       
                                  //  parametre pour un profil donné, ns: nom du service, profil:     
                                  //profil usager
    PRE
        ns : noms
        & ns : ran ( nomDe ) // le nom doit correspondre à un service
    THEN
        ANY ss WHERE
                            ss : services
            & ss = nomDe ~ ( ns )
        THEN
            profilsAutorises := profilsAutorises \/ ( { ss } * PROFILS )
            || contraint ( ss ) := FALSE
        END
    END ;

    supprimerProfilAutorise ( ns , ps ) = // Supprime le profil ps des profils autorises du service contraint ns
    PRE
        ns : noms
        & ns : ran ( nomDe )
        & contraint ( nomDe ~ ( ns ) ) = TRUE
        & ps : PROFILS
        & ps : profilsAutorises [ { nomDe ~ ( ns ) } ]
        & card ( profilsAutorises [ { nomDe ~ ( ns ) } ] ) > 1
    THEN
        ANY ss WHERE
                            ss : services
            & ss = nomDe ~ ( ns )
        THEN
            profilsAutorises := profilsAutorises - { ( ss |-> ps ) }
        END
    END
END
