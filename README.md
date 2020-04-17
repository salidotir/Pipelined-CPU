# Pipelined-CPU

To improve throughput of a single multicycle CPU, we use the pipeline technique.

Each instruction is done in 5 stages:
1. Intsruction fetch --> it is implemented using cache in this project.
2. Instruction decode
3. Execute
4. Memory
5. Write back
