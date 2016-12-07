Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Calc))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Calc))==(Machine(Calc));
  Level(Machine(Calc))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Calc)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Calc))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Calc))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Calc))==(?);
  List_Includes(Machine(Calc))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Calc))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Calc))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Calc))==(?);
  Context_List_Variables(Machine(Calc))==(?);
  Abstract_List_Variables(Machine(Calc))==(?);
  Local_List_Variables(Machine(Calc))==(RS,RP);
  List_Variables(Machine(Calc))==(RS,RP);
  External_List_Variables(Machine(Calc))==(RS,RP)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Calc))==(?);
  Abstract_List_VisibleVariables(Machine(Calc))==(?);
  External_List_VisibleVariables(Machine(Calc))==(?);
  Expanded_List_VisibleVariables(Machine(Calc))==(?);
  List_VisibleVariables(Machine(Calc))==(?);
  Internal_List_VisibleVariables(Machine(Calc))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Calc))==(btrue);
  Gluing_List_Invariant(Machine(Calc))==(btrue);
  Expanded_List_Invariant(Machine(Calc))==(btrue);
  Abstract_List_Invariant(Machine(Calc))==(btrue);
  Context_List_Invariant(Machine(Calc))==(btrue);
  List_Invariant(Machine(Calc))==(RP: NAT & 0<=RP & RP<=255 & RS: NAT & 0<=RS & RS<=255)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Calc))==(btrue);
  Abstract_List_Assertions(Machine(Calc))==(btrue);
  Context_List_Assertions(Machine(Calc))==(btrue);
  List_Assertions(Machine(Calc))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Calc))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Calc))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Calc))==(RP,RS:=0,0);
  Context_List_Initialisation(Machine(Calc))==(skip);
  List_Initialisation(Machine(Calc))==(RP:=0 || RS:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Calc))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Calc))==(btrue);
  List_Constraints(Machine(Calc))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Calc))==(setRP,add);
  List_Operations(Machine(Calc))==(setRP,add)
END
&
THEORY ListInputX IS
  List_Input(Machine(Calc),setRP)==(nx);
  List_Input(Machine(Calc),add)==(vc)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Calc),setRP)==(?);
  List_Output(Machine(Calc),add)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Calc),setRP)==(setRP(nx));
  List_Header(Machine(Calc),add)==(add(vc))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Calc),setRP)==(nx: NAT & nx<=255 & 0<=nx);
  List_Precondition(Machine(Calc),add)==(vc: NAT & 0<=vc & vc<=255 & RP+vc<=255 & 0<=RP+vc)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Calc),add)==(vc: NAT & 0<=vc & vc<=255 & RP+vc<=255 & 0<=RP+vc | RP:=RP+vc);
  Expanded_List_Substitution(Machine(Calc),setRP)==(nx: NAT & nx<=255 & 0<=nx | RP:=nx);
  List_Substitution(Machine(Calc),setRP)==(RP:=nx);
  List_Substitution(Machine(Calc),add)==(RP:=RP+vc)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Calc))==(?);
  Inherited_List_Constants(Machine(Calc))==(?);
  List_Constants(Machine(Calc))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Calc))==(?);
  Context_List_Defered(Machine(Calc))==(?);
  Context_List_Sets(Machine(Calc))==(?);
  List_Valuable_Sets(Machine(Calc))==(?);
  Inherited_List_Enumerated(Machine(Calc))==(?);
  Inherited_List_Defered(Machine(Calc))==(?);
  Inherited_List_Sets(Machine(Calc))==(?);
  List_Enumerated(Machine(Calc))==(?);
  List_Defered(Machine(Calc))==(?);
  List_Sets(Machine(Calc))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Calc))==(?);
  Expanded_List_HiddenConstants(Machine(Calc))==(?);
  List_HiddenConstants(Machine(Calc))==(?);
  External_List_HiddenConstants(Machine(Calc))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Calc))==(btrue);
  Context_List_Properties(Machine(Calc))==(btrue);
  Inherited_List_Properties(Machine(Calc))==(btrue);
  List_Properties(Machine(Calc))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Calc),setRP)==(?);
  List_ANY_Var(Machine(Calc),add)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Calc)) == (? | ? | RS,RP | ? | setRP,add | ? | ? | ? | Calc);
  List_Of_HiddenCst_Ids(Machine(Calc)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Calc)) == (?);
  List_Of_VisibleVar_Ids(Machine(Calc)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Calc)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Calc)) == (Type(RS) == Mvl(btype(INTEGER,?,?));Type(RP) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Calc)) == (Type(add) == Cst(No_type,btype(INTEGER,?,?));Type(setRP) == Cst(No_type,btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
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
