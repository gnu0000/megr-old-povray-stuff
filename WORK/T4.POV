#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "chars.inc"


light_source { <2, 4, -3> color White }

camera
   {
   location <12, 2, -14>
   look_at <12, 1,  0>
   }

plane
   {
   y,0
   pigment
      {
      hexagon color Pink color DarkGreen color Blue
      }
   }



#declare tex = 
   texture
      {
      PinkAlabaster
//      finish
//         {
//         specular   1 
//         roughness  0.0001 
//         reflection 0.5
//         }
//      color Red
      }
#declare siz = <.5, .8, .5>

#declare infotech =
   union
      {
      object {char_I texture {tex} translate x * 6.5  }
      object {char_N texture {tex} translate x * 10   }
      object {char_F texture {tex} translate x * 15   }
      object {char_O texture {tex} translate x * 19.5   }
      object {char_T texture {tex} translate x * 24   }
      object {char_E texture {tex} translate x * 29   }
      object {char_C texture {tex} translate x * 34   }
      object {char_H texture {tex} translate x * 39   }
      }                                                  

object
   {
   infotech
   scale siz
   rotate <1, 0, 0>
   }
