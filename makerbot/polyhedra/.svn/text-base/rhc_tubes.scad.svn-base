$fn = 36;
scaling = 1.0;
epsilon = 0.01;

// scale([scaling,scaling,scaling]) support(30,1);
// scale([scaling,scaling,scaling]) minimal_support(30,1);

scale([scaling,scaling,scaling]) main_plus_nozzlecleaner(30,1);


module main(gen_dia, tube_rad) {
	translate([0,0,gen_dia/2 + tube_rad/2 - 2]) rhc();
}

module main_plus_nozzlecleaner(gen_dia, tube_rad) {
	main(gen_dia, tube_rad);
	translate([gen_dia/2, gen_dia/2, 0]) cube([20,10,2]);
}

module support(gen_dia, tube_rad) {
	difference() {
		support_base(gen_dia, tube_rad);
		main(gen_dia,tube_rad);
	}
}

module support_base(gen_dia,tube_rad) {
	tubeheight = gen_dia/2 + tube_rad;
	cylinder(r = tubeheight, h = tubeheight-2);
	difference() {
		translate([0,0,tubeheight-3]) sphere(r = tubeheight);
		translate([0,0,-37]) cube([100,100,100], center=true);
	}
}

module support_minimal(gen_dia,tube_rad) {
	translate([0,0,gen_dia/2 + tube_rad ]) cylinder(r1 = (gen_dia/2 + tube_rad), r2 = (gen_dia/4 + tube_rad), h = gen_dia/3.8);
	translate([0,0,gen_dia/4 - epsilon]) cylinder(r = (gen_dia/2 + tube_rad), h = gen_dia/4 + tube_rad + 2 * epsilon);
	cylinder(r2 = (gen_dia/2 + tube_rad), r1 = gen_dia/3, h = gen_dia/4 );
}

module minimal_support(gen_dia, tube_rad) {
	difference() {
		support_minimal(gen_dia,tube_rad);
		main(gen_dia,tube_rad);
	}
}



module rhc() {

translate([-14.7337,0.,-2.81389])
sphere( r = 1.);

translate([-11.9198,-8.66025,2.81389])
sphere( r = 1.);

translate([-11.9198,8.66025,2.81389])
sphere( r = 1.);

translate([-10.1807,-3.30792,0.])
sphere( r = 1.);

translate([-10.1807,3.30792,0.])
sphere( r = 1.);

translate([-9.10593,0.,-11.9198])
sphere( r = 1.);

translate([-9.10593,0.,-5.62777])
sphere( r = 1.);

translate([-7.36685,-5.35233,5.62777])
sphere( r = 1.);

translate([-7.36685,-5.35233,11.9198])
sphere( r = 1.);

translate([-7.36685,5.35233,5.62777])
sphere( r = 1.);

translate([-7.36685,5.35233,11.9198])
sphere( r = 1.);

translate([-6.29204,-8.66025,0.])
sphere( r = 1.);

translate([-6.29204,8.66025,0.])
sphere( r = 1.);

translate([-5.62777,0.,2.81389])
sphere( r = 1.);

translate([-5.62777,0.,9.10593])
sphere( r = 1.);

translate([-4.55296,-14.0126,-2.81389])
sphere( r = 1.);

translate([-4.55296,-3.30792,-9.10593])
sphere( r = 1.);

translate([-4.55296,-3.30792,-2.81389])
sphere( r = 1.);

translate([-4.55296,3.30792,-9.10593])
sphere( r = 1.);

translate([-4.55296,3.30792,-2.81389])
sphere( r = 1.);

translate([-4.55296,14.0126,-2.81389])
sphere( r = 1.);

translate([-2.81389,-8.66025,-11.9198])
sphere( r = 1.);

translate([-2.81389,-8.66025,-5.62777])
sphere( r = 1.);

translate([-2.81389,8.66025,-11.9198])
sphere( r = 1.);

translate([-2.81389,8.66025,-5.62777])
sphere( r = 1.);

translate([-1.73908,-5.35233,2.81389])
sphere( r = 1.);

translate([-1.73908,-5.35233,9.10593])
sphere( r = 1.);

translate([-1.73908,5.35233,2.81389])
sphere( r = 1.);

translate([-1.73908,5.35233,9.10593])
sphere( r = 1.);

translate([0.,-10.7047,0.])
sphere( r = 1.);

translate([0.,0.,-6.29204])
sphere( r = 1.);

translate([0.,0.,6.29204])
sphere( r = 1.);

translate([0.,10.7047,0.])
sphere( r = 1.);

translate([1.73908,-5.35233,-9.10593])
sphere( r = 1.);

translate([1.73908,-5.35233,-2.81389])
sphere( r = 1.);

translate([1.73908,5.35233,-9.10593])
sphere( r = 1.);

translate([1.73908,5.35233,-2.81389])
sphere( r = 1.);

translate([2.81389,-8.66025,5.62777])
sphere( r = 1.);

translate([2.81389,-8.66025,11.9198])
sphere( r = 1.);

translate([2.81389,8.66025,5.62777])
sphere( r = 1.);

translate([2.81389,8.66025,11.9198])
sphere( r = 1.);

translate([4.55296,-14.0126,2.81389])
sphere( r = 1.);

translate([4.55296,-3.30792,2.81389])
sphere( r = 1.);

translate([4.55296,-3.30792,9.10593])
sphere( r = 1.);

translate([4.55296,3.30792,2.81389])
sphere( r = 1.);

translate([4.55296,3.30792,9.10593])
sphere( r = 1.);

translate([4.55296,14.0126,2.81389])
sphere( r = 1.);

translate([5.62777,0.,-9.10593])
sphere( r = 1.);

translate([5.62777,0.,-2.81389])
sphere( r = 1.);

translate([6.29204,-8.66025,0.])
sphere( r = 1.);

translate([6.29204,8.66025,0.])
sphere( r = 1.);

translate([7.36685,-5.35233,-11.9198])
sphere( r = 1.);

translate([7.36685,-5.35233,-5.62777])
sphere( r = 1.);

translate([7.36685,5.35233,-11.9198])
sphere( r = 1.);

translate([7.36685,5.35233,-5.62777])
sphere( r = 1.);

translate([9.10593,0.,5.62777])
sphere( r = 1.);

translate([9.10593,0.,11.9198])
sphere( r = 1.);

translate([10.1807,-3.30792,0.])
sphere( r = 1.);

translate([10.1807,3.30792,0.])
sphere( r = 1.);

translate([11.9198,-8.66025,-2.81389])
sphere( r = 1.);

translate([11.9198,8.66025,-2.81389])
sphere( r = 1.);

translate([14.7337,0.,2.81389])
sphere( r = 1.);

translate([-14.7337,0.,-2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-14.7337,0.,-2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-14.7337,0.,-2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-11.9198,-8.66025,2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-11.9198,-8.66025,2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-11.9198,-8.66025,2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-11.9198,8.66025,2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-11.9198,8.66025,2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-11.9198,8.66025,2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-10.1807,-3.30792,0.])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-10.1807,-3.30792,0.])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-10.1807,3.30792,0.])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-10.1807,3.30792,0.])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-9.10593,0.,-11.9198])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-9.10593,0.,-11.9198])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-9.10593,0.,-11.9198])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-9.10593,0.,-5.62777])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-9.10593,0.,-5.62777])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,-5.35233,5.62777])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,-5.35233,5.62777])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,-5.35233,5.62777])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,-5.35233,11.9198])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,-5.35233,11.9198])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,5.35233,5.62777])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,5.35233,5.62777])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,5.35233,5.62777])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,5.35233,11.9198])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-7.36685,5.35233,11.9198])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-6.29204,-8.66025,0.])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-6.29204,-8.66025,0.])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-6.29204,-8.66025,0.])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-6.29204,8.66025,0.])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-6.29204,8.66025,0.])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-6.29204,8.66025,0.])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-5.62777,0.,2.81389])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-5.62777,0.,9.10593])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,-14.0126,-2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,-14.0126,-2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,-3.30792,-9.10593])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,-3.30792,-9.10593])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,-3.30792,-9.10593])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,-3.30792,-2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,3.30792,-9.10593])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,3.30792,-9.10593])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,3.30792,-9.10593])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,3.30792,-2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,14.0126,-2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-4.55296,14.0126,-2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-2.81389,-8.66025,-11.9198])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-2.81389,-8.66025,-11.9198])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-2.81389,-8.66025,-5.62777])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-2.81389,8.66025,-11.9198])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-2.81389,8.66025,-11.9198])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-2.81389,8.66025,-5.62777])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,-5.35233,2.81389])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,-5.35233,2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,-5.35233,2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,-5.35233,9.10593])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,-5.35233,9.10593])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,5.35233,2.81389])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,5.35233,2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,5.35233,2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,5.35233,9.10593])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([-1.73908,5.35233,9.10593])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,-10.7047,0.])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,-10.7047,0.])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,0.,-6.29204])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,0.,-6.29204])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,0.,-6.29204])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,0.,6.29204])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,0.,6.29204])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,10.7047,0.])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([0.,10.7047,0.])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,-5.35233,-9.10593])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,-5.35233,-9.10593])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,-5.35233,-2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,-5.35233,-2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,5.35233,-9.10593])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,5.35233,-9.10593])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,5.35233,-2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([1.73908,5.35233,-2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,-8.66025,5.62777])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,-8.66025,5.62777])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,-8.66025,5.62777])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,-8.66025,11.9198])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,8.66025,5.62777])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,8.66025,5.62777])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,8.66025,5.62777])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([2.81389,8.66025,11.9198])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,-14.0126,2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,-3.30792,2.81389])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,-3.30792,2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,-3.30792,2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,-3.30792,2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,-3.30792,9.10593])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,3.30792,2.81389])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,3.30792,2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,3.30792,2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,3.30792,2.81389])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,3.30792,9.10593])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([4.55296,14.0126,2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-9.10593])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-9.10593])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-9.10593])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-2.81389])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-2.81389])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-2.81389])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([5.62777,0.,-2.81389])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([6.29204,-8.66025,0.])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([6.29204,8.66025,0.])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([7.36685,-5.35233,-11.9198])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([7.36685,-5.35233,-5.62777])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([7.36685,5.35233,-11.9198])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([7.36685,5.35233,-5.62777])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([9.10593,0.,5.62777])
rotate( a = 0.,v = [0.,0.,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([9.10593,0.,5.62777])
rotate( a = 116.565,v = [0.,5.62777,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([10.1807,-3.30792,0.])
rotate( a = 116.565,v = [5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([10.1807,-3.30792,0.])
rotate( a = 63.4349,v = [-3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([10.1807,3.30792,0.])
rotate( a = 116.565,v = [-5.35233,1.73908,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);

translate([10.1807,3.30792,0.])
rotate( a = 63.4349,v = [3.30792,4.55296,0.])
translate([0, 0, 3.14602,])
cylinder(center = true, r = 1.,h = 6.29204);
}