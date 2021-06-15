#include "Shapes.inc"
#include "Alphabet.inc"
#include "Alphobj.inc"
#include "Colors.inc"
#include "Textures.inc"
#include "Stones.inc"


assert {@yrot 90$@step}   // make sure @step param was on cmd line and <6

/*--- camera ---*/
camera 
   { 
   location  <-3 3 -8>
   direction <0 0 1.1>
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
      quadric {Cylinder_X scale <1.5 1.5 1.5> inverse}
      quadric {Cylinder_Y scale <1.5 1.5 1.5> inverse}
      quadric {Cylinder_Z scale <1.5 1.5 1.5> inverse}
      }
   bounded_by {sphere {<0 0 0> 5}}
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
      colour SlateBlue
      ambient 0.2
      diffuse 0.8
      brilliance 1.0 
      phong 1.0      
      phong_size 80
      reflection 0.15
      }
   rotate <0 @yrot 0>
   translate <0 0 0>
   scale <.5 .5 .5>
   }

