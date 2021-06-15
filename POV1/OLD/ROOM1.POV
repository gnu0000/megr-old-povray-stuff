#include "Shapes.inc"
#include "Colors.inc"
//#include "Textures.inc"


/*--- camera ---*/
camera 
   { 
   location  <.1 .8 -1>
   direction <0 0 1.4>
   up        <0 1 0>
   right     <1 0 0>
   look_at   <.5 .5 1>
   }



/*--- light ---*/
object {light_source { <.5 .5 .5> color White }}



/*--- wall on left ---*/
object
   {
   plane {<1 0 0> 0}
   texture
      {
      color Red
      ambient .7
      }
   }

/*--- wall on left ---*/
object
   {
   plane {<1 0 0> 1}
   texture
      {
      color Blue
      ambient .7
      }
   }


/*--- wall in back ---*/
object
   {
   plane {<0 0 1> 1}
   texture
      {
      color Green
      ambient .7
      }
   }

/*--- floor ---*/
object
   {
   plane {<0 1 0> 0}
   texture
      {
      color Violet
      ambient .7
      }
   }


/*--- ceiling ---*/
object
   {
   plane {<0 1 0> 1}
   texture
      {
      color Orange
      ambient .7
      }
   }

