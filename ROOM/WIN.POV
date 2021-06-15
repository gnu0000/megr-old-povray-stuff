#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

light_source {<-500, 2000, -500> color Yellow}
light_source {<-5, 1, -10> color White}

camera 
   {
   location  <0,   0,  -2>
   direction <0,   0,  1>
   up        <0,   1,  0>
   right     <4/3, 0,  0>
   look_at   <0,   0,  0>
   }



#declare Angle = 70
#declare pane = difference
   {
   box 
      {
      <0, 0, 0> <1, 4/3, .06>

      translate <0, 0, -.045>
      }

   plane {y  0 rotate <Angle, 0, 0>}
   plane {-y 0 rotate <-Angle, 0, 0> translate <0, 4/3, 0>}

   plane {x  0 rotate <0, -Angle, 0> }
   plane {-x 0 rotate <0, Angle, 0> translate <1, 0, 0>}

//   texture {Glass3}
   texture {MathR}
   }


object
   {
   pane
   rotate <0, 0, 0>
   }

