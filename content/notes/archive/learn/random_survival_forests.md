# Random Survival Forests
:machine_learning:

Random survival forests (RSFs) function by
randomly selecting a bootstrap sample of the data to grow a "tree."
A randomly selected subset of variables is used
to find a candidate variable that maximizes the difference
in survival between subsequent branches,
and this is repeated until the algorithm runs out
of branching points and satisfies the requirement that there be
at least one unique death at the terminal branching points.

Sampling assumes independence and samples with replacement.
Pull random samples of the same size by allowing duplicate entries (e.g. in row 1, "4" is used twice).
Sun 17 Nov 2019 10:23:05 AM CST
