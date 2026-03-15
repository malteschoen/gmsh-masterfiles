//grab step file
Merge "input.step";

//Tolerance - important to catch annoying small gaps/small steps
//preset of 0.99 which is 990 µm for a mm-sized STEP file and 99 cm for meter-sized one
Geometry.Tolerance = 0.99;

//Various clean-up bits
SetFactory("OpenCASCADE");
Coherence;

Geometry.OCCFixDegenerated = 1;
Geometry.OCCFixSmallEdges = 1;
Geometry.OCCFixSmallFaces = 1;
Geometry.OCCSewFaces = 1;
Geometry.OCCMakeSolids = 1;

HealShapes;

//2D algorithm - recommended to use (6) for frontal, MeshAdapt (1) as fallback
Mesh.Algorithm = 6;

//3D algorithm - recommended to use (9) for rTree, maybe HXT (10) for very large meshes
Mesh.Algorithm3D = 9;

//split every tet into four hexes
Mesh.SubdivisionAlgorithm = 2;

//you will need both optimizers
Mesh.Optimize = 1;
Mesh.OptimizeNetgen = 1;

// Collect all volumes
vols[] = Volume{:};
Physical Volume("fluid") = {vols[]};

// Collect all surfaces
surfs[] = Surface{:};

// Define surface groups based on your refinement zones
// Replace these IDs with your actual surface IDs from the STEP file
fine_surfaces = {1, 1, 1, 1, 1};  
medium_surfaces = {35, 38, 41, 44, 47};            
coarse_surfaces = {50, 53, 56, 59, 62};          

// Define mesh sizes
lc_fine = 3;
lc_medium = 6;
lc_coarse = 20;

// Field no 1 of type 'Distance' for fine surfaces
Field[1] = Distance;
Field[1].SurfacesList = {fine_surfaces[]};

// corresponding 'Threshold' type field  no 2
Field[2] = Threshold;
Field[2].IField = 1;
Field[2].LcMin = lc_fine;
Field[2].LcMax = lc_medium;  // Transition to medium size
Field[2].DistMin = 0.5;       // Zone of finest mesh
Field[2].DistMax = 2.0;       // Distance to reach LcMax

// Field no 3 of type 'Distance' for medium surfaces
Field[3] = Distance;
Field[3].SurfacesList = {medium_surfaces[]};

// corresponding 'Threshold' type field no 4
Field[4] = Threshold;
Field[4].IField = 3;
Field[4].LcMin = lc_medium;
Field[4].LcMax = lc_coarse;   // Transition to coarse size
Field[4].DistMin = 1.0;
Field[4].DistMax = 4.0;

// field no 5 of min type - takes what isnt field 2 or 4
Field[5] = Min;
Field[5].FieldsList = {2, 4};

// Apply as background field
Background Field = 5;
