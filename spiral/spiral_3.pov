/*
 *
 * spiral.pov
 * Wednesday, 8/6/1997.
 *
 */
#include "colors.inc"

#declare Sky_Top = 1000
#include "gnu_sky.inc"

camera 
   {
   location  <0, 0, .0001>
   direction <0, 0, 1>
   look_at   <0, 0, 100>
   }

cylinder
   {
   <0, 0, -20> <0, 0, 20> 1 open

   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 4
         color_map
            {
            [ 0    White filter 1]
            [.45   White filter 1]
            [.4501 White ]
            [.55   White ]
            [.5501 White filter 1]
            [ 1    White filter 1]
            }
         }
      translate <0, 0, clock>
      rotate <90, 0, 0>
      scale <1, 1, 10>
      }
   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 2
         color_map
            {
            [ 0 White filter 1]
            [.7 White filter 1]
            [.8 Blue]
            [.9 Red ]
            [ 1 Red]
            }
         }
      rotate z*clock*180
      }
   }

object {StarrySky1}
