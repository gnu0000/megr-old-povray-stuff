#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<0, 0, -151> color White}

camera 
   {
   location  <0,    0,   -130>
   direction <0.0,  0.0,  10.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    0,   0>
   }


#declare BAMS = union
   {
   object {char_E translate <0,  0, 0>} 
   object {char_B translate <5,  0, 0>} 
   object {char_S translate <10, 0, 0>} 
   translate <2.5, 0, 0>
   bounded_by {box {<-.001, -.001, -.001> <15.001, 5.001, 1.001>}}
   translate <-7.5, -2.5, 0>
   }


#declare IT = union
   {
   plane {z 0 pigment {Black}}

   object 
      {
      BAMS
      texture
         {
         pigment {White}
         ambient .25
         }
      translate <0, 0, -1>
      }
   object 
      {
      BAMS
      pigment {Black}
      scale <1, 1, .0001>
      translate <0, 0, -1.001>
      }
   }
   

object
   {
   IT
   rotate <10, 12, 0>
   }
