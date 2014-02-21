  1 setpar(){
  2 
  3 NSW=$1
  4 ISIF=$2
  5 
  6 #sed -i '23i NSW = 0' INCAR
  7 rm foo foo2
  8 cp INCAR.o INCAR
  9 sed '/NSW/d' INCAR >> foo
 10 sed '/ISIF/d' foo >> foo2
 11 #NSW='300'
 12 #ISIF='2'
 13 sed -i "23i NSW = "$NSW"" foo2
 14 sed -i "26i ISIF = "$ISIF"" foo2
 15 #mv foo2 INCAR2
 16 }
 17 #to call the function
 18 setpar 123 456
 
~                          
