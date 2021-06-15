#include "Shapes.inc"
#include "Alphabet.inc"
#include "Alphobj.inc"
#include "Colors.inc"
#include "Textures.inc"
#include "Stones.inc"



/*--- camera ---*/
camera 
   { 
   location  <-3 2.2 -8>
   direction <0 0 1.3>
   up        <0 1 0>
   right     <1.33 0 0>
   look_at   <0 0 0>
   }


/*--- light ---*/
object {light_source { <21000 68000 -60000> color White }}

object {light_source { <-15 20 -140> color White }}

/*--- sky ---*/
object 
   {
//   quadric { Sphere scale <1 1 1> }
   sphere {<0 0 0> 1}
   texture 
      {
      gradient <0 1 0>
      color_map 
         {
         [0 .05 color Black color Black]
	      [.05 .1 color Black color Violet]
	      [.1 .2 color Violet color CadetBlue]
	      [.2 .3 color CadetBlue color Violet]
	      [.3 .4 color Violet color Black]
	      [.4 1 color Black color Black]
         }
      scale <.1 2 .1>
      translate <0 -2 0>
      ambient .6
      diffuse 0
      turbulence .1
      }
   scale <300000 300000 300000>
   rotate <35 0 0> rotate <0 0 25>
   }





/************************************************************************/


#declare SliceX = intersection
   {
   plane {< 1 0 0> -.05}
   plane {<-1 0 0>  .05}
   }

#declare SliceY = intersection
   {
   plane {<0  1 0> -.05}
   plane {<0 -1 0>  .05}
   }

#declare SliceZ = intersection
   {
   plane {<0 0  1> -.05}
   plane {<0 0 -1>  .05}
   }


#declare Ballx = object
   {
   intersection
      {
      sphere {<0 0 0> 5}
      union 
         {
         intersection {SliceX translate <-4 0 0>}
         intersection {SliceX translate <-3 0 0>}
         intersection {SliceX translate <-2 0 0>}
         intersection {SliceX translate <-1 0 0>}
         intersection {SliceX translate < 0 0 0>}
         intersection {SliceX translate < 1 0 0>}
         intersection {SliceX translate < 2 0 0>}
         intersection {SliceX translate < 3 0 0>}
         intersection {SliceX translate < 4 0 0>}

         intersection {SliceY translate <0 -4 0>}
         intersection {SliceY translate <0 -3 0>}
         intersection {SliceY translate <0 -2 0>}
         intersection {SliceY translate <0 -1 0>}
         intersection {SliceY translate <0  0 0>}
         intersection {SliceY translate <0  1 0>}
         intersection {SliceY translate <0  2 0>}
         intersection {SliceY translate <0  3 0>}
         intersection {SliceY translate <0  4 0>}

         intersection {SliceZ translate <0 0 -4>}
         intersection {SliceZ translate <0 0 -3>}
         intersection {SliceZ translate <0 0 -2>}
         intersection {SliceZ translate <0 0 -1>}
         intersection {SliceZ translate <0 0  0>}
         intersection {SliceZ translate <0 0  1>}
         intersection {SliceZ translate <0 0  2>}
         intersection {SliceZ translate <0 0  3>}
         intersection {SliceZ translate <0 0  4>}
         }
      }
   bounded_by {sphere {<0 0 0> 5.001}}
   }


object 
   {
   plane {<0 1 0> -8}
   texture {Blood_Marble scale <20 20 20>}
   }

object
   {
   Ballx

   texture 
      {
      Glass3
      color red 0.8 green 0.85 blue 1 alpha 0.9

//      colour SlateBlue
//      ambient 0.2
//      diffuse 0.8
//      brilliance 1.0 
//      phong 1.0      
//      phong_size 80
//      reflection 0.15
      }

   translate <0 0 0>
   scale <.5 .5 .5>
   }

