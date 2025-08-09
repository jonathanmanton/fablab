xdim = 130;
ydim = 130;
layer_height = 12;
tray_depth = 5;
wall_thickness = 1.2;
corner_radius = 13.5;
xnum = 4;
ynum = 2;

difference() {
	base_plate(xdim, ydim, layer_height, corner_radius);
	translate([0,0,wall_thickness]) 
		difference() {
			generic_pockets(xdim, ydim, xnum, ynum, wall_thickness);
			// center_hole_pockets(xdim, ydim, xnum, wall_thickness, 20);
			cut_pockets(xdim, ydim,wall_thickness); 
		}
}

module cut_pockets(xdim, ydim, wall_thickness) {
		translate([wall_thickness, ydim - corner_radius, -.5 * layer_height]) rotate([0,0,45]) cube([2*corner_radius, corner_radius, 3* layer_height]);
		translate([corner_radius , wall_thickness, -.5 * layer_height]) rotate([0,0,135]) cube([2*corner_radius, corner_radius, 3* layer_height]);
		translate([xdim - wall_thickness, corner_radius, -.5 * layer_height]) rotate([0,0,225]) cube([2*corner_radius, corner_radius, 3* layer_height]);
		translate([xdim - corner_radius, ydim - wall_thickness, -.5 * layer_height]) rotate([0,0,-45]) cube([2*corner_radius, corner_radius, 3* layer_height]);
}

module generic_pockets(xdim, ydim, xnum, ynum, wall_thickness) {
	sizey = (ydim - (ynum + 1) *wall_thickness)/ynum;
	for (i = [1 : ynum]) {
		translate([0, (i - 1) * (sizey + wall_thickness) + wall_thickness,0])
			generic_pocket_row(xdim, xnum, sizey, wall_thickness);
	}
}

// ynum is always 2 with these
module center_hole_pockets(xdim, ydim, xnum, wall_thickness, hole_size) {
	sizey = (ydim - (2 + 2) *wall_thickness - hole_size)/2;
	hole_width = (xdim - 3*wall_thickness)/2;
			
	translate([0, wall_thickness, 0])
			generic_pocket_row(xdim, xnum, sizey, wall_thickness);
	translate([0, sizey + hole_size + 3* wall_thickness,0])
			generic_pocket_row(xdim, xnum, sizey, wall_thickness);
	translate([wall_thickness, sizey + 2*wall_thickness, 0]) center_hole((xdim - 3*wall_thickness)/2, hole_size);
	translate([wall_thickness*2 + hole_width, sizey + 2*wall_thickness, 0]) center_hole(hole_width, hole_size);
}

module center_hole(xdim, ydim) {
	translate([0,0, -.5 * layer_height]) cube([xdim, ydim, 3* layer_height]);
}

module generic_pocket_row(xdim,  xnum, sizey, wall_thickness) {
sizex = (xdim - (xnum + 1) *wall_thickness)/xnum;

for (i = [1 : xnum]) {
	translate([(i - 1) * (sizex + wall_thickness) + wall_thickness,0,0]) cube([sizex, sizey, layer_height * 2]);
	}
}

module base_plate(size_x, size_y, depth, corner_radius) {
	
	translate([0, corner_radius, 0]) 
		cube([size_x, size_y - 2* corner_radius, depth]);
	translate([corner_radius, 0, 0]) 
		cube([size_x - 2*corner_radius, size_y, depth]);
	translate([corner_radius, corner_radius, 0]) 
		cylinder(r = corner_radius, h = depth);
	translate([size_x - corner_radius, corner_radius, 0]) 
		cylinder(r = corner_radius, h = depth);
	translate([size_x - corner_radius, size_y - corner_radius, 0]) 
		cylinder(r = corner_radius, h = depth);
	translate([corner_radius, size_y - corner_radius, 0]) 
		cylinder(r = corner_radius, h = depth);

}