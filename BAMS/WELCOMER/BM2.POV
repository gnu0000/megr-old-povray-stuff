#include "colors.inc"    
#include "shapes.inc"    
#include "textures.inc"  
#include "stones.inc"
#include "chars.inc"

light_source {<-41, 7, -90> color White}

#declare BAMS = union
   {
   object {char_B translate <0,  0, 0>} 
   object {char_A translate <5,  0, 0>} 
   object {char_M translate <10, 0, 0>} 
   object {char_S translate <15, 0, 0>} 
   translate <2.5, 0, 0>
   translate <-10, -2.5, 0>
   scale <1, 1, .1>
   texture
      {
      pigment {color White}
      finish  {ambient 1}
      }
   }


camera
   {
   location  <0, 0, -15>
   direction <0, 0, .8>
   look_at   <0, 0, 0>
   }

object
   {
   BAMS
   rotate <50, 0, 0>
   translate <0, -2, 0>
   }
