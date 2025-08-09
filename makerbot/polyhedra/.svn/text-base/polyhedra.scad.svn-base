support_height = 0.5;
support_radius = 1;
// shape = "SnubDodecahedron";
// shape = "RhombicDodecahedron";
shape = "PentagonalHexecontahedron";

* supported(shape);
twohalf(shape);

module supported(polyname) {
	translate([0,0,1]) import(str("/Users/jmanton/polys/",polyname,".stl"));
	$fs = .1;
	cylinder(r = support_radius, h = support_height);
}

module twohalf(polyname) {
	difference() {	
		union() {
			translate([1.1,0,0]) import(str("/Users/jmanton/polys/",polyname,".stl"));
			rotate([180,0,0]) translate([-1.1,0,0]) import(str("/Users/jmanton/polys/",polyname,".stl"));
		}
		translate([0,0,-1]) cube([6,6,2], center = true);
	}
}