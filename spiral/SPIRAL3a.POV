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
            [ 0    Clear]
            [.45   Clear]
            [.4501 Gold ]
            [.47   Gold ]
            [.4701 Clear]
            }
         }
      translate <0, 0, clock>
      rotate <45, 30, 10>
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
            [ 0 Clear]
            [.7 Clear]
            [.8 Red*.5]
            [.9 Gold ]
            [ 1 Gold]
            }
         }
      rotate z*clock*180
      scale <1, 1, 1.5>
      }
   }

object {StarrySky1}
