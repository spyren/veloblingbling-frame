//  @brief
//      Velo Bling-Bling PCB Mounting Frame
//
//  @file
//      frame.scad
//  @author
//      Peter Schmid, peter@spyr.ch
//  @date
//      2016-05-27
//  @remark
//      Language: OpenSCAD
//  @version
//      2.1
//  @copyright
//      Peter Schmid, Zurich Switzerland
//
// 		This work (mechanical frame design) is licensed under a Creative Commons
//		Attribution-ShareAlike 4.0 International Public License. To view a copy
//		of this license, visit http://creativecommons.org/licenses/by-sa/4.0/
//		or send a letter to Creative Commons, 171 Second Street, Suite 300,
//		San Francisco, California, 94105, USA.
////////////////////////////////////////////////////////////////////////////////

// $fn=48;

// variables
////////////
pcb_length = 160;
pcb_width = 30.5;
pcb_thickness = 1.6;

support_thickness = 2;
support_width = 7.6;
support_length = pcb_width;

support_distance_1 = support_width / 2;
support_distance_2 = 66;
support_distance_3 = 156.2;

bar_thickness = 3;

wall_thickness = 1.2;
wall_height = pcb_thickness + 2*support_thickness + 3;
wall_distance = 22;

mutter = 5.7/2;
schraubenloch = 3.2/2;
schraubenkopf = 5/2;

pin_radius = 0.55;
pin_length = pcb_thickness;

toleranz = 0.2;

strip_width = 2;

// libs
use <Write.scad>

//text("Hallo Velo");

// Unterteil
difference() {
	union() {
		// PCB
		*color("red")
			cube([pcb_length, pcb_width, pcb_thickness]);

		// 1. Steg
		translate([0, 0, -support_thickness])
			cube([support_width, support_length, support_thickness]);

		// 2. Steg
		translate([support_distance_2-(support_width/2), 0, -support_thickness])
			cube([support_width, support_length, support_thickness]);

		// 3. Steg
		translate([pcb_length-support_width, 0, -support_thickness])
			cube([support_width, support_length, support_thickness]);

		// Rahmen unten
		translate([pcb_length/2, pcb_width/2, -support_thickness/2])
			difference() {
				cube([pcb_length+4*toleranz, pcb_width+2*toleranz, support_thickness], true);
				cube([pcb_length-2*strip_width, pcb_width-2*strip_width, support_thickness], true);
			}

		// Seitenwand
		translate([pcb_length/2, pcb_width/2, wall_height/2-support_thickness])
			difference() {
				cube([pcb_length+2*(wall_thickness+2*toleranz), pcb_width+(2*wall_thickness+toleranz), wall_height], true);
				translate([wall_distance+wall_thickness, 0, wall_height-2])
				cube([pcb_length+2*(wall_thickness+2*toleranz), pcb_width+2*(wall_thickness+toleranz), wall_height], true);
				cube([pcb_length+4*toleranz, pcb_width+2*toleranz, wall_height], true);
			}


	}
	// 1. Steg, 1. Loch
	translate([support_distance_1, 3.5, 0])
	   cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// 1. Steg, 2. Loch
	translate([support_distance_1, 27, 0])
	   cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// 2. Steg, 1. Loch
	translate([support_distance_2, 3.5, 0])
	   cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// 2. Steg, 2. Loch
	translate([support_distance_2, 27, 0])
	   cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// 3. Steg, 1. Loch
	translate([support_distance_3, 3.5, 0])
	   cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// 3. Steg, 2. Loch
	translate([support_distance_3, 27, 0])
	   cylinder(h=20, r=schraubenloch, center=true, $fn=48);

   // Nute für Speiche
	translate([pcb_length/2, pcb_width/2, -support_thickness+0.2])
	   cube([pcb_length+4, 2.5, 0.6], true);

	// Aussparung USB-Stecker
	translate([15.2, -1, pcb_thickness + 1.3])
	   cube([7.5, 2, 3.3], true);


   // 1. Loch Speisung
	translate([0, 22, wall_height/2-1.8])
		rotate([0,90,0])
			cylinder(h=20, r=2/2, center=true, $fn=48);
   // 2. Loch Speisung
	translate([0, 22, wall_height/2+0.7])
		rotate([0,90,0])
			cylinder(h=20, r=2/2, center=true, $fn=48);

	// Hall-Sensor Mark
	translate([57.5, pcb_width+wall_thickness+toleranz, -5])
	   cube([2, 1, 20], true);


	// Beschriftung vorne
	rotate([90, 0, 0])
		translate([25, -0.5, wall_thickness+toleranz-0.5])
			write("(C) Peter Schmid, velo bling bling.ch",h=4,t=0.5);
	// Beschriftung hinten
  	translate([pcb_length-10, pcb_width+wall_thickness+toleranz-0.5, -0.5])
		rotate([90, 0, 180])
			write("Velo Bling-Bling        Sensor ->",h=4,t=0.5);


}


// Oberteil
translate([0, 0, pcb_thickness+5.5])
	difference() {
		union() {
			// Rahmen oben
			difference() {
				cube([pcb_length, pcb_width, support_thickness]);
				translate([0, strip_width, 0])
					cube([pcb_length-strip_width, pcb_width-2*strip_width, support_thickness]);

			}

			// Lochschutz 1. Steg, 1. Loch
			cube([support_width, 7, support_thickness+2]);
			// Lochschutz 1. Steg, 2. Loch
			translate([0, pcb_width-7, 0])
				cube([support_width, 7, support_thickness+2]);

			// Lochschutz 2. Steg
			translate([support_distance_2-support_width/2, 0, 0]) {
				// 1. Loch
				cube([support_width, 7, support_thickness]);
				// 2. Loch
				translate([0, pcb_width-7, 0])
					cube([support_width, 7, support_thickness]);
			}

			// Lochschutz 3. Steg
			translate([support_distance_3-support_width/2, 0, 0]) {
				// 1. Loch
				cube([support_width, 7, support_thickness]);
				// 2. Loch
				translate([0, pcb_width-7, 0])
					cube([support_width, 7, support_thickness]);
			}

			// Trennwand
			translate([wall_distance-wall_thickness, 0, 0])
				cube([wall_thickness, pcb_width, support_thickness+2]);

			// Trennwand USB
			translate([support_width, 7-wall_thickness, 0])
				cube([wall_distance-support_width, wall_thickness, support_thickness+2]);

			// Trennwand Höhenmeter
			translate([28.2-wall_thickness, 0, 0])
				cube([wall_thickness, 7.6+wall_thickness, support_thickness]);
			translate([35.8-wall_thickness, 0, 0])
				cube([wall_thickness, 7.6+wall_thickness, support_thickness]);
			translate([28.2, 7.6, 0])
				cube([35.8-28.2, wall_thickness, support_thickness]);

			// Pin 1 unten
			translate([40.6, 1.3,  -pin_length/2+0.1])
				cylinder(h=pin_length, r=pin_radius, center=true, $fn=48);
         // Pin 1 oben
			translate([40.6, 29.2, -pin_length/2+0.1])
				cylinder(h=pin_length, r=pin_radius, center=true, $fn=48);

			// Pin 2 unten
			translate([100,    1.3, -pin_length/2+0.1])
				cylinder(h=pin_length, r=pin_radius, center=true, $fn=48);
         // Pin 2 oben
			translate([101.3, 29.2, -pin_length/2+0.1])
				cylinder(h=pin_length, r=pin_radius, center=true, $fn=48);

			// Pin 3 unten
			translate([137.5, 1.3,  -pin_length/2+0.1])
				cylinder(h=pin_length, r=pin_radius, center=true, $fn=48);
         // Pin 3 oben
			translate([137.5, 29.2, -pin_length/2+0.1])
				cylinder(h=pin_length, r=pin_radius, center=true, $fn=48);
		}
		// 1. Steg, 1. Loch
		translate([support_width/2, 3.5, 0])
			cylinder(h=10, r=schraubenkopf, center=true, $fn=48);
		// 1. Steg, 2. Loch
		translate([support_width/2, pcb_width-3.5, 0])
			cylinder(h=10, r=schraubenkopf, center=true, $fn=48);

		// 2. Steg, 1. Loch
		translate([support_distance_2, 3.5, 0])
			cylinder(h=10, r=schraubenkopf, center=true, $fn=48);
		// 2. Steg, 2. Loch
		translate([support_distance_2, pcb_width-3.5, 0])
			cylinder(h=10, r=schraubenkopf, center=true, $fn=48);

		// 3. Steg, 1. Loch
		translate([support_distance_3, 3.5, 0])
			cylinder(h=10, r=schraubenkopf, center=true, $fn=48);
		// 3. Steg, 2. Loch
		translate([support_distance_3, pcb_width-3.5, 0])
			cylinder(h=10, r=schraubenkopf, center=true, $fn=48);

		// Steg bei USB entfernen
		translate([support_width, 0, 0])
			cube([wall_distance-support_width-wall_thickness, strip_width, support_thickness]);

}

// Befestigungsstege (Bars)
translate([0, 0, -3.5]) {
	difference() {
		union() {
			// 1. Steg
			translate([0, 0, -bar_thickness])
				cube([support_width, support_length, bar_thickness]);

			// 2. Steg
			translate([support_distance_2-(support_width/2), 0, -bar_thickness])
				cube([support_width, support_length, bar_thickness]);

			// 3. Steg
			translate([pcb_length-support_width, 0, -bar_thickness])
				cube([support_width, support_length, bar_thickness]);
		}
		// 1. Steg, 1. Loch
		translate([support_width/2, 3.5, 0])
		cylinder(h=10, r=schraubenloch, center=true, $fn=48);
		// Aussparung Mutter
		translate([support_width/2, 3.5, -bar_thickness])
			cylinder(h=3, r=mutter, center=true, $fn=6);
		// 1. Steg, 2. Loch
		translate([support_width/2, pcb_width-3.5, 0])
			cylinder(h=10, r=schraubenloch, center=true, $fn=48);
		// Aussparung Mutter
		translate([support_width/2, pcb_width-3.5, -bar_thickness])
			cylinder(h=3, r=mutter, center=true, $fn=6);


		// 2. Steg, 1. Loch
		translate([support_distance_2, 3.5, 0])
			cylinder(h=10, r=schraubenloch, center=true, $fn=48);
		// Aussparung Mutter
		translate([support_distance_2, 3.5, -bar_thickness+0.5])
			cylinder(h=3, r=mutter, center=true, $fn=6);
		// 2. Steg, 2. Loch
		translate([support_distance_2, pcb_width-3.5, 0])
			cylinder(h=10, r=schraubenloch, center=true, $fn=48);
		// Aussparung Mutter
		translate([support_distance_2, pcb_width-3.5, -bar_thickness+0.5])
			cylinder(h=3, r=mutter, center=true, $fn=6);

		// 3. Steg, 1. Loch
		translate([support_distance_3, 3.5, 0])
			cylinder(h=10, r=schraubenloch, center=true, $fn=48);
		// Aussparung Mutter
		translate([support_distance_3, 3.5, -bar_thickness+0.5])
			cylinder(h=3, r=mutter, center=true, $fn=6);
		// 3. Steg, 2. Loch
		translate([support_distance_3, pcb_width-3.5, 0])
			cylinder(h=10, r=schraubenloch, center=true, $fn=48);
		// Aussparung Mutter
		translate([support_distance_3, pcb_width-3.5, -bar_thickness+0.5])
			cylinder(h=3, r=mutter, center=true, $fn=6);

	   // Nute für Speiche
		translate([pcb_length/2, pcb_width/2, -0.2])
		   cube([pcb_length+4, 2.5, 0.6], true);

	}
}


// Verbinder
union() {
	translate([support_distance_1-1, 7-wall_thickness, -4])
		cube([2, wall_thickness, 12]);
	translate([support_distance_1-1, pcb_width-7, -4])
		cube([2, wall_thickness, 12]);

	translate([support_distance_2-1, 7-wall_thickness, -4])
		cube([2, wall_thickness, 12]);
	translate([support_distance_2-1, pcb_width-7, -4])
		cube([2, wall_thickness, 12]);

	translate([support_distance_3-1, 7-wall_thickness, -4])
		cube([2, wall_thickness, 12]);
	translate([support_distance_3-1, pcb_width-7, -4])
		cube([2, wall_thickness, 12]);
}
