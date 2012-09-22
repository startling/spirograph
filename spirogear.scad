// Spirograph generator p. 2
// http://www.thingiverse.com/thing:2029
// made by wayland
// based on the gear script by Catarina Mota
// http://www.thingiverse.com/thing:1336


//Parameters
gearHeight = 3; //gear depth
pitchDiam = 33; //pitch diameter
teethNum = 22; //number of teeth 
addendum = 3/2;
dedendum = 3/2;
toothWidth = 3/2;

//Arrangement Parameters
nocenterhole = 3; // 0 = center hole, 1 = no center hole, 2 =      			   // no first or center hole, ando on
			   // the center hole is boring; it just makes       			   // a circle, anyway. leaving it out gives 	                  // you more space; leaving out the next 
                  // holes gives you even more
littlecirclenumber = 9; //number of circles in spiral
littlecirclediameter = 3; //diameter of circles in spiral
degreedivisor = 400; // make this smaller to make the spiral 
				 // less of a curve and bigger to make it 				 // more spirally


//----------------------



	difference () {
		gear();
		linear_extrude(height = gearHeight*2, center = true)
		for ( i = [nocenterhole:littlecirclenumber])  {
			rotate( i*degreedivisor/littlecirclenumber, [0, 0, 1])
			translate ([i * ((pitchDiam/(5/2))/(littlecirclenumber + 1)), 0, 0])
			circle (r=littlecirclediameter/2, $fn=10);
		}	

	}



//----------------------

//things that break if you change them

involute=0;
centerShape=1;


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


