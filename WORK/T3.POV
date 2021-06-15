#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera
   {
   location <0, 2, -3>
   look_at <0, 1, 2>
   }


height_field 
   {
   gif "t2.gif"
   pigment
      {
      gradient y
      color_map
         {
         [0.0  color Red   ]
         [0.33 color Green ]
         [0.66 color Blue  ]
         [1.0  color Red   ]
         }
      }
   smooth
   scale     <20, 2, 20>
   translate <-10, -1, -10>
   }


plane
   {
   y,-2
   pigment
      {
      color Red
      }
   }

sphere
   {
   <0, 1, 2>, 1
   
   texture
      {
      finish
         {
         specular   1 
         roughness  0.0001 
         reflection 0.8
         }
      pigment
         {
         color green .7
         }
      }

   }



light_source
   {
   <2, 4, -3> color White
   }

