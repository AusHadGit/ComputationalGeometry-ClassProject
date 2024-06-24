This is a final project for the Computational Geometry course, where the topic was chosen by the student. In this case, I chose to tackle the Art Gallery and Guard situation:

What is the absolute minimum of guards needed for complete coverage of an art gallery? With complete coverage meaning that for every corner in the art gallery room, there is a valid sightline from a placed guard to it.
This project not only allows users to place and move dots representing guards and seeing their accompanying valid sightlines (valid being that the sightline itself does not go through any of the borders of the art gallery room),
but also go through a number of different art gallery shapes with different numbers of corners.

Along with that, the prediction for the number of guards needed is based on a modified execution of Fisk's proof. In said proof, the simple explanation is that every simple triangulated polygon can hvae its vertices colored with exactly
3 colors. In the case of this project, this means a formula of n (n being the number of corner points in the art gallery) over 3. However, this didn't provide the most accurate representation of the minimum number of guards needed, so some
expansion was made upon this proof in the guardRec.pde file to provide a more accurate prediction. 

The last thing of note to say for this project is that the code is written entirely for a program called Processing. You will need to download the program, and once done doing so, can just drag all of the files over to an active instance
of Processing to run them and see it in action.
