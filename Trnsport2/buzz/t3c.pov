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

#declare CornerPos        = MajorOrbitRadius * sin (pi/4)

#declare MinorOrbitRadius = MajorOrbitRadius * pi/8
#declare MarbleYPos       = MajorOrbitRadius * sin (clock * 2 * pi)
#declare MarbleXPos       = MajorOrbitRadius * cos (clock * 2 * pi)
#declare MarbleZPos       = MinorOrbitRadius * cos (clock * 8 * pi)


/***************************************************************************/
/***************************************************************************/

light_source {<-71, 70, -90> color White}
light_source {<20, 30, -900> color White}

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

sphere
   {
   <0.0, 0.0, 0.0>, 1 inverse
   texture
      {
      pigment
         {
         gradient y
         colour_map
            {
            [0  color .2 green .4  blue .95]
            [.5 color .8 green .24 blue .88]
            [1  color .2 green .24 blue .4]
            }
         }
      finish
         {
         ambient 0.6
         diffuse 0.0
         }
      }
   scale <2000, 2000, 2000>
   }


/***************************************************************************/
/***************************************************************************/

#declare ballfinish = finish
   {
   metallic
   phong 1
   phong_size 200
   reflection 0.25
   }

#declare Bamds4cp =
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Bamds4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2.3, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Cas4cp =
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Cas4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2.2, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Ces4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Ces4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <1.65, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Estim4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Estim4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <1.8, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Exped4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Exped4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Las4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Las4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <1.9, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Pes4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Pes4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2, 1, 1>
         scale 1.5
         }
      finish {ballfinish}
      }

#declare Sitma4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Sitma4cp.gif" once}
         translate <-.5, -.5, 0>
         scale <2.6, 1, 1>
         scale 1.4
         }
      finish {ballfinish}
      }

#declare Trnsp4cp = 
   texture {pigment {color White}}
   texture
      {
      pigment
         {
         image_map {gif "Trnsp4cp.gif" once}
         translate <-.5, -.5, 0>
         scale 2
         }
      finish {ballfinish}
      }

#declare Marble = sphere
   {
   0, (MinorOrbitRadius - SmallBallRadius) * .75
   texture {MathR}
   }

/***************************************************************************/
/***************************************************************************/

sphere {0 LargeBallRadius texture {Trnsp4cp} translate <0,                0,                0>}
sphere {0 SmallBallRadius texture {Estim4cp} translate <-MajorOrbitRadius,0,                0>}
sphere {0 SmallBallRadius texture {Pes4cp  } translate <-CornerPos,       CornerPos,        0>}
sphere {0 SmallBallRadius texture {Las4cp  } translate <0,                MajorOrbitRadius, 0>}
sphere {0 SmallBallRadius texture {Cas4cp  } translate <CornerPos,        CornerPos,        0>}
sphere {0 SmallBallRadius texture {Exped4cp} translate <MajorOrbitRadius, 0,                0>}
sphere {0 SmallBallRadius texture {Ces4cp  } translate <CornerPos,        -CornerPos,       0>}
sphere {0 SmallBallRadius texture {Bamds4cp} translate <0,                -MajorOrbitRadius,0>}
sphere {0 SmallBallRadius texture {Sitma4cp} translate <-CornerPos,       -CornerPos,       0>}

object {Marble translate <MarbleXPos,  MarbleYPos,  -MarbleZPos>}
object {Marble translate <-MarbleXPos, -MarbleYPos, MarbleZPos >}

