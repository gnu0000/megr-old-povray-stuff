#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"
#include "golds.inc"


// Sky
sphere 
   { <0, 0, 0>, 1
   texture 
      {
      pigment {color White}
      finish {ambient 1 diffuse 0}
      }
   scale 100000
   }


#declare L_Rad1 = 3.85
#declare L_Rad2 = 3.45

#declare LO_Tex = texture
   {
   T_Gold_3C
//
//   finish 
//      {
//
////    specular 0.35 roughness 0.10 // Med Dull
////    specular 1 roughness 0.001  // shiny
//      specular 0.5 roughness  0.15 // Dull
//      metallic 1
//      }
//   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   pigment {color red 0.13 green 0.32 blue 0.36}
   finish 
      {
//    specular 1 roughness 0.001  // shiny
//    specular 0.5 roughness 0.15 // Dull
//    specular 1 roughness 0.001  // shiny

      specular 0.5 roughness 0.15 // Dull
      metallic 1
      ambient .2
      }
   }


#declare L_Wing = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad1}
   box
      {<.325, .325, -L_Rad1> <L_Rad1, L_Rad1, L_Rad1>}
   box
      {<0, 0, -L_Rad1> <1.175, 1.175, L_Rad1> inverse}
   }

#declare L_Center = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad1}
   box
      {<-.525, -.525, -L_Rad1-1> <.525, .525, -L_Rad1+.45>}
   }




#declare L_Inside = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad2}
   object 
      {L_Wing inverse}
   texture {LI_Tex}

   }

#declare Transport_Logo = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex} translate <1.1, .8, 0>}
   object {L_Wing rotate <0, 0, 90>  texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 180> texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 270> texture {LO_Tex}}
   }


/********************************************************************/
//
//plane
//   {
//   y, -L_Rad1
//   texture 
//      {
//      normal  
//         { 
//         quilted 1 
//         }
//      pigment 
//         { 
//         checker color SkyBlue color Wheat
//         }
//      finish  
//         {
//         specular 1 roughness 0.001
//         reflection .4
//         }
//      scale <2, 2, 2>
//      }
//   }
//

#declare TileShape = intersection  
   {
//   sphere {<0, 0, 0> .5}

   box { -1, 1 }  // square tile
   cylinder { -2*x, +2*x, 0.9 } // rounded edges along X axis
   cylinder { -2*z, +2*z, 0.9 } // rounded edges along Z axis
   sphere { 0, 2.0 translate 2.6*y inverse }  // concave top surface
   scale <0.5,0.1,0.5>  // flatten the tile down on Y axis
   }

#declare SlateTex = texture 
   {
//   pigment {color Green}
 
   pigment 
      {
      marble
      turbulence 0.8 rotate 60*y
      color_map 
         {
         [0.10 rgb 0.01]
         [0.12 rgb 0.70]
         [0.15 rgb 0.01]
         [0.20 rgb 0.01]
         [0.30 rgb <0.9,0.7,0.6>]
         [0.50 rgb 0.01]
         }
      scale 0.4
      }
   finish {reflection 0.2}
   }

#declare XStart = -20
#declare XEnd   = 20
#declare ZStart = -20
#declare ZEnd   = 20

#declare ZCount = ZStart
#declare Tile_Set = union
   {
   #while (ZCount <= ZEnd)
      #declare XCount = XStart
      #while (XCount <= XEnd)
         object 
            {
            TileShape
            texture 
               {
               SlateTex
               rotate (XCount+ZCount)*10
               translate <-XCount, 0, -ZCount>  // alter texture per tile
               }
            translate <XCount, 0, ZCount>
            }
      #declare XCount = XCount+1
      #end
   #declare ZCount = ZCount+1
   #end
   }

object {Tile_Set scale <2, 2, 2> translate <0, -L_Rad1, 0>}

/********************************************************************/


camera 
   {
   location  <-1, 8, -21.0>
   direction <0.0, 0.0, 2.5>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   -.1,   0>
   }

//light_source { <1, 25, -50.0> colour White }
//light_source { <50, 80, -20.0> colour White }
//light_source { <-50, 15, -10.0> colour White }

light_source 
   { 
   <-5, 5, -15.0> colour White 
// area_light <4 0 0> <0 4 0> 10 10
   adaptive 1 
   jitter
   }

//light_source { <-8, -0, -150.0> colour White }


object {Transport_Logo}
