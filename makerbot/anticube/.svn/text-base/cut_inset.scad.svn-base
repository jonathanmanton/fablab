anticube(10);

* difference() {
	top_half_anticube(10);
	anticube_cutout(10, 1, 1);
}

module anticube(radius) {
	rm = radius / 2;   // the original model has radius 2mm
	scale([rm,rm,rm]) import("/Users/jmanton/Dropbox/Anticube-lotsoffaces_repaired_flipped.stl");
}

module top_half_anticube(radius) {
	difference() {
		anticube(radius);	
		translate([-5 * radius,-5 * radius,-10 * radius]) cube([10 * radius,10 *radius,10 * radius]);
	}
} 

module anticube_cutout(radius, inset_depth, inset_width) {
	scaling = 1 - (inset_width/radius);
	difference() {
		scale([scaling, scaling, scaling]) anticube(radius)	;
		translate([-5 * radius,-5 * radius,inset_depth]) cube([10 * radius,10 *radius,10 * radius]);
	}
} 
