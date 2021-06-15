#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<-71, 7, -90> color Gray80}
light_source {< 31, 12, -20> color White}

camera 
   {
   location  <10,    3,    -16.4>
   direction <0.0,  0.0,  1.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <10,    4,   0>
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
      object {BAMS scale <1, 8/5, 1> translate <0, 0, 0>}
      object {BAMS scale <1, 8/5, 1> translate <.0001, .0001, .0001>}
      texture {PinkAlabaster}
      }
   box 
      {
      <-1.9, -1.9, .8> <21.9, 9.9, .81>

      texture 
         {
         pigment { Aquamarine }
         normal 
            {
            ripples   .25
            frequency 10
            scale     1
            }
         finish 
            {
            ambient 0.1
            diffuse 0.1
            reflection 0.8
            }
         }
      }


   box  // catch light that passes through the waves
      {
      <-1.9, -1.9, .805> <21.9, 9.9, .81>
      texture {pigment { Aquamarine }}
      }

   translate <1, 5, 0>
   rotate <30, -5, 0>
   }
