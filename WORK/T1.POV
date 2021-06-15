#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera
   {
   location <0, 2, -3>
   look_at <0, 1, 2>
   }

//plane
//   {
//   z,0
//   pigment
//      {
////      image_map {gif "oracle7.gif"}
////      checker color Red color Blue
//      hexagon color Red color Green color Blue
//      }
//   rotate x*90
//   }

plane
   {
   y,0
   pigment
      {
      hexagon color Pink color DarkGreen color Blue
      }
   }

//sphere
//   {
//   <0, 1, 2>, 1
//   
////     pigment {color Yellow}  // Yellow is pre-defined in COLORS.INC
//
////   texture
////      {
//      PinkAlabaster
//      finish
//         {
////         specular   1 
////         roughness  0.0001 
////         reflection 0.5
//
//         ambient 0
//         diffuse 0
//
//         reflection 1
//         }
////      }
//
////   texture
////      {
////      PinkAlabaster
////      }
//
////   texture
////      {
////      pigment
////         {
////         DMFWood1
////         scale 4
////         }
////      finish {Shiny}
////      }
//
////   texture 
////      {
////      pigment {color Yellow}  // Yellow is pre-defined in COLORS.INC
////      normal {bumps 0.4 scale 0.1}
////      finish {phong 1}
////      }
//
////   texture
////      {
////      pigment
////         {
////         wood
////         color_map
////            {
////            [0.0 color DarkTan]
////            [0.9 color DarkBrown]
////            [1.0 color VeryDarkBrown]
////            }
////         turbulence 0.05
////         scale <0.2, 0.3, 1>
////         }
////      finish {phong 1}
////      }
//   }



sphere
   {
   <0, 1, 2>, 1
   
   texture
      {
      finish
         {
//         ambient .3
//         diffuse 0

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

//fog
//   {
//   color Black
//   distance 300
//   }
