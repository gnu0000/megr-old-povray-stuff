#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

#declare pig1 = pigment {image_map {gif "Wall1.gif"}}
#declare pig2 = pigment {image_map {gif "Wall2.gif"}}

default {finish {ambient 1}}

#declare donut = torus {1, 3/8}

camera 
   {
   location <0,  0, -3.5>
   direction <0.0, 0.0, 1.0>
   up  <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
   look_at <0, 0, 0>
   }

#declare knot = union
   {
   object
      {
      donut
      texture 
         {
         pigment {image_map {gif "inside.gif"  map_type 5}}
         }
      rotate <0, 90+clock, 0>
      rotate <90, 0, 0>
      translate <.5, 0, 0>
      }
   object
      {
      donut
      texture 
         {
         pigment {image_map {gif "science.gif"  map_type 5}}
         }
      rotate <0, clock, 0>
      translate <-.5, 0, 0>
      }
   }
   

#declare wall = plane
   {
   z, 0
   texture 
      {
      tiles 
         {
         texture 
            {
            pigment {pig1}
            finish {ambient .43}
            }
         tile2 
         texture 
            {
            pigment {pig2}
            finish {ambient .43}
            translate <-.5, -.5, -.5>
            rotate <0, 0, 90>
            translate < .5,  .5, .5>
            }
         }
      }
   scale <5, 5, 5>
   }


//object {knot rotate <-20, 30, 0> translate <-.15, 0, 0>}
object {
       knot 
       rotate <-20, 0, 0> 
       rotate <0,  clock, 0> 
       }

object {wall rotate y*90  translate  x*10}
object {wall rotate -y*90 translate -x*10}
object {wall rotate x*90  translate  y*10}
object {wall rotate -x*90 translate -y*10}

