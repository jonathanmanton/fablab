xnum = 3;
ynum = 5;
diameter = 10;
model = "Cuboctahedron.stl";
spacing = 0.1;

shape_array(xnum,ynum,diameter,model);

module shape_array(numx, numy, size, filename) {
for ( x = [1 : numx] ) {
	for (y = [1 : numy]) {
		translate([(x - 1) * size * (1 + spacing), (y - 1) * size * (1 + spacing), 0]) one_shape(size,filename);
	}
}
}

module one_shape(size,filename) {
scale([size/2, size/2, size/2]) import(filename);
}
