// working area is the maximum size of the workpiece
working_area_x = 1200;
working_area_y = 600;
working_area_z = 100;

// table_offset is the amount on each dimension that the table is larger 
// than the working area.  The number is for each side - so the table size is:
//          working area + 2 * table offset 
// in each dimension.
table_offset_x = 200;
table_offset_y = 100;


module gantry()
{
	// temporary for now, how thick the rough idea of the gantry is
	gantry_thickness = 20;

	// This is the z height of the gantry
	gantry_height = 100;

	// this is the distance from the working area the bottom of the gantry
	gantry_clearance = 50;
	

	translate([0,0,working_area_z + gantry_height/2 + gantry_clearance]) 
		cube([gantry_thickness, working_area_y + 2 * table_offset_y, gantry_height], center=true);
}

module table()
{
	table_thickness = 75;
	translate([0, 0, -1 * table_thickness/2])
		cube([working_area_x + 2 * table_offset_x, working_area_y + 2 * table_offset_y, table_thickness], center = true);
}

gantry();
table();

// show the working area
% translate([0, 0, working_area_z/2]) 
	cube([working_area_x, working_area_y, working_area_z], center=true);