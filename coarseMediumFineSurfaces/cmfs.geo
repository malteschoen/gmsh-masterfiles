Merge "your_part.step";

// Define surface groups based on your refinement zones
// Replace these IDs with your actual surface IDs from the STEP file
leading_edge_surfaces = {12, 15, 18, 21, 24};  // Surfaces requiring fine mesh
mid_surfaces = {35, 38, 41, 44, 47};            // Surfaces requiring medium mesh
far_surfaces = {50, 53, 56, 59, 62};            // Surfaces for coarse mesh

// Define mesh sizes
lc_fine = 0.05;
lc_medium = 0.2;
lc_coarse = 1.0

// Field for fine surfaces
Field[1] = Distance;
Field[1].SurfacesList = {leading_edge_surfaces[]};

Field[2] = Threshold;
Field[2].IField = 1;
Field[2].LcMin = lc_fine;
Field[2].LcMax = lc_medium;  // Transition to medium size
Field[2].DistMin = 0.5;       // Zone of finest mesh
Field[2].DistMax = 2.0;       // Distance to reach LcMax

// Field for medium surfaces
Field[3] = Distance;
Field[3].SurfacesList = {mid_surfaces[]};

Field[4] = Threshold;
Field[4].IField = 3;
Field[4].LcMin = lc_medium;
Field[4].LcMax = lc_coarse;   // Transition to coarse size
Field[4].DistMin = 1.0;
Field[4].DistMax = 4.0;

// Combine fields (take the minimum mesh size where zones overlap)
Field[5] = Min;
Field[5].FieldsList = {2, 4};

// Apply as background field
Background Field = 5;
