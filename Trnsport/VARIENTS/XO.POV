#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"



#declare L_Rad1 = 3.85
#declare L_Rad2 = 3.45

#declare LO_Tex = texture
   {
   finish 
      {
      specular 0.35 roughness 0.10 // Med Dull
      ambient .15
      }
   pigment {Tan}
   }

#declare LI_Tex = texture
   {
   pigment {color red 0.13 green 0.32 blue 0.36}
   finish 
      {
      specular 0.5 roughness 0.15 // Dull
      ambient .2
      }
   }


#declare L_Wing = intersection
   {
   sphere 
      {<0, 0, 0> L_Rad1}
   sphere 
      {<0, 0, 0> L_Rad2 inverse}
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
//   object 
//      {L_Wing inverse}
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
//         checker color SkyBlue color White 
//         }
//      finish  
//         {
//         specular 1 roughness 0.001
//         reflection .7
//         }
//      scale <2, 2, 2>
//      }
//   }

/********************************************************************/


camera 
   {
   location  <-.4, 4, -28.0>
   direction <0.0, 0.0, 2.8>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
   look_at   <0,   0,   0>
   }

//light_source { <1, 25, -50.0> colour White }
//light_source { <50, 80, -20.0> colour White }
//light_source { <-50, 15, -10.0> colour White }

light_source 
   { 
   <-5, 5, -15.0> colour White 
//   area_light <6 0 0> <0 6 0> 10 10
   adaptive 1 
   jitter
   }

//light_source { <-8, -0, -150.0> colour White }



object {Transport_Logo}
