Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Systeme))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Systeme))==(Machine(Systeme));
  Level(Machine(Systeme))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Systeme)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Systeme))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Systeme))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Systeme))==(?);
  List_Includes(Machine(Systeme))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Systeme))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Systeme))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Systeme))==(?);
  Context_List_Variables(Machine(Systeme))==(?);
  Abstract_List_Variables(Machine(Systeme))==(?);
  Local_List_Variables(Machine(Systeme))==(profilsAutorises,profilDe,souscrit,actif,exclusif,contraint,nomDe,noms,processus,services);
  List_Variables(Machine(Systeme))==(profilsAutorises,profilDe,souscrit,actif,exclusif,contraint,nomDe,noms,processus,services);
  External_List_Variables(Machine(Systeme))==(profilsAutorises,profilDe,souscrit,actif,exclusif,contraint,nomDe,noms,processus,services)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Systeme))==(?);
  Abstract_List_VisibleVariables(Machine(Systeme))==(?);
  External_List_VisibleVariables(Machine(Systeme))==(?);
  Expanded_List_VisibleVariables(Machine(Systeme))==(?);
  List_VisibleVariables(Machine(Systeme))==(?);
  Internal_List_VisibleVariables(Machine(Systeme))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Systeme))==(btrue);
  Gluing_List_Invariant(Machine(Systeme))==(btrue);
  Expanded_List_Invariant(Machine(Systeme))==(btrue);
  Abstract_List_Invariant(Machine(Systeme))==(btrue);
  Context_List_Invariant(Machine(Systeme))==(btrue);
  List_Invariant(Machine(Systeme))==(services <: SERVICES & processus <: PROCESSUS & noms <: NOMS & contraint: services --> BOOL & exclusif: services --> BOOL & actif: services --> BOOL & souscrit: processus <-> services & profilDe: processus --> PROFILS & profilsAutorises: services <-> PROFILS & nomDe: services >->> noms & (profilsAutorises/={} & contraint~[{FALSE}]/={} => profilsAutorises[contraint~[{FALSE}]] <: PROFILS) & (card(profilsAutorises)>=1 => card(profilsAutorises[contraint~[{TRUE}]])>=1))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Systeme))==(btrue);
  Abstract_List_Assertions(Machine(Systeme))==(btrue);
  Context_List_Assertions(Machine(Systeme))==(btrue);
  List_Assertions(Machine(Systeme))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Systeme))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Systeme))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Systeme))==(actif,nomDe,contraint,exclusif,souscrit,services,profilDe,profilsAutorises,noms,processus:={},{},{},{},{},{},{},{},{},{});
  Context_List_Initialisation(Machine(Systeme))==(skip);
  List_Initialisation(Machine(Systeme))==(actif:={} || nomDe:={} || contraint:={} || exclusif:={} || souscrit:={} || services:={} || profilDe:={} || profilsAutorises:={} || noms:={} || processus:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Systeme))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Systeme))==(btrue);
  List_Constraints(Machine(Systeme))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Systeme))==(ajouterService,souscrire,suspendre,activerService,interrompreService,ajouterProcessus,supprimerProcessus,modifierProfil,estActif,mettreExclusifService,mettreNonExclusifService,mettreContraint,mettreNonContraint,supprimerProfilAutorise);
  List_Operations(Machine(Systeme))==(ajouterService,souscrire,suspendre,activerService,interrompreService,ajouterProcessus,supprimerProcessus,modifierProfil,estActif,mettreExclusifService,mettreNonExclusifService,mettreContraint,mettreNonContraint,supprimerProfilAutorise)
END
&
THEORY ListInputX IS
  List_Input(Machine(Systeme),ajouterService)==(nom,cc,ee);
  List_Input(Machine(Systeme),souscrire)==(pp,ss);
  List_Input(Machine(Systeme),suspendre)==(pp,ss);
  List_Input(Machine(Systeme),activerService)==(ns);
  List_Input(Machine(Systeme),interrompreService)==(ns);
  List_Input(Machine(Systeme),ajouterProcessus)==(profil);
  List_Input(Machine(Systeme),supprimerProcessus)==(pp);
  List_Input(Machine(Systeme),modifierProfil)==(pp,np);
  List_Input(Machine(Systeme),estActif)==(ss);
  List_Input(Machine(Systeme),mettreExclusifService)==(ns);
  List_Input(Machine(Systeme),mettreNonExclusifService)==(ns);
  List_Input(Machine(Systeme),mettreContraint)==(ns);
  List_Input(Machine(Systeme),mettreNonContraint)==(ns);
  List_Input(Machine(Systeme),supprimerProfilAutorise)==(ns,ps)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Systeme),ajouterService)==(res);
  List_Output(Machine(Systeme),souscrire)==(?);
  List_Output(Machine(Systeme),suspendre)==(?);
  List_Output(Machine(Systeme),activerService)==(?);
  List_Output(Machine(Systeme),interrompreService)==(?);
  List_Output(Machine(Systeme),ajouterProcessus)==(res);
  List_Output(Machine(Systeme),supprimerProcessus)==(?);
  List_Output(Machine(Systeme),modifierProfil)==(?);
  List_Output(Machine(Systeme),estActif)==(res);
  List_Output(Machine(Systeme),mettreExclusifService)==(?);
  List_Output(Machine(Systeme),mettreNonExclusifService)==(?);
  List_Output(Machine(Systeme),mettreContraint)==(?);
  List_Output(Machine(Systeme),mettreNonContraint)==(?);
  List_Output(Machine(Systeme),supprimerProfilAutorise)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Systeme),ajouterService)==(res <-- ajouterService(nom,cc,ee));
  List_Header(Machine(Systeme),souscrire)==(souscrire(pp,ss));
  List_Header(Machine(Systeme),suspendre)==(suspendre(pp,ss));
  List_Header(Machine(Systeme),activerService)==(activerService(ns));
  List_Header(Machine(Systeme),interrompreService)==(interrompreService(ns));
  List_Header(Machine(Systeme),ajouterProcessus)==(res <-- ajouterProcessus(profil));
  List_Header(Machine(Systeme),supprimerProcessus)==(supprimerProcessus(pp));
  List_Header(Machine(Systeme),modifierProfil)==(modifierProfil(pp,np));
  List_Header(Machine(Systeme),estActif)==(res <-- estActif(ss));
  List_Header(Machine(Systeme),mettreExclusifService)==(mettreExclusifService(ns));
  List_Header(Machine(Systeme),mettreNonExclusifService)==(mettreNonExclusifService(ns));
  List_Header(Machine(Systeme),mettreContraint)==(mettreContraint(ns));
  List_Header(Machine(Systeme),mettreNonContraint)==(mettreNonContraint(ns));
  List_Header(Machine(Systeme),supprimerProfilAutorise)==(supprimerProfilAutorise(ns,ps))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Systeme),ajouterService)==(nom: NOMS & nom/:ran(nomDe) & cc: BOOL & ee: BOOL);
  List_Precondition(Machine(Systeme),souscrire)==(pp: processus & ss: services & pp|->ss/:souscrit & actif[{ss}] = {TRUE});
  List_Precondition(Machine(Systeme),suspendre)==(pp: processus & ss: services & pp|->ss: souscrit);
  List_Precondition(Machine(Systeme),activerService)==(ns: noms & ns: ran(nomDe) & actif[nomDe~[{ns}]] = {FALSE});
  List_Precondition(Machine(Systeme),interrompreService)==(ns: noms & ns: ran(nomDe) & actif[nomDe~[{ns}]] = {TRUE});
  List_Precondition(Machine(Systeme),ajouterProcessus)==(profil: PROFILS);
  List_Precondition(Machine(Systeme),supprimerProcessus)==(pp: processus & pp: dom(profilDe) & pp: dom(souscrit));
  List_Precondition(Machine(Systeme),modifierProfil)==(pp: processus & np: PROFILS);
  List_Precondition(Machine(Systeme),estActif)==(ss: services & actif(ss) = TRUE);
  List_Precondition(Machine(Systeme),mettreExclusifService)==(ns: noms & ns: ran(nomDe));
  List_Precondition(Machine(Systeme),mettreNonExclusifService)==(ns: noms & ns: ran(nomDe));
  List_Precondition(Machine(Systeme),mettreContraint)==(ns: noms & ns: ran(nomDe));
  List_Precondition(Machine(Systeme),mettreNonContraint)==(ns: noms & ns: ran(nomDe));
  List_Precondition(Machine(Systeme),supprimerProfilAutorise)==(ns: noms & ns: ran(nomDe) & contraint(nomDe~(ns)) = TRUE & ps: PROFILS & ps: profilsAutorises[{nomDe~(ns)}] & card(profilsAutorises[{nomDe~(ns)}])>1)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Systeme),supprimerProfilAutorise)==(ns: noms & ns: ran(nomDe) & contraint(nomDe~(ns)) = TRUE & ps: PROFILS & ps: profilsAutorises[{nomDe~(ns)}] & card(profilsAutorises[{nomDe~(ns)}])>1 | @ss.(ss: services & ss = nomDe~(ns) ==> profilsAutorises:=profilsAutorises-{ss|->ps}));
  Expanded_List_Substitution(Machine(Systeme),mettreNonContraint)==(ns: noms & ns: ran(nomDe) | @ss.(ss: services & ss = nomDe~(ns) ==> profilsAutorises,contraint:=profilsAutorises\/{ss}*PROFILS,contraint<+{ss|->FALSE}));
  Expanded_List_Substitution(Machine(Systeme),mettreContraint)==(ns: noms & ns: ran(nomDe) | @ss.(ss: services & ss = nomDe~(ns) ==> contraint:=contraint<+{ss|->TRUE}));
  Expanded_List_Substitution(Machine(Systeme),mettreNonExclusifService)==(ns: noms & ns: ran(nomDe) | exclusif:=exclusif<+{nomDe~(ns)|->FALSE});
  Expanded_List_Substitution(Machine(Systeme),mettreExclusifService)==(ns: noms & ns: ran(nomDe) | exclusif:=exclusif<+{nomDe~(ns)|->TRUE});
  Expanded_List_Substitution(Machine(Systeme),estActif)==(ss: services & actif(ss) = TRUE | res:=actif(ss));
  Expanded_List_Substitution(Machine(Systeme),modifierProfil)==(pp: processus & np: PROFILS | profilDe:=profilDe<+{pp|->np});
  Expanded_List_Substitution(Machine(Systeme),supprimerProcessus)==(pp: processus & pp: dom(profilDe) & pp: dom(souscrit) | processus,profilDe,souscrit:=processus-{pp},{pp}<<|profilDe,{pp}<<|souscrit);
  Expanded_List_Substitution(Machine(Systeme),ajouterProcessus)==(profil: PROFILS | @pp.(pp: PROCESSUS & pp/:processus ==> profilDe,processus,res:=profilDe<+{pp|->profil},processus\/{pp},pp));
  Expanded_List_Substitution(Machine(Systeme),interrompreService)==(ns: noms & ns: ran(nomDe) & actif[nomDe~[{ns}]] = {TRUE} | @ss.(ss: services & ss = nomDe~(ns) ==> actif:=actif<+{ss|->FALSE}));
  Expanded_List_Substitution(Machine(Systeme),activerService)==(ns: noms & ns: ran(nomDe) & actif[nomDe~[{ns}]] = {FALSE} | @ss.(ss: services & ss = nomDe~(ns) ==> actif:=actif<+{ss|->TRUE}));
  Expanded_List_Substitution(Machine(Systeme),suspendre)==(pp: processus & ss: services & pp|->ss: souscrit | souscrit:=souscrit-{pp|->ss});
  Expanded_List_Substitution(Machine(Systeme),souscrire)==(pp: processus & ss: services & pp|->ss/:souscrit & actif[{ss}] = {TRUE} | souscrit:=souscrit\/{pp|->ss});
  Expanded_List_Substitution(Machine(Systeme),ajouterService)==(nom: NOMS & nom/:ran(nomDe) & cc: BOOL & ee: BOOL | @ss.(ss: SERVICES & ss/:services & ss/:dom(profilsAutorises) & ss/:ran(souscrit) & ss/:dom(nomDe) & ss/:dom(contraint) & ss/:dom(exclusif) & ss/:dom(actif) ==> noms,nomDe,contraint,profilsAutorises,exclusif,actif,services,res:=noms\/{nom},nomDe<+{ss|->nom},contraint<+{ss|->cc},profilsAutorises\/{ss}*PROFILS,exclusif<+{ss|->ee},actif<+{ss|->FALSE},services\/{ss},ss));
  List_Substitution(Machine(Systeme),ajouterService)==(ANY ss WHERE ss: SERVICES & ss/:services & ss/:dom(profilsAutorises) & ss/:ran(souscrit) & ss/:dom(nomDe) & ss/:dom(contraint) & ss/:dom(exclusif) & ss/:dom(actif) THEN noms:=noms\/{nom} || nomDe(ss):=nom || contraint(ss):=cc || profilsAutorises:=profilsAutorises\/{ss}*PROFILS || exclusif(ss):=ee || actif(ss):=FALSE || services:=services\/{ss} || res:=ss END);
  List_Substitution(Machine(Systeme),souscrire)==(souscrit:=souscrit\/{pp|->ss});
  List_Substitution(Machine(Systeme),suspendre)==(souscrit:=souscrit-{pp|->ss});
  List_Substitution(Machine(Systeme),activerService)==(ANY ss WHERE ss: services & ss = nomDe~(ns) THEN actif(ss):=TRUE END);
  List_Substitution(Machine(Systeme),interrompreService)==(ANY ss WHERE ss: services & ss = nomDe~(ns) THEN actif(ss):=FALSE END);
  List_Substitution(Machine(Systeme),ajouterProcessus)==(ANY pp WHERE pp: PROCESSUS & pp/:processus THEN profilDe(pp):=profil || processus:=processus\/{pp} || res:=pp END);
  List_Substitution(Machine(Systeme),supprimerProcessus)==(processus:=processus-{pp} || profilDe:={pp}<<|profilDe || souscrit:={pp}<<|souscrit);
  List_Substitution(Machine(Systeme),modifierProfil)==(profilDe(pp):=np);
  List_Substitution(Machine(Systeme),estActif)==(res:=actif(ss));
  List_Substitution(Machine(Systeme),mettreExclusifService)==(exclusif(nomDe~(ns)):=TRUE);
  List_Substitution(Machine(Systeme),mettreNonExclusifService)==(exclusif(nomDe~(ns)):=FALSE);
  List_Substitution(Machine(Systeme),mettreContraint)==(ANY ss WHERE ss: services & ss = nomDe~(ns) THEN contraint(ss):=TRUE END);
  List_Substitution(Machine(Systeme),mettreNonContraint)==(ANY ss WHERE ss: services & ss = nomDe~(ns) THEN profilsAutorises:=profilsAutorises\/{ss}*PROFILS || contraint(ss):=FALSE END);
  List_Substitution(Machine(Systeme),supprimerProfilAutorise)==(ANY ss WHERE ss: services & ss = nomDe~(ns) THEN profilsAutorises:=profilsAutorises-{ss|->ps} END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Systeme))==(?);
  Inherited_List_Constants(Machine(Systeme))==(?);
  List_Constants(Machine(Systeme))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Systeme),PROFILS)==(?);
  Context_List_Enumerated(Machine(Systeme))==(?);
  Context_List_Defered(Machine(Systeme))==(?);
  Context_List_Sets(Machine(Systeme))==(?);
  List_Valuable_Sets(Machine(Systeme))==(PROFILS,SERVICES,PROCESSUS,NOMS);
  Inherited_List_Enumerated(Machine(Systeme))==(?);
  Inherited_List_Defered(Machine(Systeme))==(?);
  Inherited_List_Sets(Machine(Systeme))==(?);
  List_Enumerated(Machine(Systeme))==(?);
  List_Defered(Machine(Systeme))==(PROFILS,SERVICES,PROCESSUS,NOMS);
  List_Sets(Machine(Systeme))==(PROFILS,SERVICES,PROCESSUS,NOMS);
  Set_Definition(Machine(Systeme),SERVICES)==(?);
  Set_Definition(Machine(Systeme),PROCESSUS)==(?);
  Set_Definition(Machine(Systeme),NOMS)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Systeme))==(?);
  Expanded_List_HiddenConstants(Machine(Systeme))==(?);
  List_HiddenConstants(Machine(Systeme))==(?);
  External_List_HiddenConstants(Machine(Systeme))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Systeme))==(btrue);
  Context_List_Properties(Machine(Systeme))==(btrue);
  Inherited_List_Properties(Machine(Systeme))==(btrue);
  List_Properties(Machine(Systeme))==(PROFILS: FIN(INTEGER) & not(PROFILS = {}) & SERVICES: FIN(INTEGER) & not(SERVICES = {}) & PROCESSUS: FIN(INTEGER) & not(PROCESSUS = {}) & NOMS: FIN(INTEGER) & not(NOMS = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Systeme),ajouterService)==(Var(ss) == atype(SERVICES,?,?));
  List_ANY_Var(Machine(Systeme),souscrire)==(?);
  List_ANY_Var(Machine(Systeme),suspendre)==(?);
  List_ANY_Var(Machine(Systeme),activerService)==(Var(ss) == atype(SERVICES,?,?));
  List_ANY_Var(Machine(Systeme),interrompreService)==(Var(ss) == atype(SERVICES,?,?));
  List_ANY_Var(Machine(Systeme),ajouterProcessus)==(Var(pp) == atype(PROCESSUS,?,?));
  List_ANY_Var(Machine(Systeme),supprimerProcessus)==(?);
  List_ANY_Var(Machine(Systeme),modifierProfil)==(?);
  List_ANY_Var(Machine(Systeme),estActif)==(?);
  List_ANY_Var(Machine(Systeme),mettreExclusifService)==(?);
  List_ANY_Var(Machine(Systeme),mettreNonExclusifService)==(?);
  List_ANY_Var(Machine(Systeme),mettreContraint)==(Var(ss) == atype(SERVICES,?,?));
  List_ANY_Var(Machine(Systeme),mettreNonContraint)==(Var(ss) == atype(SERVICES,?,?));
  List_ANY_Var(Machine(Systeme),supprimerProfilAutorise)==(Var(ss) == atype(SERVICES,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Systeme)) == (PROFILS,SERVICES,PROCESSUS,NOMS | ? | profilsAutorises,profilDe,souscrit,actif,exclusif,contraint,nomDe,noms,processus,services | ? | ajouterService,souscrire,suspendre,activerService,interrompreService,ajouterProcessus,supprimerProcessus,modifierProfil,estActif,mettreExclusifService,mettreNonExclusifService,mettreContraint,mettreNonContraint,supprimerProfilAutorise | ? | ? | ? | Systeme);
  List_Of_HiddenCst_Ids(Machine(Systeme)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Systeme)) == (?);
  List_Of_VisibleVar_Ids(Machine(Systeme)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Systeme)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Systeme)) == (Type(PROFILS) == Cst(SetOf(atype(PROFILS,"[PROFILS","]PROFILS")));Type(SERVICES) == Cst(SetOf(atype(SERVICES,"[SERVICES","]SERVICES")));Type(PROCESSUS) == Cst(SetOf(atype(PROCESSUS,"[PROCESSUS","]PROCESSUS")));Type(NOMS) == Cst(SetOf(atype(NOMS,"[NOMS","]NOMS"))))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Systeme)) == (Type(profilsAutorises) == Mvl(SetOf(atype(SERVICES,?,?)*atype(PROFILS,?,?)));Type(profilDe) == Mvl(SetOf(atype(PROCESSUS,?,?)*atype(PROFILS,"[PROFILS","]PROFILS")));Type(souscrit) == Mvl(SetOf(atype(PROCESSUS,?,?)*atype(SERVICES,?,?)));Type(actif) == Mvl(SetOf(atype(SERVICES,?,?)*btype(BOOL,0,1)));Type(exclusif) == Mvl(SetOf(atype(SERVICES,?,?)*btype(BOOL,0,1)));Type(contraint) == Mvl(SetOf(atype(SERVICES,?,?)*btype(BOOL,0,1)));Type(nomDe) == Mvl(SetOf(atype(SERVICES,?,?)*atype(NOMS,?,?)));Type(noms) == Mvl(SetOf(atype(NOMS,?,?)));Type(processus) == Mvl(SetOf(atype(PROCESSUS,?,?)));Type(services) == Mvl(SetOf(atype(SERVICES,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Systeme)) == (Type(supprimerProfilAutorise) == Cst(No_type,atype(NOMS,?,?)*atype(PROFILS,?,?));Type(mettreNonContraint) == Cst(No_type,atype(NOMS,?,?));Type(mettreContraint) == Cst(No_type,atype(NOMS,?,?));Type(mettreNonExclusifService) == Cst(No_type,atype(NOMS,?,?));Type(mettreExclusifService) == Cst(No_type,atype(NOMS,?,?));Type(estActif) == Cst(btype(BOOL,?,?),atype(SERVICES,?,?));Type(modifierProfil) == Cst(No_type,atype(PROCESSUS,?,?)*atype(PROFILS,?,?));Type(supprimerProcessus) == Cst(No_type,atype(PROCESSUS,?,?));Type(ajouterProcessus) == Cst(atype(PROCESSUS,?,?),atype(PROFILS,?,?));Type(interrompreService) == Cst(No_type,atype(NOMS,?,?));Type(activerService) == Cst(No_type,atype(NOMS,?,?));Type(suspendre) == Cst(No_type,atype(PROCESSUS,?,?)*atype(SERVICES,?,?));Type(souscrire) == Cst(No_type,atype(PROCESSUS,?,?)*atype(SERVICES,?,?));Type(ajouterService) == Cst(atype(SERVICES,?,?),atype(NOMS,?,?)*btype(BOOL,?,?)*btype(BOOL,?,?)));
  Observers(Machine(Systeme)) == (Type(estActif) == Cst(btype(BOOL,?,?),atype(SERVICES,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == KO;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == VALIDATION_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
