// Magnethalter für Velo Bling-Bling
////////////////////////////////////

// $fn=48;

// variables
////////////
magnet_length = 8;
magnet_width = 4;
magnet_thickness = 3;

wanne_length = 12;
wanne_width = 8;
wanne_thickness = 4;

stripe_length = 3;
stripe_width = 1.5;

plate_length = 30;
plate_width = 16;
plate_thickness = 5;


toleranz = 0.2;

// Magnet
	*color( "red" )
		cube([magnet_length, magnet_width, magnet_thickness], center=true);


difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}


translate([0, 0, -5])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -10])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -15])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -20])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -25])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -30])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -35])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -40])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -45])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -50])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

translate([0, 0, -55])
difference() {
	// Wanne
	translate([0, 0, -magnet_thickness/2])
		cube([wanne_length, wanne_width, wanne_thickness], true);
		
	// Magnet
	cube([magnet_length, magnet_width, magnet_thickness], true);

}

// Stripe 1
translate([wanne_length/2-stripe_length/2, wanne_width/2-stripe_width/2, -30])
	cube([3, 1.5, 55], true);

// Stripe 2
translate([-wanne_length/2+stripe_length/2, wanne_width/2-stripe_width/2, -30])
	cube([3, 1.5, 55], true);

// Stripe 3
translate([wanne_length/2-stripe_length/2, -wanne_width/2+stripe_width/2, -30])
	cube([3, 1.5, 55], true);

// Stripe 4
translate([-wanne_length/2+stripe_length/2, -wanne_width/2+stripe_width/2, -30])
	cube([3, 1.5, 55], true);

// Montageplatte
translate([0, 0, -59])
difference() {
	cube([plate_length, plate_width, plate_thickness], true);

   translate([-plate_length/2+4, 0, 0])
		cube([3, plate_width+1, 2], true);

   translate([+plate_length/2-4, 0, 0])
		cube([3, plate_width+1, 2], true);


}