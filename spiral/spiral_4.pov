
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
   <0, 0, -20> <0, 0, 25> 1 open

   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 6
         color_map
            {
            [ 0    Clear]
            [.455 Clear ]
            [.46  Gold  ]
            [.465 Clear ]
            [.475 Clear ]
            [.48  Gold  ]
            [.485 Clear ]
            [.495 Clear ]
            [.50  Gold  ]
            [.505 Clear ]
            [.515 Clear ]
            [.52  Gold  ]
            [.525 Clear ]
            [.535 Clear ]
            [.54  Gold  ]
            [.545 Clear ]
            }
         ramp_wave
         }
      translate <0, 0, -clock>
      scale <1, 1, 6>
      }
   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 6
         color_map
            {
            [ 0    Clear]
            [.455 Clear ]
            [.46  Gold  ]
            [.465 Clear ]
            [.475 Clear ]
            [.48  Gold  ]
            [.485 Clear ]
            [.495 Clear ]
            [.50  Gold  ]
            [.505 Clear ]
            [.515 Clear ]
            [.52  Gold  ]
            [.525 Clear ]
            [.535 Clear ]
            [.54  Gold  ]
            [.545 Clear ]
            }
         ramp_wave
         }
      translate <0, 0, -clock>
      scale <1, 1, -6>
      }
   texture
      {
      finish {ambient 1}
      pigment
         {
         spiral1 2
         color_map
            {
            [ 0  Clear]
            [.05 Blue]
            [.1  Red ]
            [.2  Red ]
            [.25 Blue]
            [.3  Clear]
            }
         ramp_wave
         }
      translate <0, 0, -clock>
      }
   }

object {StarrySky1}
