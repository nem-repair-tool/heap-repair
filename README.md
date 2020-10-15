NEM: Automated Program Repair of Heap-Manipulating Programs using Deductive Synthesis

VIRTUAL MACHINE
-   We use VMCAI 2021 Virtual Machine. Remind that the VM has a sudo user "vmcai2021"
    with the password "vmcai2021".
-   The main directory of the artifacts is: "~/artifacts"

STRUCTURE OF ARTIFACTS DIRECTORY
In side the folder "~/artifacts":
-   nem: the directory containing our tool NEM

-   mutation-based: the directory containing the compared tool, a mutation-based approach.

-   benchmark: the directory containing heap-manipulating programs we used in our
    evaluation benchmark.

-   evaluated: contains buggy programs, generated from the benchmark.
    Inside the "evaluated" directory, there are multiple sub-directories. Each sub-directory
    contains buggy versions of one program in the benchmark. For example,
    the directory "dll-append" contains buggy versions of the program "dll-append".

-   RunningTime.pdf: contains details of our evaluation of two tool.
    It also contains expected running time for each program of the benchmark.

-   scripts: contains all script .py and .sh files to reproduce our experiment results.

RESOURCE REQUIREMENTS
    We conducted experiments on a computer with CPU Intel Core i7-6700 (3.4GHz), 8GB RAM,
    and Ubuntu 16.04 LTS.

INSTALLATION
    We already installed two evaluated tools and other components to run them.
    You only need to follow below instructions to reproduce our results.
    You could find the expected running time in RunningTime.pdf

There are some differences in using Ocaml versions between two tools. You should switch to the
   corresponding version when running a tool. We already did it in our script files.
-   Our tool is built on Ocaml 4.07.0. You should switch to this version when you run our tool,
    using the following command "opam switch 4.07.0; eval $(opam env)"
-   The compared tool is built on Ocaml 4.02.1. You should switch to this version when you run
    the compared tool, using the following command "opam switch 4.02.1; eval $(opam env)"


BUG INJECTION

-   "sh ~/artifacts/scripts/infestor.sh": is the script to introduce bugs into programs.
    The results are buggy programs which are then stored at the current directory.
    All buggy in the EVALUATED directory are generated using the same running script.

-   To introduce bugs to a correct program, we use the following command
    "~/artifacts/nem/hip --infestor inputProgram".
    For example, to create buggy versions of "sll-length", we use
    "~/artifacts/nem/hip --infestor ~/artifacts/benchmark/sll-length.ss"

-   Interpreting the results.
    + Number of buggy versions that contain one bug.
    + Number of buggy versions that contain two bugs.
    + The total number of buggy versions.

-   The name of buggy programs in the form inputProgram_buggy_numOfBugs_bugID.ss.
    For example, sll-length_buggy_1_2.ss is a buggy vesion of sll that contains 1 bug
    and is the second buggy version in the list. Meanwhile, sll-length_buggy_2_9.ss
    contains 2 bugs and is 9th buggy version in the list.

REPRODUCE THE EXPERIMENT RESULTS

-   "sh ~/artifacts/scripts/run-nem-all.sh": run this file to reproduce all results of our tool

-   "sh ~/artifacts/scripts/run-all-mutated.sh": run this file to reproduce all results of
    the compared tool, denoted as "Mutated-Based Tool" in our experiment table.

-   "~/artifacts/scripts/run-benchmark.py inputDirectory": this python script is to run
    our tool for one directory.
    For example, to run our tool NEM for all buggy versions of sll-length:
    "~/artifacts/scripts/run-benchmark.py ~/artifacts/evaluated/sll-length"

-   Likewise, "~/artifacts/scripts/mutated-run-benchmark.py inputDirectory":
    this python script is to run the compared tool for one directory.
     For example, to run the mutated-based tool for all buggy versions of sll-length:
     "~/artifacts/scripts/mutated-run-benchmark.py ~/artifacts/evaluated/sll-length"

-   To run our tool NEM for one buggy program:
    "~/artifacts/nem/hip --en-repair inputProgram".
    For example:
    "~/artifacts/nem/hip --en-repair ~/artifacts/evaluated/sll-length_buggy_1_6.ss"

-   To run the mutation-based tool for one buggy program:
    "~/artifacts/mutation-based/hip -tp z3 --en-repair --bug-not-file inputProgram".

-   For example,
    "~/artifacts/mutation-based/hip -tp z3 --en-repair --bug-not-file ~/artifacts/evaluated/sll-length_buggy_1_6".

-   The timeout for each tool to repair a program is 300 seconds.

INTERPRETING THE RESULTS OF RUNNING OUR TOOL

-   Our tool first report that it could repair an input program or not

-   If our tool can repair a program, it will show the following information:
    + The buggy statement
    + The buggy position inside the input program
    + The patch to repair the buggy statement
    + The time to repair the input program

-   If our tool use mutation operators, it directory shows the mutated program to repair
    the input program

INTERPRETING THE RESULTS OF RUNNING THE COMPARED TOOL
-   The compared tool will directly show the repaired program if it can repair under
    the phase "Repair Found"

-   Otherwise, it fails to repair.
