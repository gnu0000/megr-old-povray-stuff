#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<-71, 7, -90> color Gray80}
light_source {< 31, 12, -20> color White}

camera 
   {
   location  <0,    .8,    0>
   direction <0.0,  0.0,  1.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    -5,   20>
   }


plane 
   {
   y 0
   texture
      {
      pigment
         {
         image_map
            {
            tga "bams0.tga"
            }
         rotate <90, 0, 0>
         }
      finish
         {
         ambient .9
         }
      }
   }


plane 
   {
   y 0
   texture
      {
      pigment
         {
         image_map
            {
            tga "bams00.tga" once
            }
         rotate <90, 0, 0>
         }
      finish
         {
         ambient .9
         }
      }
//   translate <1, .00001, 4>
   translate <-3, .00001, 5>
   }
