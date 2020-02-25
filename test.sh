# bash test.sh
# Stress Testing
# temp.cpp                 solution you want to stress test
# brute_force.cpp          brute_force/naive solution for the problem
# test_generator.cpp       generates a new random test case for the problem

# compile all programs first
g++ temp.cpp -o temp
g++ brute_force.cpp -o brute_force
g++ test_generator.cpp -o test_generator
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
  echo "[TEST #$i]"
  # generate a new test case in the file named "input.txt"
  # note that this test case is completely random and check
  echo "> test_generator"
  ./test_generator
  # redirect the brute_force solution output to the "output_brute.txt" file
  echo "> brute_force"
  ./brute_force
  # redirect the solution output to the "output.txt" file
  echo "> temp"
  ./temp

  # compare both outputs.
  # if outputs are different, echo the 
  # corresponding message and break the loop.
  # failing test will be in the "input.txt" and "failed_cases.txt" as well
  if cmp -s output_brute.txt output.txt
  then
     echo "[OK]"
     printf "\n"
  else
     echo "[WA]"
     cat input.txt >> failed_cases.txt
     printf "\n"
     echo "[-FOUND FAILING TEST!-]"
     printf "\n"
     echo "[INPUT]"
     printf "\n"
     cat failed_cases.txt
     printf "\n"
     echo "[EXPECTED OUTPUT]"
     printf "\n"
     cat output_brute.txt
     printf "\n"
     echo "[WRONG OUTPUT]"
     printf "\n"
     cat output.txt
     printf "\n"
     break
  fi
done