#include "colors.inc"

camera {location <0, 0, -2>}
plane  
   {
   z,0 
   finish
      {
      ambient 1
      } 
   pigment
      {
      bozo 
      color_map
         {
         [0.0   color Black ]
         [0.1   color Red ]
         [0.2   color Orange ]
         [0.3   color Yellow ]
         [0.4   color Green ]
         [0.5   color Blue ]
         [0.6   color Violet ]
         [0.7   color Brown ]
         [0.8   color Pink ]
         [0.9   color Gold ]
         [1.0   color Silver ]
         }
      scale <1, 1, 1> * 0.3
      }
   }
