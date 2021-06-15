#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

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
      rotate <0, 180, 0>
      rotate <90, 0, 0>
      translate <13/16, 0, 0>
      }
   object
      {
      donut
      texture 
         {
         pigment {image_map {gif "science.gif"  map_type 5}}
         }
      rotate <0, -100, 0>
      }
   translate <-.25, 0, 0>
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
            pigment {image_map {gif "inside.gif"}}
            finish {ambient .33}
            }
         tile2 
         texture 
            {
            pigment {image_map {gif "science.gif"}}
            finish {ambient .33}
            }
         }
      }
   scale <5, 5, 5>
   }


object {knot rotate <-20, 30, 0> translate <-.15, 0, 0>}
object {wall rotate y*90  translate  x*10}
object {wall rotate -y*90 translate -x*10}
object {wall rotate x*90  translate  y*10}
object {wall rotate -x*90 translate -y*10}

