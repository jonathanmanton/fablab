BeginPackage["PolyPrint`"]

PolyPrint::usage =
        "PolyPrint['polyname'] creates an STL file suitable for 3D printing of that named
	polyhedron.  The polyhedron is rotated so the bottom-most face is parallel with the Z plane,
	and is scaled to have a generalized radius of one unit.  The STL file is then exported to
	polyname.stl."

Begin["`Private`"]

(* ******************* all the helper functions *********************** *)

ScaledPolyhedron[poly_, boundingradius_] := Module[
  {unitradius = PolyhedronData[poly, "GeneralizedDiameter"]/2},
  MapAt[Times[#, boundingradius / unitradius] &, 
   PolyhedronData[poly, "Faces"], {1}]
  ]

xform::Usage = 
  "xform takes in two vectors, and returns a matrix that, when dotted \
with the original vectors will make the normal of those vectors point \
straight up.  This is used to take an arbitrary face of a polyhedra \
and from three points generate a transformation matrix that will \
rotate the entire polyhedra so that that face is parallel with the z \
= 0 plane.";

xform[v1_, v2_] := Module[{nv1, nv2, norm1, norm2},
  nv1 = Normalize[v1];
  nv2 = Normalize[v2];
  norm1 = Normalize[Cross[nv1, nv2]];
  norm2 = Normalize[Cross[nv1, norm1]];
  {nv1, norm2, norm1}
  ]

rotatePolyhedron::Usage = 
  " takes in a shape in the form of a (probably \!\(\*
StyleBox[\"Mathematica\",\nFontSlant->\"Italic\"]\)\!\(\*
StyleBox[\" \",\nFontSlant->\"Italic\"]\)version-dependent) \
Graphics3D object with a list of vertices, then a set of polygons \
referencing those vertices.It then selects a face (the first one, \
arbitrarily), and rotates the whole Graphics3D object to make that \
face parallel with the z=0 plane.";

rotatePolyhedron[shape_, face_: 1] := 
 Module[{nl, polygons, a, b, c, xf},
  (nl = First[shape] /. 
     GraphicsComplex[nodelist_, rest___] -> nodelist);
  (* like PolyhedronData["shapename", 
  "VertexCoordinates"] *)
  (polygons = 
    Cases[shape, _Polygon, Infinity]);
  (* sort of like PolyhedronData["shapename", 
  "FaceIndices"] *)
  {a, b, c} = Take[polygons[[1, 1, face]], 3];
  xf = N[xform[nl[[a]] - nl[[b]], nl[[c]] - nl[[b]]]];
  Graphics3D[GraphicsComplex[(xf . #) & /@ nl, polygons[[1]]], 
   Axes -> True]
  ]

exportRotatedScaledPolyhedron::Usage = 
  "Given the name of a polyhedrondata shape and a directory to export \
to, this will export the STL file, all ready for 3D printing.  The shape
will be scaled to have a generalized radius of 1.";

exportRotatedScaledPolyhedron[shapename_, directory_] := Module[{gc},
   gc = rotatePolyhedron[ScaledPolyhedron[shapename, 1]];
   Export[StringJoin[{directory, "/", shapename, ".stl"}], gc];
   ];

PolyPrint[polyname_] := exportRotatedScaledPolyhedron[polyname, "."];

End[ ]

EndPackage[ ]
