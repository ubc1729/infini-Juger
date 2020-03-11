# bash test.sh
# Stress Testing
# temp.cpp                 solution you want to stress test
# brute_force.cpp          brute_force/naive solution for the problem
# test_generator.cpp       generates a new random test case for the problem

# compile all programs first
g++ temp.cpp -DONLINE_JUDGE -o temp
g++ brute_force.cpp -DONLINE_JUDGE -o brute_force
g++ test_generator.cpp -DONLINE_JUDGE -o test_generator
echo "Compiled Successfully!"
printf "\n"

# files used
# input.txt                input file for temp.cpp, brute_force.cpp and output file for test_generator.cpp
# output.txt               output file for temp.cpp
# output_brute.txt         output file for brute_force.cpp
# failed_cases.txt         failed cases inputs will be appended here for further reference

#clear all files
> input.txt  
> output.txt
> failed_cases.txt
> output_brute.txt

for ((i = 1; ;i++)) do
  printf "[TEST #$i]"
  # generate a new test case in the file named "input.txt"
  # note that this test case is completely random and check
  # echo "> test_generator" 
  ./test_generator > input.txt 
  # redirect the brute_force solution output to the "output_brute.txt" file
  # echo "> brute_force"
  ./brute_force < input.txt > output_brute.txt
  # redirect the solution output to the "output.txt" file
  # echo "> temp"
  ./temp < input.txt > output.txt
  # Add TLE case here if needed use awk

  # compare both outputs.
  # if outputs are different, echo the 
  # corresponding message and break the loop.
  # failing test will be in the "input.txt" and "failed_cases.txt" as well
  # cmp -s output_brute.txt output.txt
  if diff -w output_brute.txt output.txt
  then
     printf "[-OK-]\n"
  else
     printf "\n"
     echo "[-*-WA-*-]"
     cat input.txt >> failed_cases.txt
     printf "\n"
     echo "[-FOUND FAILING TEST!-]"
     printf "\n"
     echo "[INPUT]"
     printf "\n"
     cat failed_cases.txt
     printf "\n"
     echo "[BRUTE FORCE OUTPUT]"
     printf "\n"
     cat output_brute.txt
     printf "\n"
     echo "[TEMP OUTPUT]"
     printf "\n"
     cat output.txt
     printf "\n"
     break
  fi
done
