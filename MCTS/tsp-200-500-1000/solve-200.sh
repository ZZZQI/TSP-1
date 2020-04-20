#!/bin/bash
# author: 
rm -r ./code/TSP.o
rm -r ./test
make

Total_Instance_Num=(128)
Temp_City_Num=(200)
threads=(1) # $1
Inst_Num_Per_Batch=$(($Total_Instance_Num/$threads))

tsp=("./tsp200_test_concorde.txt")
j=0
sources200=("./results/200/result_1.txt")
for ((i=0;i<$threads;i++));do
{
	./test $i ${sources200[i]} ${tsp[j]} ${Temp_City_Num[j]} ${Inst_Num_Per_Batch}
}&
done
wait

echo "Done."
