scaling = 4;

* scale([scaling, scaling, scaling]) logo();
scale([scaling, scaling, scaling]) logo_support();

module logo_support() {
	difference() {

		difference() {
			translate([0.01, 0.01, 0.01]) cube([11.98,11.98,9.59]);
			translate([0,4.78,0]) cube([8.4,15,15]);
		}
		logo();
	}
}

module logo() {
	import("/Users/jmanton/Downloads/IGL2-1_rep2.stl");
}