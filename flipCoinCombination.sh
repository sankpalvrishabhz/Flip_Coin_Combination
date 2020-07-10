#!/bin/bash -x
read -p "How many Times you want to Flip the Coin:" Limit
declare -A Doublet
for (( i=0; i<Limit; i++ ))
do
        num=$((RANDOM%8))
        if [[ $num -eq 0 ]]
        then
                Triplet[$i]=`echo HHH`
                ((count_HHH++))
        elif [[ $num -eq 1 ]]
        then
                Triplet[$i]=`echo HHT`
                ((count_HHT++))
        elif [[ $num -eq 2 ]]
        then
                Triplet[$i]=`echo HTH`
                ((count_HTH++))
        elif [[ $num -eq 3 ]]
        then
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
echo -e "\nDoublet Combination:\n"${Doublet[@]}
echo -e "\nHH have been faced $count_HH times"
echo -e "\nHT have been faced $count_HT times"
echo -e "\nTH have been faced $count_TH times"
echo -e "\nTT have been faced $count_TT times"
echo -e "\nHH Percent=" $(($count_HH*100/$Limit))
echo -e "\nHT Percent=" $(($count_HT*100/$Limit))
echo -e "\nTH Percent=" $(($count_TH*100/$Limit))
echo -e "\nTT Percent=" $(($count_TT*100/$Limit))