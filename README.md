# Finite Element Solver for Truss and Fames


## Instructions:
	1. The structure matrices must be copied into the respective .txt files located in the program folder:
		Node matrix: nodes.txt
		Matrix of elements: element.txt
		Boundary conditions matrix: boundary.txt
		Matrix of forces: forces.txt

	2. To run the program, the file Main_FEM.m must be executed.

	3. The type of structure must be chosen correctly with the pop-up menu (TRUSS or FRAME).
	
	4. A window will open with buttons to observe the results of displacements and local forces,
	additionally there are buttons to plot the structure and to animate the deformations of the structure (a multiplying factor must be entered). 
	(a multiplication factor of the displacements must be entered).

	5. The "element forces" button opens another window for detailed analysis of each element - global forces, local forces, stresses and diagrams.
	forces and diagrams.

**Nodes** = [index, X, Y ]
**Elements** = [index, Node1, Node2, inertia, area, Young Modulus].
**DoF:** x=1, y=2, z=3
Boundary_conditions = [index, Node, DoF, Value]
Forces = [index, Node, DoF, Value].


### NOTE 1:
	The matrices must be copied without brackets or commas or semicolons (In the structure folder there are different structures
	(In the structure folder there are different test structures where you can see the correct way to copy the matrices).

### NOTE 2:
	There is no defensive programming to identify the type of structure, therefore the user is asked and he/she must
	enter it correctly
