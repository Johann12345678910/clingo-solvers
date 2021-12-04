%Gose, Johann; gose@uni-potsdam.de
%Oliver, Zablocki; zablocki1@uni-potsdam.de

var(1..9). %define variable range
sudoku(X,Y,Z) :- initial(X,Y,Z). %import the give numbers
{sudoku(X,Y,Z): var(Z)}=1 :- var(X), var(Y), not initial(X,Y,_). %defines that each field in the sudoku needs exactly one number from 1 to 9 and is not already given

subgrid(X,Y,X2,Y2) :- var(X), var(X2), var(Y), var(Y2),(X-1)/3 == (X2-1)/3, (Y-1)/3 == (Y2-1)/3. %defines 3 3x3 subgrid: from 0-2, from 3-5, from 6-8

%define constraints: 
:- sudoku(X,Y,Z), sudoku(X2,Y,Z), X!=X2. %1. where numbers are not unique in lines
:- sudoku(X,Y,Z), sudoku(X,Y2,Z), Y!=Y2. %2. where numbers are not unique in collums
:- sudoku(X,Y,Z2), sudoku(X2,Y2,Z2), subgrid(X,Y,X2,Y2), X != X2, Y != Y2. %3. where numbers are not unique in there subgrids.

#show sudoku/3.
