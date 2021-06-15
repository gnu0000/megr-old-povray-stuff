#include "colors.inc"           // Standard colors library
#include "shapes.inc"           // Commonly used object shapes
#include "textures.inc"         // LOTS of neat textures.  Lots of NEW textures.
#include "stones.inc"
#include "chars.inc"

light_source {<-71, 7, -90> color Gray80 }
light_source {< 31, 12, -20> color White }
light_source {< 31, -20, -50> color White}

camera 
   {
   location  <0,    3,    -30>
   direction <0.0,  0.0,  1.0>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    4,   0>
   }


#declare BAMS = union
   {
   object {char_B translate <0,  0, 0>} 
   object {char_A translate <5,  0, 0>} 
   object {char_M translate <10, 0, 0>} 
   object {char_S translate <15, 0, 0>} 
   translate <-10, -2, 0>
   }

#declare BAMS2 = union
   {
   object {BAMS scale <1, 8/5, 1> translate <0, 0, 0>}
   object {BAMS scale <1, 8/5, 1> translate <.0001, .0001, .0001>}
   pigment
      {
      image_map {gif "fract009.gif"}
      scale <20, 8/5 * 4, 1>
      translate <-10, -8/5 * 2, 0>
      }
   }


intersection
   {
   object {BAMS2 scale <1, 1, 50> translate <0, 0, -25>}
   sphere {<0, 0, 0>, 15}
   rotate <10, -5, 0>
   }

//union
//   {
//   object {BAMS scale <1, 8/5, 1> translate <0, 0, 0>}
//   object {BAMS scale <1, 8/5, 1> translate <.0001, .0001, .0001>}
//   pigment
//      {
//      image_map {gif "fract009.gif"}
//      scale <24, 12, 1>
//      translate <-2, -2, 0>
//      }
//   translate <1, 1, 0>
//   scale <1, 1.7, 1>
//   rotate <30, -5, 0>
//   }

