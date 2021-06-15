/*
 *
 * t2-1.pov
 * Friday, 4/18/1997.
 *
 */

#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"

#declare SmallBallRadius  = 1
#declare LargeBallRadius  = 1.6
#declare MajorOrbitRadius = 3.2


camera 
   {
   location  <1,    1.6,  -10>
   direction <0.0,  0.0,  1.2>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    .13,   0>
   }

plane
   {
   y, -6
   texture 
      {
      T_Stone13
      pigment {quick_color Gray30} 
      }
   }

light_source {<-71, 70, -90> color White}
light_source {<20, 30, -900> color White}

//sphere
//   {
//   <0.0, 0.0, 0.0>, 1 inverse
//   texture 
//      {
//      pigment
//         {
//         gradient y
//         colour_map 
//            {
//            [0  color .2 green .4  blue .95]
//            [.5 color .8 green .24 blue .88]
//            [1  color .2 green .24 blue .4]
//            }
//         }
//      finish 
//         {
//         ambient 0.6
//         diffuse 0.0
//         }
//      }
//   scale <2000, 2000, 2000>
//   }


#declare ballfinish = finish
   {
   metallic
   phong 1
   phong_size 200
   reflection 0.25
   }

#declare Bamds4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Cas4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Ces4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Estim4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }



#declare Exped4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Las4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Pes4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Sitma4cp = sphere
   {
   0 SmallBallRadius
   texture {pigment {color White}}
   }

#declare Trnsp4cp = sphere
   {
   0 LargeBallRadius
   texture {pigment {color White}}
   }

#declare CornerPos = MajorOrbitRadius * sin (pi/4)

object {Trnsp4cp  translate <0,  0, 0>}
object {Estim4cp  translate <-MajorOrbitRadius, 0, 0>}
object {Pes4cp    translate <-CornerPos, CornerPos, 0>}
object {Las4cp    translate <0,  MajorOrbitRadius, 0>}
object {Cas4cp    translate <CornerPos,  CornerPos, 0>}
object {Exped4cp  translate <MajorOrbitRadius,  0, 0>}
object {Ces4cp    translate <CornerPos, -CornerPos, 0>}
object {Bamds4cp  translate <0, -MajorOrbitRadius, 0>}
object {Sitma4cp  translate <-CornerPos,-CornerPos, 0>}

#declare MinorOrbitRadius = MajorOrbitRadius * pi/8
#declare my               = MajorOrbitRadius * sin (clock * 2 * pi)
#declare mx               = MajorOrbitRadius * cos (clock * 2 * pi)
#declare mz               = MinorOrbitRadius * cos (clock * 8 * pi)

#declare Marble = sphere
   {
   0, (MinorOrbitRadius - SmallBallRadius) * .75
   texture {MathR}
   }

object {Marble translate <mx, my, -mz>}
object {Marble translate <-mx, -my, mz>}



