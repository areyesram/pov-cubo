#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

#declare S=1;

camera { location   <-1.5,S*2,-3> look_at    <0,0,0> }                

light_source { < -8, 4, -10 > color White }
light_source { < 0, 4, 6 > color White }

#declare V = array[8] {
        <+S/2,+S/2,+S/2>,
        <-S/2,+S/2,+S/2>,
        <+S/2,-S/2,+S/2>,
        <-S/2,-S/2,+S/2>,
        <+S/2,+S/2,-S/2>,
        <-S/2,+S/2,-S/2>,
        <+S/2,-S/2,-S/2>,
        <-S/2,-S/2,-S/2>
}

#declare TEXSPH = texture { pigment { color green 1 blue 0.8 red 0.5 } finish {phong 0.8} }
#declare TEXCYL = Chrome_Metal

union {
        #declare I=0;
        #while (I<8)
                sphere {  V[I] S/4 texture {TEXSPH} }
                #declare J=I+1;
                #while (J<8)
                        #if (   (V[I].x = V[J].x & V[I].y = V[J].y) |
                                (V[I].y = V[J].y & V[I].z = V[J].z) |
                                (V[I].z = V[J].z & V[I].x = V[J].x) )                        
                                cylinder { V[I] V[J] S/10 texture {TEXCYL}}                
                        #end
                        #declare J=J+1;
                #end
                #declare I=I+1;
        #end
        rotate <360*clock,0,360*clock>
}