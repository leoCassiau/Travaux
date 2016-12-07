MACHINE
    M0

ABSTRACT_VARIABLES
    // input variables
    Test1 ,
    Test3 ,
    Test5 ,

    // output variables
    Test2 ,
    Test4





INVARIANT
      Test1 : INT
    & Test1 : 0 .. 10
    & Test2 : NAT
    & Test2 : 0 .. 20
    & Test3 : BOOL
    & Test4 : INT
    & Test4 : - 1 .. 20
    & Test5 : NAT
    & Test5 : 20 .. 40
    & Test3 : BOOL

INITIALISATION
       Test1 := 0
    || Test2 := 0
    || Test3 := FALSE
    || Test4 := 0
    || Test5 := 22

OPERATIONS

    // Sense events 
    sense_Test1 =
        SELECT
            Test1 : 0 .. 10
        THEN
            //TODO
            skip
        END ;

    sense_Test3 =
        SELECT
            Test3 : BOOL
        THEN
            //TODO
            skip
        END ;

    sense_Test5 =
        SELECT
            Test5 : 20 .. 40
        THEN
            //TODO
            skip
        END ;

    // Reaction events  
    reaction_Test2 =
        SELECT
            Test2 : 0 .. 20
        THEN
            //TODO
            skip
        END ;

    reaction_Test4 =
        SELECT
            Test4 : - 1 .. 20
        THEN
            //TODO
            skip
        END

END
