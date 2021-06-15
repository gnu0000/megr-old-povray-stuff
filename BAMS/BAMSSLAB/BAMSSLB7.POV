#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<-71,   7, -90> color White}
light_source {< 31,  12, -20> color White}
light_source {< 31, -20, -50> color White}
light_source {<-31, -20, -50> color White}

camera 
   {
   location  <0,    3,    -25>
   direction <0.0,  0.0,  1.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    0,   0>
   }

#declare r = 12.7324

#declare BAMS = union
   {
   object {char_B scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 0, 0>} 
   object {char_A scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 1, 0>} 
   object {char_M scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 2, 0>} 
   object {char_S scale <1, 1, 9> translate <0,  0, -r-3> rotate <0, -22.5 * 3, 0>} 
   rotate <0, 22.8 * 1.5, 0>      
   translate <0, -2, 0>
   }

#declare BAMS2 = union
   {
   object {BAMS scale <1, 8/5, 1> translate <0, 0, 0>}
   object {BAMS scale <1, 8/5, 1> translate <.0001, .0001, .0001>}
   }

intersection
   {
   object {BAMS2}
   sphere {<0, 0, 0> r+0.5}
   sphere {<0, 0, 0> r-0.5 inverse}
   pigment
      {
      image_map {gif "fract003.gif"}
      scale <20, 10, 1>
      translate <-10, -5, 0>
      }
   bounded_by { box {<-10, -4.6, -r-1> <10, 4.6, 0>}}
   }

