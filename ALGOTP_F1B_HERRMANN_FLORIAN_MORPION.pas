program morpion;

uses crt;

//BUT:Jouer au morpion	
//ENTREE:Case choisi
//SORTIE:Gagne ou non et indique quel joueur gagne une manche

CONST
	NBRMANCHEMAX= 3;

Type

Tgrille = array [1..3,1..3]of string;

procedure init_jeu:BOOLEAN;

VAR
	pseudoJ1,pseudoJ2:String;
	compteur:INTEGER;

BEGIN
	
	Writeln('Vous aller jouer au jeu du morpion');
	Writeln('Votre but est d''aligner 3 chiffres verticalement, horizontalement ou en diagonale afin de gagner');
	Writeln('Le jeu se déroule en ',NBRMANCHE,'manches .');
	Writeln('Premier joueur, veuillez entrer votre pseudo');
	Readln(pseudoJ1);
	Writeln('Deuxième joueur, veuillez entrer votre pseudo');
	Readln(pseudoJ2);
		IF choix=TRUE THEN
				begin
					Writeln('le joueur qui commence la partie est : ',pseudoJ1);
					Writeln('Vous controlez les O');
				end;
		ELSE	Writeln('le joueur qui commence la partie est : ',pseudoJ2);
					Writeln('Vous controlez les X');
		end;
	
END;

procedure init_tab( var grille : Tgrille );

VAR
	i,j:INTEGER;
	fin:BOOLEAN;

begin
	fin:=FALSE;
	Writeln('Manche ',compteur_manche)
     for i:=1 to 3 do
     	for j:=1 to 3 do
     		grille[i,j]:='-';
     	end;
     if manches_gagnantes =trunc(NBRMANCHEMAX/2+1)then 
     	begin
     	fin:=TRUE;
     	end;
 END;

 function deplacement(var pseudoJ1,pseudoJ2:STRING,grille : Tgrille);

VAR
	i,j:INTEGER;

begin 
		Writeln(pseudoJ1,'veuillez ecrire votre coordonnee en ligne (de 1 a 3)')
		Readln(i);
		Writeln(pseudoJ1,'veuillez ecrire votre coordonnee en colonne (de 1 a 3)')
		Readln(j);
		if i >=1 and i <=3 then
			if j >=1 and j <=3 then
				while grille[i,j]<>'-' then
					begin
						Writeln('Veuillez ecrire votre coordonnee en ligne (de 1 a 3)')
						Readln(i);
						Writeln('Veuillez ecrire votre coordonnee en colonne (de 1 a 3)')
						Readln(j);
					end;
					grille[i,j]:='O';
				end;
	END;
		Writeln(pseudoJ2,'veuillez ecrire votre coordonnee en ligne (de 1 a 3)')
		Readln(i);
		Writeln(pseudoJ2,'veuillez ecrire votre coordonnee en colonne (de 1 a 3)')
		Readln(j);
		if i >=1 and i <=3 then
			if j >=1 and j <=3 then
				while grille[i,j]<>'-' then
					begin
						Writeln('Veuillez ecrire votre coordonnee en ligne (de 1 a 3)')
						Readln(i);
						Writeln('Veuillez ecrire votre coordonnee en colonne (de 1 a 3)')
						Readln(j);
					end;
					grille[i,j]:='X';
				end;
	END;
END;
	
function gagne_perd(grille : Tgrille);

VAR
	manche_gagnantesJ1:INTEGER;
	manche_gagnantesJ2:INTEGER;

BEGIN
	if grille[1,1]='O' and grille[2,1]='O' and grille[3,1]='O' 
	or grille[1,2]='O' and grille[2,2]='O' and grille[3,2]='O'
	or grille[1,3]='O' and grille[2,3]='O' and grille[3,3]='O'
	or grille[1,1]='O' and grille[2,2]='O' and grille[3,3]='O'
	or grille[3,1]='O' and grille[2,2]='O' and grille[1,3]='O'
	then
		begin 
			Writeln('Vous avez gagné la manche,'pseudoJ1);
			manche_gagnantesJ1:=manche_gagnantesJ1+1;
		end;
	if grille[1,1]='X' and grille[2,1]='X' and grille[3,1]='X' 
	or grille[1,2]='X' and grille[2,2]='X' and grille[3,2]='X'
	or grille[1,3]='X' and grille[2,3]='X' and grille[3,3]='X'
	or grille[1,1]='X' and grille[2,2]='X' and grille[3,3]='X'
	or grille[3,1]='X' and grille[2,2]='X' and grille[1,3]='X'
	then 
		begin 
			Writeln('Vous avez gagné la manche,'pseudoJ2);
			manche_gagnantesJ2:=manche_gagnantesJ2+1;
		end;
	if grille[1,1]<>'-' and grille[2,1]<>'-' and grille[3,1]<>'-' and grille[1,2]<>'-' and grille[2,2]='-' and grille[3,2]<>'-' and grille[1,3]<>'-' and grille[2,3]<>'-' and grille[3,3]<>'-' then
		begin
			Writeln('Aucun joueur n''a gagné');
		end;
END;

function manche(manche_gagnantesJ1,manche_gagnantesJ2:INTEGER,pseudoJ1,pseudoJ2:STRING);

BEGIN

	if manche_gagnantesJ1=trunc(NBRMANCHE/2+1)then
		begin
			Writeln(pseudoJ1,'a gagné la partie, bien joué à lui');
		end;
	if manche_gagnantesJ2=trunc(NBRMANCHE/2+1)then
		begin
			Writeln(pseudoJ2,'a gagné la partie, bien joué à lui');
		end;

END;		

VAR
	grille:Tgrille;
	pseudoJ1,pseudoJ2,manche_gagnantesJ1,manche_gagnantesJ2:INTEGER;

BEGIN
	init_jeu;
	init_tab(grille);
	deplacement(grille,pseudoJ1,pseudoJ2);
	gagne_perd(grille);
	manche(pseudoJ1,pseudoJ2,manche_gagnantesJ1,manche_gagnantesJ2);

END.
