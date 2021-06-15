/*
 *
 * spiral.pov
 * Wednesday, 8/6/1997.
 *
 */
#include "colors.inc"

camera 
   {
//   location  <0, 0, .0001>
   location  <0, 0, -3>
   direction <0, 0, .8>
   look_at   <0, 0, 0>
   }

sphere
   {
   <0, 0, 0> 5

//   }
//cylinder
//   {
//   <-1, 0, 0> <1, 0, 0> 1

   texture
      {
      finish
         {
         ambient 1
         }
      pigment
         {
         spiral1 5
         color_map
            {
            [ 0 White]
            [.5 White]
            [.7 Blue]
            [ 1 Red]
            }
         }
      }
   }

//light_source { <-10, 3, -20> color red 1 green 1 blue 1 }

