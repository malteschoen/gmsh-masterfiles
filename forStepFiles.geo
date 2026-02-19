//grab step file
Merge "input.step";

//Tolerance - important to catch annoying small gaps
Geometry.Tolerance = 0.01;

//mesh resolution, try to keep max/min ratio under 3
Mesh.MeshSizeMin = 5;
Mesh.MeshSizeMax = 10;


//2D algorithm - recommended to use (6) for frontal, MeshAdapt (1) as fallback
Mesh.Algorithm = 6;

//3D algorithm - recommended to use (9) for rTree, maybe HXT (10) for very large meshes
Mesh.Algorithm3D = 9;


//split every tet into four hexes
Mesh.SubdivisionAlgorithm = 2;

//you will need both optimizers
Mesh.Optimize = 1;
Mesh.OptimizeNetgen = 1;

//Various clean-up bits
SetFactory("OpenCASCADE");
HealShapes;
Coherence;
Geometry.OCCFixDegenerated = 1;
Geometry.OCCFixSmallEdges = 1;
Geometry.OCCFixSmallFaces = 1;
Geometry.OCCSewFace = 1;
Geometry.OCCMakeSolids = 1;

// Collect all volumes
vols[] = Volume{:};
Physical Volume("fluid") = {vols[]};

// Collect all surfaces
surfs[] = Surface{:};

// Manually assign 99 physical surfaces -hopefully your file has fewer
Physical Surface("patch_00") = {surfs[00]};
Physical Surface("patch_01") = {surfs[01]};
Physical Surface("patch_02") = {surfs[02]};
Physical Surface("patch_03") = {surfs[03]};
Physical Surface("patch_04") = {surfs[04]};
Physical Surface("patch_05") = {surfs[05]};
Physical Surface("patch_06") = {surfs[06]};
Physical Surface("patch_07") = {surfs[07]};
Physical Surface("patch_08") = {surfs[08]};
Physical Surface("patch_09") = {surfs[09]};
Physical Surface("patch_10") = {surfs[10]};
Physical Surface("patch_11") = {surfs[11]};
Physical Surface("patch_12") = {surfs[12]};
Physical Surface("patch_13") = {surfs[13]};
Physical Surface("patch_14") = {surfs[14]};
Physical Surface("patch_15") = {surfs[15]};
Physical Surface("patch_16") = {surfs[16]};
Physical Surface("patch_17") = {surfs[17]};
Physical Surface("patch_18") = {surfs[18]};
Physical Surface("patch_19") = {surfs[19]};
Physical Surface("patch_20") = {surfs[20]};
Physical Surface("patch_21") = {surfs[21]};
Physical Surface("patch_22") = {surfs[22]};
Physical Surface("patch_23") = {surfs[23]};
Physical Surface("patch_24") = {surfs[24]};
Physical Surface("patch_25") = {surfs[25]};
Physical Surface("patch_26") = {surfs[26]};
Physical Surface("patch_27") = {surfs[27]};
Physical Surface("patch_28") = {surfs[28]};
Physical Surface("patch_29") = {surfs[29]};
Physical Surface("patch_30") = {surfs[30]};
Physical Surface("patch_31") = {surfs[31]};
Physical Surface("patch_32") = {surfs[32]};
Physical Surface("patch_33") = {surfs[33]};
Physical Surface("patch_34") = {surfs[34]};
Physical Surface("patch_35") = {surfs[35]};
Physical Surface("patch_36") = {surfs[36]};
Physical Surface("patch_37") = {surfs[37]};
Physical Surface("patch_38") = {surfs[38]};
Physical Surface("patch_39") = {surfs[39]};
Physical Surface("patch_40") = {surfs[40]};
Physical Surface("patch_41") = {surfs[41]};
Physical Surface("patch_42") = {surfs[42]};
Physical Surface("patch_43") = {surfs[43]};
Physical Surface("patch_44") = {surfs[44]};
Physical Surface("patch_45") = {surfs[45]};
Physical Surface("patch_46") = {surfs[46]};
Physical Surface("patch_47") = {surfs[47]};
Physical Surface("patch_48") = {surfs[48]};
Physical Surface("patch_49") = {surfs[49]};
Physical Surface("patch_50") = {surfs[50]};
Physical Surface("patch_51") = {surfs[51]};
Physical Surface("patch_52") = {surfs[52]};
Physical Surface("patch_53") = {surfs[53]};
Physical Surface("patch_54") = {surfs[54]};
Physical Surface("patch_55") = {surfs[55]};
Physical Surface("patch_56") = {surfs[56]};
Physical Surface("patch_57") = {surfs[57]};
Physical Surface("patch_58") = {surfs[58]};
Physical Surface("patch_59") = {surfs[59]};
Physical Surface("patch_60") = {surfs[60]};
Physical Surface("patch_61") = {surfs[61]};
Physical Surface("patch_62") = {surfs[62]};
Physical Surface("patch_63") = {surfs[63]};
Physical Surface("patch_64") = {surfs[64]};
Physical Surface("patch_65") = {surfs[65]};
Physical Surface("patch_66") = {surfs[66]};
Physical Surface("patch_67") = {surfs[67]};
Physical Surface("patch_68") = {surfs[68]};
Physical Surface("patch_69") = {surfs[69]};
Physical Surface("patch_70") = {surfs[70]};
Physical Surface("patch_71") = {surfs[71]};
Physical Surface("patch_72") = {surfs[72]};
Physical Surface("patch_73") = {surfs[73]};
Physical Surface("patch_74") = {surfs[74]};
Physical Surface("patch_75") = {surfs[75]};
Physical Surface("patch_76") = {surfs[76]};
Physical Surface("patch_77") = {surfs[77]};
Physical Surface("patch_78") = {surfs[78]};
Physical Surface("patch_79") = {surfs[79]};
Physical Surface("patch_80") = {surfs[80]};
Physical Surface("patch_81") = {surfs[81]};
Physical Surface("patch_82") = {surfs[82]};
Physical Surface("patch_83") = {surfs[83]};
Physical Surface("patch_84") = {surfs[84]};
Physical Surface("patch_85") = {surfs[85]};
Physical Surface("patch_86") = {surfs[86]};
Physical Surface("patch_87") = {surfs[87]};
Physical Surface("patch_88") = {surfs[88]};
Physical Surface("patch_89") = {surfs[89]};
Physical Surface("patch_90") = {surfs[90]};
Physical Surface("patch_91") = {surfs[91]};
Physical Surface("patch_92") = {surfs[92]};
Physical Surface("patch_93") = {surfs[93]};
Physical Surface("patch_94") = {surfs[94]};
Physical Surface("patch_95") = {surfs[95]};
Physical Surface("patch_96") = {surfs[96]};
Physical Surface("patch_97") = {surfs[97]};
Physical Surface("patch_98") = {surfs[98]};
Physical Surface("patch_99") = {surfs[99]};