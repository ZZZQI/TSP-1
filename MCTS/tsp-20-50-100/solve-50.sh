#!/bin/bash
# author: 
rm -r ./code/TSP.o
rm -r ./test
make

Total_Instance_Num=(10000)
Temp_City_Num=(50)
threads=(1) #$1
Inst_Num_Per_Batch=$((1+$Total_Instance_Num/$threads))

tsp=("./tsp50_test_concorde.txt")
j=0
sources50=("./results/50/result_1.txt")
for ((i=0;i<$threads;i++));do
{
	./test $i ${sources50[i]} ${tsp[j]} ${Temp_City_Num[j]} ${Inst_Num_Per_Batch}
}&
done
wait

echo "Done."
