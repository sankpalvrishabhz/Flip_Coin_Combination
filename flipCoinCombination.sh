#!/bin/bash
read -p "How many Times you want to Flip the Coin:" Limit
declare -A Singlet
declare -A Doublet
declare -A Triplet
declare -A Percent
for (( i=0; i<Limit; i++ ))
do
        num=$((RANDOM%8))
        if [[ $num -eq 0 ]]
        then
                Singlet[$i]=`echo H`
                ((count_H++))
                Doublet[$i]=`echo HH`
                ((count_HH++))
                Triplet[$i]=`echo HHH`
                ((count_HHH++))
        elif [[ $num -eq 1 ]]
        then
                Singlet[$i]=`echo T`
                ((count_T++))
                Doublet[$i]=`echo TH`
                ((count_TH++))
                Triplet[$i]=`echo HHT`
                ((count_HHT++))
        elif [[ $num -eq 2 ]]
        then
                Doublet[$i]=`echo HT`
                ((count_HT++))
                Triplet[$i]=`echo HTH`
                ((count_HTH++))
        elif [[ $num -eq 3 ]]
        then
                Doublet[$i]=`echo TT`
                ((count_TT++))
                Triplet[$i]=`echo THH`
                ((count_THH++))
        elif [[ $num -eq 4 ]]
        then
                Triplet[$i]=`echo HTT`
                ((count_HTT++))
        elif [[ $num -eq 5 ]]
        then
                Triplet[$i]=`echo THT`
                ((count_THT++))
	elif [[ $num -eq 6 ]]
        then
                Triplet[$i]=`echo TTH`
                ((count_TTH++))
        else
                Triplet[$i]=`echo TTT`
                ((count_TTT++))
        fi
done
echo -e "\nSinglet Directory:\n"${Singlet[@]}
echo -e "\nH have been faced $count_H times"
echo -e "T have been faced $count_T times\n"
echo "H Percentage:" $(($count_H*100/$Limit))
echo "T Percentage:" $(($count_T*100/$Limit))

echo -e "\nDoublet Directory:\n"${Doublet[@]}
echo -e "\nHH have been faced $count_HH times"
echo "HT have been faced $count_HT times"
echo "TH have been faced $count_TH times"
echo -e "TT have been faced $count_TT times\n"
echo "HH Percentage:" $(($count_HH*100/$Limit))
echo "HT Percentage:" $(($count_HT*100/$Limit))
echo "TH Percentage:" $(($count_TH*100/$Limit))
echo "TT Percentage:" $(($count_TT*100/$Limit))

echo -e "\nTriplet Combination:\n"${Triplet[@]}
echo -e "\nHHH have been faced $count_HHH times"
echo "HHT have been faced $count_HHT times"
echo "HTH have been faced $count_HTH times"
echo "THH have been faced $count_THH times"
echo "HTT have been faced $count_HTT times"
echo "THt have been faced $count_THT times"
echo "TTH have been faced $count_TTH times"
echo -e "TTT have been faced $count_TTT times\n"
echo "HHH Percentage:" $(($count_HHH*100/$Limit))
echo "HHT Percentage:" $(($count_HHT*100/$Limit))
echo "HTH Percentage:" $(($count_HTH*100/$Limit))
echo "THH Percentage:" $(($count_THH*100/$Limit))
echo "HTT Percentage:" $(($count_HTT*100/$Limit))
echo "THT Percentage:" $(($count_THT*100/$Limit))
echo "TTH Percentage:" $(($count_TTH*100/$Limit))
echo "TTT Percentage:" $(($count_TTT*100/$Limit))

Percent[H]=$(($count_H*100/$Limit))
Percent[T]=$(($count_T*100/$Limit))
Percent[HH]=$(($count_HH*100/$Limit))
Percent[HT]=$(($count_HT*100/$Limit))
Percent[TH]=$(($count_TH*100/$Limit))
Percent[TT]=$(($count_TT*100/$Limit))
Percent[HHH]=$(($count_HHH*100/$Limit))
Percent[HHT]=$(($count_HHT*100/$Limit))
Percent[HTH]=$(($count_HTH*100/$Limit))
Percent[THH]=$(($count_THH*100/$Limit))
Percent[HTT]=$(($count_HTT*100/$Limit))
Percent[THT]=$(($count_THT*100/$Limit))
Percent[THH]=$(($count_TTH*100/$Limit))
Percent[TTT]=$(($count_TTT*100/$Limit))

echo -e "\nSorted Percentage:\n"
echo ${Percent[@]} | tr " " "\n" | sort -nr
echo -e "\nPercentage Key:"
echo ${!Percent[@]}
