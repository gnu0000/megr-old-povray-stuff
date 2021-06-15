/*
 *
 * t2-1.pov
 * Friday, 4/18/1997.
 *
 */

#include "colors.inc"  
#include "textures.inc"
#include "stones1.inc"
#include "glass.inc"


sphere
   {
   <0.0, 0.0, 0.0>, 1 inverse
   texture 
      {
      pigment
         {
         gradient y
         colour_map 
            {
            [0  color .2 green .4  blue .95]
            [.5 color .8 green .24 blue .88]
            [1  color .2 green .24 blue .4]
            }
         }
      finish 
         {
         ambient 0.6
         diffuse 0.0
         }
      }
   scale <2000, 2000, 2000>
   }


#declare ballfinish = finish
   {
   metallic
   phong 1
   phong_size 200
   reflection 0.25
   }

#declare Bamds4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Bamds4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <2.3, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Cas4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Cas4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <2.2, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Ces4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Ces4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <1.65, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Estim4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Estim4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <1.8, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Exped4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Exped4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <2, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Las4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Las4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <1.9, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Pes4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Pes4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <2, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Sitma4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Sitma4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <2.6, 1, 1>
         scale <1.4, 1.4, 1.4>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }



#declare Trnsp4cp = sphere
   {
   <0, 0, 0> 2

   texture {pigment {color White}}
   texture 
      {
      pigment 
         { 
         image_map {gif "Trnsp4cp.gif" once} 
         translate <-.5, -.5, 0>
         scale <1, 1, 1>
         scale <1.5, 1.5, 1.5>
         }
      finish {ballfinish}
      }
   scale <.5, .5, .5> 
   }

light_source {<-71, 70, -90> color White}
light_source {<20, 30, -900> color White}


camera 
   {
   location  <1,    3.5,  -10>
   direction <0.0,  0.0,  1.2>
   up        <0.0,  1.0,  0>
   right     <4/3,  0.0,  0>
   look_at   <0,    0,    0>
   }

plane
   {
   y, -6
   texture 
      {
      T_Stone13
      pigment {quick_color Gray30} 
      }
   }

#declare l = 3
#declare r = l * .7071

object {Trnsp4cp  translate <0,  0, 0>}
object {Estim4cp  translate <-l, 0, 0>}
object {Pes4cp    translate <-r, r, 0>}
object {Las4cp    translate <0,  l, 0>}
object {Cas4cp    translate <r,  r, 0>}
object {Exped4cp  translate <l,  0, 0>}
object {Ces4cp    translate <r, -r, 0>}
object {Bamds4cp  translate <0, -l, 0>}
object {Sitma4cp  translate <-r,-r, 0>}

