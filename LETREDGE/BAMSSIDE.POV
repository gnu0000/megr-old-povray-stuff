#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {< 15, -4, -13> color White}

camera 
   {
   location  <15,   -4,   -10>
   direction <0.0,  0.0,  1.5>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <2,    0,    0>
   }


#declare BAMS = union
   {
   object {char_B translate <0,  0, 0>} 
   object {char_A translate <5,  0, 0>} 
   object {char_M translate <10, 0, 0>} 
   object {char_S translate <15, 0, 0>} 
   translate <2.5, 0, 0>
   translate <-10, -2.5, 0>
   }


plane
   {z 0
   pigment {Black}
   }

object
   {
   BAMS
   pigment {White}
   translate <0, 0, -1>
   }

object
   {
   BAMS
   pigment {Black}
   scale <1, 1, .0001>
   translate <0, 0, -1.0001>
   }
