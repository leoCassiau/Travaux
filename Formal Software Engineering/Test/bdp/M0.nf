Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(M0))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(M0))==(Machine(M0));
  Level(Machine(M0))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(M0)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(M0))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(M0))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(M0))==(?);
  List_Includes(Machine(M0))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(M0))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(M0))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(M0))==(?);
  Context_List_Variables(Machine(M0))==(?);
  Abstract_List_Variables(Machine(M0))==(?);
  Local_List_Variables(Machine(M0))==(Test4,Test2,Test5,Test3,Test1);
  List_Variables(Machine(M0))==(Test4,Test2,Test5,Test3,Test1);
  External_List_Variables(Machine(M0))==(Test4,Test2,Test5,Test3,Test1)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(M0))==(?);
  Abstract_List_VisibleVariables(Machine(M0))==(?);
  External_List_VisibleVariables(Machine(M0))==(?);
  Expanded_List_VisibleVariables(Machine(M0))==(?);
  List_VisibleVariables(Machine(M0))==(?);
  Internal_List_VisibleVariables(Machine(M0))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(M0))==(btrue);
  Gluing_List_Invariant(Machine(M0))==(btrue);
  Expanded_List_Invariant(Machine(M0))==(btrue);
  Abstract_List_Invariant(Machine(M0))==(btrue);
  Context_List_Invariant(Machine(M0))==(btrue);
  List_Invariant(Machine(M0))==(Test1: INT & Test1: 0..10 & Test2: NAT & Test2: 0..20 & Test3: BOOL & Test4: INT & Test4: -1..20 & Test5: NAT & Test5: 20..40 & Test3: BOOL)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(M0))==(btrue);
  Abstract_List_Assertions(Machine(M0))==(btrue);
  Context_List_Assertions(Machine(M0))==(btrue);
  List_Assertions(Machine(M0))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(M0))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(M0))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(M0))==(Test1,Test2,Test3,Test4,Test5:=0,0,FALSE,0,22);
  Context_List_Initialisation(Machine(M0))==(skip);
  List_Initialisation(Machine(M0))==(Test1:=0 || Test2:=0 || Test3:=FALSE || Test4:=0 || Test5:=22)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(M0))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(M0))==(btrue);
  List_Constraints(Machine(M0))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(M0))==(sense_Test1,sense_Test3,sense_Test5,reaction_Test2,reaction_Test4);
  List_Operations(Machine(M0))==(sense_Test1,sense_Test3,sense_Test5,reaction_Test2,reaction_Test4)
END
&
THEORY ListInputX IS
  List_Input(Machine(M0),sense_Test1)==(?);
  List_Input(Machine(M0),sense_Test3)==(?);
  List_Input(Machine(M0),sense_Test5)==(?);
  List_Input(Machine(M0),reaction_Test2)==(?);
  List_Input(Machine(M0),reaction_Test4)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(M0),sense_Test1)==(?);
  List_Output(Machine(M0),sense_Test3)==(?);
  List_Output(Machine(M0),sense_Test5)==(?);
  List_Output(Machine(M0),reaction_Test2)==(?);
  List_Output(Machine(M0),reaction_Test4)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(M0),sense_Test1)==(sense_Test1);
  List_Header(Machine(M0),sense_Test3)==(sense_Test3);
  List_Header(Machine(M0),sense_Test5)==(sense_Test5);
  List_Header(Machine(M0),reaction_Test2)==(reaction_Test2);
  List_Header(Machine(M0),reaction_Test4)==(reaction_Test4)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(M0),sense_Test1)==(btrue);
  List_Precondition(Machine(M0),sense_Test3)==(btrue);
  List_Precondition(Machine(M0),sense_Test5)==(btrue);
  List_Precondition(Machine(M0),reaction_Test2)==(btrue);
  List_Precondition(Machine(M0),reaction_Test4)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(M0),reaction_Test4)==(btrue | Test4: -1..20 ==> skip);
  Expanded_List_Substitution(Machine(M0),reaction_Test2)==(btrue | Test2: 0..20 ==> skip);
  Expanded_List_Substitution(Machine(M0),sense_Test5)==(btrue | Test5: 20..40 ==> skip);
  Expanded_List_Substitution(Machine(M0),sense_Test3)==(btrue | Test3: BOOL ==> skip);
  Expanded_List_Substitution(Machine(M0),sense_Test1)==(btrue | Test1: 0..10 ==> skip);
  List_Substitution(Machine(M0),sense_Test1)==(SELECT Test1: 0..10 THEN skip END);
  List_Substitution(Machine(M0),sense_Test3)==(SELECT Test3: BOOL THEN skip END);
  List_Substitution(Machine(M0),sense_Test5)==(SELECT Test5: 20..40 THEN skip END);
  List_Substitution(Machine(M0),reaction_Test2)==(SELECT Test2: 0..20 THEN skip END);
  List_Substitution(Machine(M0),reaction_Test4)==(SELECT Test4: -1..20 THEN skip END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(M0))==(?);
  Inherited_List_Constants(Machine(M0))==(?);
  List_Constants(Machine(M0))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(M0))==(?);
  Context_List_Defered(Machine(M0))==(?);
  Context_List_Sets(Machine(M0))==(?);
  List_Valuable_Sets(Machine(M0))==(?);
  Inherited_List_Enumerated(Machine(M0))==(?);
  Inherited_List_Defered(Machine(M0))==(?);
  Inherited_List_Sets(Machine(M0))==(?);
  List_Enumerated(Machine(M0))==(?);
  List_Defered(Machine(M0))==(?);
  List_Sets(Machine(M0))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(M0))==(?);
  Expanded_List_HiddenConstants(Machine(M0))==(?);
  List_HiddenConstants(Machine(M0))==(?);
  External_List_HiddenConstants(Machine(M0))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(M0))==(btrue);
  Context_List_Properties(Machine(M0))==(btrue);
  Inherited_List_Properties(Machine(M0))==(btrue);
  List_Properties(Machine(M0))==(btrue)
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(M0),sense_Test1)==(?);
  List_ANY_Var(Machine(M0),sense_Test3)==(?);
  List_ANY_Var(Machine(M0),sense_Test5)==(?);
  List_ANY_Var(Machine(M0),reaction_Test2)==(?);
  List_ANY_Var(Machine(M0),reaction_Test4)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(M0)) == (? | ? | Test4,Test2,Test5,Test3,Test1 | ? | sense_Test1,sense_Test3,sense_Test5,reaction_Test2,reaction_Test4 | ? | ? | ? | M0);
  List_Of_HiddenCst_Ids(Machine(M0)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(M0)) == (?);
  List_Of_VisibleVar_Ids(Machine(M0)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(M0)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(M0)) == (Type(Test4) == Mvl(btype(INTEGER,?,?));Type(Test2) == Mvl(btype(INTEGER,?,?));Type(Test5) == Mvl(btype(INTEGER,?,?));Type(Test3) == Mvl(btype(BOOL,?,?));Type(Test1) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(M0)) == (Type(reaction_Test4) == Cst(No_type,No_type);Type(reaction_Test2) == Cst(No_type,No_type);Type(sense_Test5) == Cst(No_type,No_type);Type(sense_Test3) == Cst(No_type,No_type);Type(sense_Test1) == Cst(No_type,No_type));
  Observers(Machine(M0)) == (Type(reaction_Test4) == Cst(No_type,No_type);Type(reaction_Test2) == Cst(No_type,No_type);Type(sense_Test5) == Cst(No_type,No_type);Type(sense_Test3) == Cst(No_type,No_type);Type(sense_Test1) == Cst(No_type,No_type))
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
