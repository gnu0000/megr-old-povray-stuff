#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"


default {finish {ambient 1}}

camera 
   {
   location <0.0,  0.0, -3>
   direction <0.0, 0.0, 1.2>
   up  <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
   look_at <0, 0, 0>
   }

torus
   {
   1, 3/7

   texture
      {
      pigment {image_map {gif "plus.gif"  map_type 5}}
      }
   rotate <0, 180, 0>
   rotate <-35, 0, 0>
   translate <0, .25, 0>
   }
   
