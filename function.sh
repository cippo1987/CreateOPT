setpar(){
        NSW=$1
        ISIF=$2
        rm foo foo2
        cp INCAR.o INCAR
        sed '/NSW/d' INCAR >> foo 
        sed '/ISIF/d' foo >> foo2
        sed -i "23i NSW = "$NSW"" foo2
        sed -i "26i ISIF = "$ISIF"" foo2
        mv foo2 INCAR
}   

runISIF2(){
        setpar 300 2
        COUNTER=$((COUNTER + 1)) 
        cp INCAR INCAR_${COUNTER}
         aprun -n $NPROC -N $NTASK /home/e05/e05/federico/bin/VASP/vasp5 > out${I}.out
         E=`tail -n 2 OSZICAR | awk '{ print $3}'`
         echo $COUNTER $ISIF $E >> Energylist.dat
         cp CONTCAR CONTCAR_${I}
         cp CONTCAR POSCAR
}
