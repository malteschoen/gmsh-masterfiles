//mostly a rehash of gmsh tutorial t13

//grab input
Merge "input.stl";

//Tolerance - important to catch annoying small gaps
Geometry.Tolerance = 0.01;

DefineConstant[
  // Angle between two triangles above which an edge is considered as sharp
  angle = {40, Min 20, Max 120, Step 1,
    Name "Parameters/Angle for surface detection"},
  // For complex geometries, patches can be too complex, too elongated or too
  // large to be parametrized; setting the following option will force the
  // creation of patches that are amenable to reparametrization:
  forceParametrizablePatches = {0, Choices{0,1},
    Name "Parameters/Create surfaces guaranteed to be parametrizable"},
  // For open surfaces include the boundary edges in the classification process:
  includeBoundary = 1,
  // Force curves to be split on given angle:
  curveAngle = 180
];
ClassifySurfaces{angle * Pi/180, includeBoundary, forceParametrizablePatches,
                 curveAngle * Pi / 180};

// Create a geometry for all the discrete curves and surfaces in the mesh, by
// computing a parametrization for each one
CreateGeometry;

// Create a volume as usual
Surface Loop(1) = Surface{:};
Volume(1) = {1};


//2D algorithm - recommended to use (6) for frontal, MeshAdapt (1) as fallback
Mesh.Algorithm = 6;

//3D algorithm - recommended to use (9) for rTree, maybe HXT (10) for very large meshes
Mesh.Algorithm3D = 9;

//be happy if you can get decent all-tet 3d mesh
//if needed, look into dual meshes (e.g. polyDualMesh)
Mesh.SubdivisionAlgorithm = 0;

//you will need both optimizers
Mesh.Optimize = 1;
Mesh.OptimizeNetgen = 1;
