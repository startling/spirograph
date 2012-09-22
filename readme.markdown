# Spirograph!

This was originally posted in Thingiverse on March 20nd, 2010. It was
featured on the 22nd and, since then, Thingiverse has added some
controversial things to their Terms of Service. This took a lot of
work and, while it was fun, I had a lot to learn about software
development. Namely, I didn't use any version control. It's written
for [OpenSCAD](http://www.openscad.org/).

This code is derivative of Thingiverse user "catarina"'s [OpenSCAD
Spur Gears][], which is included here (`spur_gears.scad`) for
posterity. Her code was licensed under the [Creative Commons
Attribution-ShareAlike License][CC-BY-SA]; so is this code and this
text.

[OpenSCAD]: http://www.openscad.org/
[OpenSCAD Spur Gears]: http://www.thingiverse.com/thing:1336
[CC-BY-SA]: http://creativecommons.org/licenses/by-sa/3.0/

This code hasn't been touched. I don't even know whether this code
still even works with OpenSCAD, to be honest. Reproduced below are the
original instructions and description.

## Manifest

* `readme.markdown`: This explanatory file.
* `smallgear.stl`: A smaller rotor gear for the spirograph.
* `spirogear.stl`: A larger rotor gear for the spirograph.
* `spirogear.scad`: The parametric source code for both the larger and
   smaller gears.
* `spirograph.stl`: A rectangular stator for the frame of the
  spirograph.
* `spirographring.stl`: A circular stator for the frame of the
  spirograph.
* `spur_gears.scad`: Catarina's original parametric spur gear code,
  whence `spirogear.scad` and `spirograph.scad` are derived.

## Original Description

A spirograph! for a 3D printer.

I used Catarina's Spur Gear Script for a lot of this, then tore out
the most interesting parts and put in my own. Thanks/sorry!

Included are OpenSCAD files so you can change pretty much
anything. OpenSCAD is so cool.

If you make one I would love to see it! My 3D printer is unfortunately
not done yet. 

I couldn't make the holes on the gear evenly spaced; they get farther
and farther apart from each other, like a curve. It would be great if
someone could show me how to fix this. Also, I'm not entirely sure the
holes are big enough, but they should be pretty roomy. If not, tell me
and edit the OpenSCAD file!

Oh, I also put an .stl of a weird little gear that I made with
Catarina's script in. It'll make a design though!

added: option to make the stator a ring instead of a square, but don't
use it yet. There's a weird half solid thing filling a couple of the
teeth that i figured was rendering weirdness, but thingiverse is
rendering it like that too. Any ideas? edit - it appears that the
rendering weirdness is a thin sheet - you might be able to cut it
off. Still, I don't know if it will work. caveat maker.

added: aron says the fit is too tight, so I edited the defaults on the
.scad and changed the .stl. Also, before, the number of teeth on the
spirograph was twice the number of teeth on the gear, so it made an
oval. Fixed that too. Thanks aron!

added: changed the addenda and dedenda for a (hopefully) better
fit. No big deal, though.

## Instructions

Print the first part. Print the second part. Place pen in hole. Rotate
gear with pen in it. Have hypotrochoidal fun!

Some notes on making compatible rotors (gears) and stators (frames):

You want the diametral pitch (not to be confused with pitch diameter,
the nominal diameter for a gear) of the rotor and the stator to be
equal. Diametral pitch is number of teeth over pitch diameter. For
example, in the defaults for the openSCAD script, the number of teeth
of the stator is 48 and the pitch diameter is 72. The diametral pitch
is 48 / 72 = 2 / 3. Coincidentally (?), the number of teeth of the
rotor is 22 and the pitch diameter is 33, giving a diametral pitch of
2 / 3, so these will fit.

In a perfect universe, gears with the same teeth width will mesh, but
I'm guessing printer irregularities and shrinking plastic make them
too tight. You might want to make the tooth widths of the rotor a
little smaller than that of the stator. 

Also, as aron pointed out, if the diameter (or teeth number - the
are/should be proportional) of the rotor is half that of he stator,
you get an oval. There's a lot of math going on here with greatest
common factors and whatnot. Try experimenting with different
proportions and prime numbers to get different patterns.

## Required Tools

* 3D Printer.
