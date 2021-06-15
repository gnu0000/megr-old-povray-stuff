#include "colors.inc"
#include "skies.inc"
#include "textures.inc"
#include "glass.inc"

camera 
   {
   location  <0, 0, 1>
   direction <0, 0, 1.2>
   look_at   <0, 0, 0>
   }

box
   {
   <-.65, -.5, 0> <.65, .5, .001>
   pigment
      {
      image_map {gif "nagelb.gif" map_type 0}
      scale <4/3, 1, 1>
      translate <-.65, -.5, 0>
      }
   finish {ambient 1}
//   normal {ripples 1 phase clock} scale .5
   }


box
   {
   <-10, -.5, -10> <10, 10, 10>
   texture 
      {
      T_Glass1
      normal {ripples 1 phase clock} scale .5
      }
   }
