#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {< 15, -4, -13> color White}

camera 
   {
   location  <25,   -4,   -11>
   direction <0.0,  0.0,  1.5>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <8,    0,    0>
   }


#declare BAMS = union
   {
   object {char_H translate <0,  0, 0>} 
   object {char_I translate <5,  0, 0>} 
   object {char_G translate <10, 0, 0>} 
   object {char_H translate <15, 0, 0>} 
   object {char_E translate <20, 0, 0>} 
   object {char_S translate <25, 0, 0>} 
   object {char_T translate <30, 0, 0>} 
   translate <2.5, 0, 0>
   translate <-17.5, -2.5, 0>
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
