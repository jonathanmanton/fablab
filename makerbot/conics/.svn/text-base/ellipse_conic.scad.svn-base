coneheight = 60;
conerad = 24;
cutheight = coneheight;
planesize = 300;
holeradius = .9;
holeoffset = 3;
shellthickness = .05;  // this is a percentage...
$fn = 180;
* translate([0,0,coneheight/2]) ellipsebot(30,36,.6);
* translate([0,0,coneheight/2]) shell(30,36,-.6);

* rotate([0,-30,0]) ellipsetop(30,36,.6);
rotate([0,-30,0]) shell(30,36,.6);

module conehole() {
			cylinder(r = holeradius, h = coneheight - 2*holeoffset, center = true);
}

module basecone() {
	difference() {
		cylinder(h = coneheight, r1 = conerad, r2 = 0, center = true);
		conehole();
	}
}

module ellipsebot(rot, trans, thickness) {
difference() {
	basecone();
	union() {
		bigshell(rot, trans, thickness);
		rotate([0,rot,0]) translate([0,0,trans]) cube([planesize,planesize,cutheight], center = true);
	}
}
}

module ellipsetop(rot, trans, thickness) {
difference() {
	basecone();
	union() {
		bigshell(rot, trans, thickness);
		rotate([0,rot,0]) translate([0,0,trans - cutheight]) cube([planesize,planesize,cutheight], center = true);
	}
}
}

module shell(rot, trans, thickness) {
	union() {
		difference() {
			difference() {
				cylinder(h = coneheight, r1 = conerad, r2 = 0, center = true);
				scale(v = [1 - shellthickness, 1 - shellthickness, 1 - shellthickness]) 
					cylinder(h = coneheight, r1 = conerad, r2 = 0, center = true);
			}
			rotate([0,rot,0]) translate([0,0,trans + thickness/2]) union() {
					translate([0,0,abs(thickness)/2]) cube([planesize,planesize,cutheight], center = true);
					translate([0,0,-cutheight - abs(thickness)/2]) cube([planesize,planesize,cutheight], center = true);			
			}	
		}
	}
}

// make a bigger shell for the purposes of CSG...
module bigshell(rot, trans, thickness) {
	union() {
		difference() {
			difference() {
				scale(v = [1 + shellthickness, 1 + shellthickness, 1 + shellthickness]) 
					cylinder(h = coneheight, r1 = conerad, r2 = 0, center = true);
				scale(v = [1 - shellthickness, 1 - shellthickness, 1 - shellthickness]) 
					cylinder(h = coneheight, r1 = conerad, r2 = 0, center = true);
			}
				rotate([0,rot,0]) translate([0,0,trans]) union() {
					translate([0,0,abs(thickness)]) cube([planesize,planesize,cutheight], center = true);
					translate([0,0,-cutheight - abs(thickness)]) cube([planesize,planesize,cutheight], center = true);			
			}	
		}
	}
}

module conic2() {
difference() {
	cylinder(h = 10, r1 = 4, r2 = 0, center = false);
	% translate([7,0,0]) rotate([0,20,0]) cube([10,10,10], center = true);
}
}

module conic1() {
difference() {
	cylinder(h = 10, r1 = 4, r2 = 0, center = false);
	% translate([-7,0,0]) cube([10,10,10], center = true);
}
}