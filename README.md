This is the solution for the Paintshop challenge described below. 

The solution was developed using Swift 3 and Xcode 8.1 and includes a unit test target.

When testing the solution, make sure you pass the proper argument in the Paintshop scheme editor.

The solution expects one argument which is the path to the input file.
A number of files are included within the project under PaintshopTests -> Resources




# Paintshop

You run a paint shop, and there are a few different colors of paint you can prepare.  Each color can be either "gloss" or "matte".

You have a number of customers, and each have some colors they like, either gloss or matte.  No customer will like more than one color in matte.

You want to mix the colors, so that:
   * There is just one batch for each color, and it's either gloss or matte.
   * For each customer, there is at least one color they like.
   * You make as few mattes as possible (because they are more expensive).

Your program should accept an input file as a command line argument, and print a result to standard out.  An example input file is:

5
1 M 3 G 5 G
2 G 3 M 4 G
5 M

The first line specifies how many colors there are.

Each subsequent line describes a customer.  For example, the first customer likes color 1 in matte, color 3 in gloss and color 5 in gloss.

Your program should read an input file like this, and print out either that it is impossible to satisfy all the customer, or describe, for each of the colors, whether it should be made gloss or matte.

The output for the above file should be:

G G G G M

...because all customers can be made happy by every paint being prepared as gloss except number 5.

An example of a file with no solution is:

1
1 G
1 M

Your program should print

No solution exists

A slightly richer example is:

5
2 M
5 G
1 G
5 G 1 G 4 M
3 G
5 G
3 G 5 G 1 G
3 G
2 M
5 G 1 G
2 M
5 G
4 M
5 G 4 M

...which should print:

G M G M G

One more example.  The input:

2
1 G 2 M
1 M

...should produce

M M
