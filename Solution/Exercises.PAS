Program NoOneTakesMyPlace;
   Const
      NT=7;
   Type
      ListPTR=^List;
      List=Record
             S:String;
             Suivant:ListPTR;
           End;
      TAB=array [1..NT] of String;
   Var
     L,P,A,PTR,L1,P1,PTR1,A1:ListPTR;
     T:TAB;
     Save:String;
     I,N,X:Integer;
   Begin
     Randomize;
     Writeln('--------------------------------------------');
     {--------------- Default Cre‚ le TAB et la Liste -----}
     L:=Nil;
     P:=Nil;
     PTR:=Nil;
     New(L);
     PTR:=L;
     P:=L;
     For i:=1 to NT do T[I]:='';
     For i:=1 to NT do T[I]:=chr(random(26)+65);
     For i:=1 to NT do
     Begin
       L^.S:='';
       New(L^.Suivant);
       L:=L^.Suivant;
     End;
     L^.Suivant:=Nil;
     L:=P;
     {-------------- EXO 01 -------------------------------}
     For i:=1 to NT do
     Begin
       L^.S:=T[I];
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- Affichage-----------------------------}
     Writeln('Le TAB');
     For i:=1 to NT do Write(T[I], '  ');
     Writeln;
     Writeln('La Liste');
     For i:=1 to NT Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 02 -------------------------------}
     While ( L^.suivant <> Nil ) do
     Begin
       P:=L^.suivant;
       While ( P <> Nil ) do
       Begin
         if (P^.S < L^.S) then
         Begin
           Save:=P^.S;
           P^.S:=L^.S;
           L^.S:=Save;
         End;
         P:=P^.Suivant;
       End;
       L:=L^.Suivant;
     End;
     L:=PTR;
     P:=PTR;
     {-------------- Affichage-----------------------------}
     Writeln;
     Writeln('Le TAB');
     For i:=1 to NT do Write(T[I], '  ');
     Writeln;
     Writeln('La Liste');
     For i:=1 to NT Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 03 -------------------------------}
     For i:=1 to NT do
     Begin
       T[I]:=L^.S;
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- Affichage-----------------------------}
     Writeln;
     Writeln('Le TAB');
     For i:=1 to NT do Write(T[I], '  ');
     Writeln;
     {-------------- EXO 04 -------------------------------}
     New(PTR);
     PTR^.S:='First';
     PTR^.Suivant:=L;
     L:=PTR;
     P:=PTR;
     N:=NT+1;
     {-------------- Affichage-----------------------------}
     Writeln('La Liste');
     For i:=1 to N Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 05 -------------------------------}
     New(PTR);
     PTR^.S:='Last';
     PTR^.Suivant:=Nil;
     For i:=1 to N-1 do L:=L^.Suivant;
     New(L^.Suivant);
     L^.Suivant:=PTR;
     L:=P;
     PTR:=P;
     N:=N+1;
     {-------------- Affichage-----------------------------}
     Writeln;
     Writeln('La Liste');
     For i:=1 to N Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 06 -------------------------------}
     Writeln;
     A:=Nil;
     Writeln('Tapez ici Quel rang vous voulez inser votre mot');
     Readln(X);
     While ( X > N ) do
     Begin
       Writeln('Tapez un nemuro de rang qui existe');
       Readln(X);
     End;
     If ( X=1) then
     Begin
       New(PTR);
       PTR^.S:='Insert';
       PTR^.Suivant:=L;
       L:=PTR;
       P:=PTR;
       N:=N+1;
     End
     Else if ( X=N) then
     Begin
       New(PTR);
       PTR^.S:='Insert';
       PTR^.Suivant:=Nil;
       For i:=1 to N-1 do L:=L^.Suivant;
       New(L^.Suivant);
       L^.Suivant:=PTR;
       L:=P;
       PTR:=P;
       N:=N+1;
     End
     Else if ( X < N) and ( X > 1 ) then
     Begin
       A:=Nil;
       New(PTR);
       PTR^.S:='Insert';
       New(PTR^.Suivant);
       For i:=1 to X-2 do L:=L^.Suivant;
       A:=L;
       L:=L^.Suivant;
       A^.Suivant:=PTR;
       PTR^.Suivant:=L;
       N:=N+1;
       PTR:=P;
       L:=P;
       A:=Nil;
       A^.Suivant:=Nil;
     End;
     {-------------- Affichage-----------------------------}
     Writeln('La Liste');
     For i:=1 to N Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 07 -------------------------------}
     A:=L^.Suivant;
     Dispose(L);
     L:=A;
     P:=L;
     PTR:=L;
     N:=N-1;
     {-------------- Affichage-----------------------------}
     Writeln;
     Writeln('La Liste');
     For i:=1 to N Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 08 -------------------------------}
     PTR:=L;
     For i:=1 to N do
     Begin
       If (L^.Suivant^.Suivant=Nil ) then P:=L;
       L:=L^.Suivant;
     End;
     L:=P^.Suivant;
     L:=Nil;
     L:=PTR;
     P:=L;
     N:=N-1;
     {-------------- Affichage-----------------------------}
     Writeln;
     Writeln('La Liste');
     For i:=1 to N Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {-------------- EXO 09 -------------------------------}
     PTR:=P;
     Writeln;
     A:=Nil;
     Writeln('Tapez ici Quel rang vous voulez Suppremier votre mot');
     Readln(X);
     While ( X > N ) do
     Begin
       Writeln('Tapez un nemuro de rang qui existe');
       Readln(X);
     End;
     If ( X=1) then
     Begin
       A:=L^.Suivant;
       Dispose(L);
       L:=A;
       P:=L;
       PTR:=L;
       N:=N-1;
     End
     Else if ( X=N) then
     Begin
       PTR:=L;
       For i:=1 to N do
       Begin
         If (L^.Suivant^.Suivant=Nil ) then P:=L;
         L:=L^.Suivant;
       End;
       L:=P^.Suivant;
       L:=Nil;
       L:=PTR;
       P:=L;
       N:=N-1;
     End
     Else if ( X < N) and ( X > 1 ) then
     Begin
       A:=Nil;
       For i:=1 to X-2 do L:=L^.Suivant;
       A:=L;
       P:=L^.Suivant;
       L:=L^.Suivant^.Suivant;
       A^.Suivant:=Nil;
       P^.S:='';
       P:=Nil;
       A^.Suivant:=L;
       A:=Nil;
       L:=PTR;
       P:=PTR;
       N:=N-1;
     End;
     {-------------- Affichage-----------------------------}
     Writeln('La Liste');
     For i:=1 to N Do
     Begin
       Write(L^.S,'  ');
       L:=L^.Suivant;
     End;
     L:=P;
     {--------- Creation Et Remplissage de Liste2 ---------}
     PTR1:=Nil;
     P1:=Nil;
     L1:=Nil;
     A1:=Nil;
     New(L1);
     L1^.S:='A';
     PTR1:=L1;
     P1:=L1;
     For i:=2 to NT do
     Begin
       New(L1^.Suivant);
       L1:=L1^.Suivant;
       L1^.S:=T[NT-I];
     End;
     L1^.S:='W';
     L1^.Suivant:=Nil;
     L1:=PTR1;
     {-------------- Affichage-----------------------------}
     Writeln;
     Writeln('La Liste 2');
     For i:=1 to NT Do
     Begin
       Write(L1^.S,'  ');
       L1:=L1^.Suivant;
     End;
     L1:=PTR1;
     {-------------- EXO 10 ------ L2 Then L1 -------------}
     {For i:=1 to NT-1 do L1:=L1^.Suivant;
     New( L1^.Suivant );
     L1^.Suivant:=PTR;
     L1:=PTR1;
     N:=NT+NT;}
     {-------------- Affichage-----------------------------}
     {Writeln;
     Writeln('Liste Combined');
     For i:=1 to N do
     Begin
     Write(L1^.S,'  ');
     L1:=L1^.Suivant;
     End;
     L1:=PTR1;}
     {-------------- EXO 11 ------ L1 Then L2 ------------------------}
     {For i:=1 to NT-1 do L:=L^.Suivant;
     New( L^.Suivant );
     L^.Suivant:=PTR1;
     L:=PTR;
     N:=NT+NT;}
     {-------------- Affichage-----------------------------}
     {Writeln;
     Writeln('Liste Combined');
     For i:=1 to N do
     Begin
     Write(L^.S,'  ');
     L:=L^.Suivant;
     End;
     L:=PTR;}
     {-------------- EXO 12 -------------------------------}
     Writeln;
     A:=Nil;
     Writeln('Tapez ici Quel rang vous voulez Inser votre List L2 Dans L1');
     Readln(X);
     While ( X > NT ) do
     Begin
       Writeln('Tapez un nemuro de rang qui existe');
       Readln(X);
     End;
     If ( X=1) then
     Begin
       For i:=1 to NT-1 do L1:=L1^.Suivant;
       New( L1^.Suivant );
       L1^.Suivant:=PTR;
       L:=PTR1;
     End
     Else if ( X=NT) then
     Begin
       For i:=1 to NT-1 do L:=L^.Suivant;
       New( L^.Suivant );
       L^.Suivant:=PTR1;
       L:=PTR;
     End
     Else if ( X < NT) and ( X > 1 ) then
     Begin
       L:=PTR;
       For i:=1 to X-2 do L:=L^.Suivant;
       P:=L^.Suivant;
       L^.Suivant:=PTR1;
       A:=Nil;
       For i:=1 to NT-1 do L1:=L1^.Suivant;
       New(L1^.Suivant);
       L1^.Suivant:=P;
       L1:=PTR1;
       L:=PTR;
       P:=PTR;
     End;
     {-------------- Affichage-----------------------------}
     Writeln('Liste Inserted');
     For i:=1 to NT+NT do
     Begin
     Write(L^.S,'  ');
     L:=L^.Suivant;
     End;
     L:=PTR;
     {-------------- EXO 14 -------------------------------}
     N:=NT+NT;
     L:=PTR;
     If ( N div 2 <> 0 ) then
     Begin
       I:=0;
       Repeat
         Save:=L^.S;
         L^.S:=L^.Suivant^.S;
         L^.Suivant^.S:=Save;
         L:=L^.Suivant;
         L:=L^.Suivant;
         I:=I+2;
       Until(I=N-1);
       L:=PTR;
     End
     Else If ( N div 2 = 0 ) then
     Begin
       I:=0;
       Repeat
         Save:=L^.S;
         L^.S:=L^.Suivant^.S;
         L^.Suivant^.S:=Save;
         L:=L^.Suivant;
         L:=L^.Suivant;
         I:=I+2;
       Until(I=N);
       L:=PTR;
     End;
     {-------------- Affichage-----------------------------}
     L:=PTR;
     Writeln;
     Writeln('Liste Flipped');
     For i:=1 to N do
     Begin
     Write(L^.S,'  ');
     L:=L^.Suivant;
     End;
     L:=PTR;
   Readln;
   End.