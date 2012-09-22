// Spirograph generator p. 1
// http://www.thingiverse.com/thing:2029
// made by wayland
// based on the gear script by Catarina Mota
// http://www.thingiverse.com/thing:1336


// Parameters:
shape = 1; // 1 for a square or rectangle, 2 for a circle

spiroDepth = 5; // thickness of the spirograph rectangle
spiroHeight = 90; // height of the spirograph rectangle
spiroWidth = 90; // width of the spirograph rectangle

outsideDiam = 90; // diameter of outside spirograph circle,
			   // (only if shape = 2)

pitchDiam = 72; //pitch diameter
teethNum = 48; //number of teeth (int)
addendum = 3/2; 
dedendum = 3/2;
toothWidth = 2;

/*
Some notes on compatibility

You want the diametral pitch (not to be confused with pitch diameter, the nominal diameter for a gear) of the rotor (gear) and the stator (frame thing) to be equal. Diametral pitch is number of teeth over pitch diameter. For example, in the defaults, the number of teeth of the stator is 48 and the pitch diameter is 72. The diametral pitch is 48 / 72 = 2 / 3. Coincidentally (?), the number of teeth of the rotor is 22 and the pitch diameter is 33, giving a diametral pitch of 2 / 3, so these will fit.

In a perfect universe, gears with the same teeth width will mesh, but I'm guessing printer irregularities and shrinking plastic make them too tight. You might want to make the tooth widths of the rotor a little smaller than that of the stator (as in the defaults). 

Also, as aron pointed out, if the diameter (or teeth number - the are/should be proportional) of the rotor is half that of he stator, you get an oval. There's a lot of math going on here with greatest common factors and whatnot. Try experimenting with different proportions and prime numbers to get different patterns.
*/

// Unless you're tinkering, 
// nothing past here should be changed
//----------------------

involute=0;
centerShape=1;
shaftDiam=0;
gearHeight = 10 + spiroDepth; //gear depth

//----------------------
if (shape == 1) {
	difference(){
		cube([spiroWidth, spiroHeight, spiroDepth], center = true);
		translate([0, 0, -10]) gear();
}
}
if (shape == 2) {
	difference(){
		cylinder(r = outsideDiam/2, h= spiroDepth, $fn=100);
		translate([0, 0, 0]) gear();
}
}

//----------------------

//TOOTH
module tooth(heightGear, diamPitch) {

	toothHeight=addendum+dedendum*2;

	if (involute == 1) {
		translate([0,toothHeight/2,0]) involute(heightGear, toothHeight);
	}

	if (involute == 0) {
		translate([0,toothHeight/2,0]) box(toothWidth,toothHeight,heightGear);
	}

}



//SPUR
module spur(numTeeth, diamPitch, heightGear) {
	rootRad=diamPitch/2-dedendum;
	for (i = [1:numTeeth]) {
		translate([sin(360*i/numTeeth)*(rootRad-dedendum), cos(360*i/numTeeth)*(rootRad-dedendum), 0 ]){
			rotate([0,0,-360*i/numTeeth]) tooth(heightGear, diamPitch);
		}
	}
}


//SOLID
module solid(heightGear, diamPitch) {
	rootRad=diamPitch/2-dedendum;
	cylinder(heightGear, rootRad, rootRad);
}


//GEAR
module gear(){
	difference () {
		union() {
			translate([0,0,gearHeight/2]) spur(teethNum, pitchDiam, gearHeight);
			if (centerShape==1) solid(gearHeight, pitchDiam);	
		}
	}
}

//----------------------
 

module box(xBox, yBox, zBox) {
	scale ([xBox, yBox, zBox]) cube(1, true);
}


