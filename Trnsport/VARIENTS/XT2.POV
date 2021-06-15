
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

#declare T_Tex = texture
   {
   pigment { Wheat }
   finish  { reflection .25 specular 1 }
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

#declare Transport_Logo2 = union
   {
   object {L_Inside}
   object {L_Center texture {LO_Tex}}
   object {L_Wing rotate <0, 0, 0>   texture {LO_Tex}}
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
//   location  <-.4, -4, -28.0>
//   direction <0.0, 0.0, 2.8>
   location  <-.4, -4, -28.0>
   direction <0.0, 0.0, 1.8>
   up        <0.0, 1.0, 0>
   right     <4/3, 0.0, 0>
//   look_at   <0,   0,   0>
//   look_at   <.25,   -3.5,   0>
   look_at   <.25,   -2.5,   0>
   }

//light_source { <1, 25, -50.0> colour White }
//light_source { <50, 80, -20.0> colour White }
//light_source { <-50, 15, -10.0> colour White }

light_source 
   { 
   <-5, -5, -15.0> colour White 
   area_light <4.5 0 0> <0 4.5 0> 10 10
   adaptive 1 
   jitter
   }

//light_source { <-8, -0, -150.0> colour White }


text 
   { 
   ttf "c:\win\fonts\gothicb.ttf" "Trns" .3, 0
   texture {T_Tex}
   scale <4, 6, 4>
   translate <-7.7, -8, 0>
   }

text 
   { 
   ttf "c:\win\fonts\gothicb.ttf" "port" .3, 0
   texture {T_Tex}
   scale <4, 6, 4>
   translate <1, -8, 0>
   }


text
   {
   ttf "c:\win\fonts\arial.ttf" "AASHTO" .3, 0
   texture {T_Tex}
   scale <.9, .9, .9>
   translate <-5.8, -4.4, 0>
   }

text
   {
   ttf "c:\win\fonts\arial.ttf" "Transportation Software              Management Solution" .3, 0
   texture {T_Tex}
   scale <.67, .7, .7>
   translate <-8, -9, 0>
   }

object {Transport_Logo}

object {Transport_Logo2 scale <.085, .085, .085> translate <0, -6.6, 0>}


