// Batteriebefestigung für Velo Bling-Bling
// 1500 mAh, Model SLPB603870H
///////////////////////////////////////////

// $fn=48;

// variables
////////////
bat_length =75;
bat_width = 40;
bat_thickness = 7;


support_thickness = 1.5;
support_width = 7.6;
support_length = bat_width;

wall_thickness = 1.5;
wall_height = bat_thickness + 1;
wall_length = bat_length+2*support_width;
wall_width = bat_width+2*wall_thickness;

mutter = 5.7/2;
schraubenloch = 2.8/2;
schraubenkopf = 5/2;

strip_width = 2;


// Batterie
	*color( [1, 0, 0, 1] )
		cube([bat_length, bat_width, bat_thickness]);

// Unterteil, Batterie-Wanne
difference() {
	union() {
				
		// Boden
		translate([bat_length/2, bat_width/2, -support_thickness/2])
				cube([wall_length, wall_width, support_thickness], true);
		
		// Seitenwand
		translate([bat_length/2, bat_width/2, bat_thickness/2])
			difference() {
				cube([wall_length, wall_width, wall_height], true);
				cube([bat_length, bat_width, wall_height], true);
			}


	}

   // Nute für Speiche
	translate([bat_length/2, bat_width/2, -support_thickness+0.2])	
	   cube([wall_length, 2.5, 0.6], true);

	// 1. Steg
	// 1. Loch
	translate([-support_width/2, 3.5-wall_thickness, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([-support_width/2, 3.5-wall_thickness, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);
	// 2. Loch
	translate([-support_width/2, bat_width/2-3.5, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([-support_width/2, bat_width/2-3.5, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);
	// 3. Loch
	translate([-support_width/2, bat_width/2+3.5, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([-support_width/2, bat_width/2+3.5, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);
	// 4. Loch
	translate([-support_width/2, wall_width-wall_thickness-3.5, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([-support_width/2, wall_width-wall_thickness-3.5, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);

	// 2. Steg
	// 1. Loch
	translate([bat_length+support_width/2, 3.5-wall_thickness, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([bat_length+support_width/2, 3.5-wall_thickness, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);
	// 2. Loch
	translate([bat_length+support_width/2, bat_width/2-3.5, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([bat_length+support_width/2, bat_width/2-3.5, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);
	// 3. Loch
	translate([bat_length+support_width/2, bat_width/2+3.5, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([bat_length+support_width/2, bat_width/2+3.5, wall_height-1.5])
			cylinder(h=3, r=mutter, center=true, $fn=6);
	// 4. Loch
	translate([bat_length+support_width/2, wall_width-wall_thickness-3.5, -support_thickness])
		cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	// Aussparung Mutter
	translate([bat_length+support_width/2, wall_width-wall_thickness-3.5, wall_height-1.5])
		cylinder(h=3, r=mutter, center=true, $fn=6);

   // 1. Loch Speisung
	translate([0, support_length/2, wall_height/2-2])
		rotate([0,90,0])
			cylinder(h=20, r=2/2, center=true, $fn=48);
   // 2. Loch Speisung
	translate([0, support_length/2, wall_height/2+0.7])
		rotate([0,90,0])
			cylinder(h=20, r=2/2, center=true, $fn=48);

}




// Befestigungsstege
translate([0, 0, -4]) {
	difference() {
		union() {
			// 1. Steg
			translate([-support_width, -wall_thickness, -support_thickness])
				cube([support_width, wall_width, 2*support_thickness]);
		
			// 2. Steg
			translate([bat_length, -wall_thickness, -support_thickness])
				cube([support_width, wall_width, 2*support_thickness]);
		}

		// 1. Steg 
		// 1. Loch
		translate([-support_width/2, 3.5-wall_thickness, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
		// 2. Loch
		translate([-support_width/2, bat_width/2-3.5, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
		// 3. Loch
		translate([-support_width/2, bat_width/2+3.5, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
		// 4. Loch
		translate([-support_width/2, wall_width-wall_thickness-3.5, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);

		// 2. Steg
		// 1. Loch
		translate([bat_length+support_width/2, 3.5-wall_thickness, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
		// 2. Loch
		translate([bat_length+support_width/2, bat_width/2-3.5, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
		// 3. Loch
		translate([bat_length+support_width/2, bat_width/2+3.5, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
		// 4. Loch
		translate([bat_length+support_width/2, wall_width-wall_thickness-3.5, -support_thickness])
			cylinder(h=20, r=schraubenloch, center=true, $fn=48);
	
	   // Nute für Speiche
		translate([bat_length/2, bat_width/2, support_thickness-0.2])	
		   cube([wall_length, 2.5, 0.6], true);

	}
}


// Verbinder
union() {
	translate([-support_width, -wall_thickness, -4])
		cube([3, wall_thickness, 5]);
	translate([-support_width, bat_width, -4])
		cube([3, wall_thickness, 5]);
	
	translate([bat_length+support_width-3, -wall_thickness, -4])
		cube([3, wall_thickness, 5]);
	translate([bat_length+support_width-3, bat_width, -4])
		cube([3, wall_thickness, 5]);
}
