#include "colors.inc"           // Standard colors library
//#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<-71, 7, -90> color Gray80}
light_source {< 31, 12, -20> color White}

camera 
   {
   location  <0,    0,   -70>
   direction <0.0,  0.0,  4.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    0,    0>
   }


#declare BAMS = union
   {
   object {char_B translate <0,  0, 0>} 
   object {char_A translate <5,  0, 0>} 
   object {char_M translate <10, 0, 0>} 
   object {char_S translate <15, 0, 0>} 
   translate <2.5, 0, 0>
   }

union
   {
   difference
      {
      box {<-2, -2, .1> <22, 10, 3>}
      object {BAMS scale <1, 8/5, .2> translate <0, 0, 0>}
      texture {PinkAlabaster}
      }

   box
      {
      <-1.9, -1.9, .101> <21.9, 9.9, .1011>
      texture 
         {
//         pigment { LightBlue }
         pigment { CadetBlue }
         }
      finish
         {
         ambient .95
         }
      }
   translate <-10, -4, 0>
   scale <.8, 1, 1>
   }

