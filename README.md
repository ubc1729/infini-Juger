# Local_Judge
In competitive programming, stress testing is a technique of testing your solution on a multitude of random test cases to find possible bugs and problems in the code.

Often, stress testing is performed with the help of a "stupid" brute-force solution for the problem, that may work correctly only on small test cases. The output of your solution is then compared against the output of the stupid solution to find possible mismatches.

## Running on local linux machine 
Run the bash command `bash test.sh` it terminates when the output files differ, to force terminate use `Ctrl + C`

- `temp.cpp`      -           solution you want to stress test
- `brute_force.cpp`  -        brute_force/naive solution for the problem
- `test_generator.cpp` -      generates a new random test case for the problem`
- `input.txt`    -            input file for temp.cpp, brute_force.cpp and output file for test_generator.cpp
- `output.txt`   -            output file for temp.cpp
- `output_brute.txt` -        output file for brute_force.cpp
- `failed_cases.txt` -        failed cases inputs will be appended here for further reference

## References
- [ADJA's blog](http://www.algos.school/stress-testing)
