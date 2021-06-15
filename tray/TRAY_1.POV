#include "colors.inc"
#include "skies.inc"
#include "textures.inc"
#include "glass.inc"

light_source { <-10, 30, -20> color red 1 green 1 blue 1 }

box {<0, 0, 1.1> < .2, .2, 1.3> texture {MathG} rotate y*10}
box {<1, 0, 1.1> <1.2, .2, 1.3> texture {MathY} rotate y*10}
box {<1, 0, 0.1> <1.2, .2, 0.3> texture {MathR} rotate y*10}

camera 
   {
//   location  <.3, .7, -.5>
   location  <.3, 1.7, -.5>
   direction <0, 0, 1.5>
   look_at   <.5, .2, .5>
   }

intersection
   {
   box {<0, 0, 0> <1, .4, 1>}
   box {<.1, .1, .1> <.9, .5, .9> inverse}

   texture {T_Glass1}
   }

intersection
   {
   plane { y, .37}
   box {<.1, .1, .1> <.9, .5, .9>}

   texture {T_Glass1 finish {ior 1.21} normal {ripples 1 scale .05}}
   }

box
   {
   <.1, .1, .1> <.9, .10001, .9>
   pigment
      {
      image_map {gif "nagelb.gif" map_type 0}
      scale <4/3, 1, 1>
      translate -x*.2
      rotate x*90
      }
   }

plane { y, 0 pigment { color red 0.3 green 0.75 blue 0.5} }

sky_sphere { S_Cloud1 }


