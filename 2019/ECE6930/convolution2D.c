#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define X(u,v) x[(u)*Cz+(v)]
#define H(u,v) h[(u)*Ch+(v)]
#define Y(u,v) y[(u)*Cy+(v)]
//default header for files
typedef struct
{
    int ndim; 
    int nchan;
    int d0; //M
    int d1; //N
    int d2;
} dsp_file_header;



int main(int argc, char *argv[]){
    printf("2D convolution:fin, fout fz\n");
    FILE *fin,*fout, *fz;
    //check if user provided correct number of inputs
    if(argc != 4)
    {
        printf("*Error: provide 1 impulse file, 1 input file and 1 output file for 2D Convolution.");
        return 0; 
    }
    //check for errors opening input and output files
     float h [9]={-1,0,1,-2,0,2,-1,0,1};
    // float h [9] ={-1,-2,-1,0,0,0,1,2,1};
    if(NULL ==(fin=fopen(argv[1],"rb")))
    {
        printf("ERROR: Can't open %s for input.\n",argv[1]);
        return 0;
    }
    if(NULL ==(fout=fopen(argv[2],"wb")))
    {
        printf("ERROR: Can't open %s for output.\n",argv[2]);
        return 0;
    }
    if(NULL ==(fz=fopen(argv[3],"wb")))
    {
        printf("ERROR: Can't open %s for output.\n",argv[3]);
        return 0;
    }

    printf("Start Processing\n");

    dsp_file_header hin, hout,hz;
    //read in headers of mono files
    fread(&hin,sizeof(dsp_file_header),1,fin);
    printf("Finished reading input header\n");
    int Rh=3;  //impulse
    int Ch = 3; //impulse
    int Rx=hin.d0; //input file
    int Cx=hin.d1; //input file
    int Ry=Rx+(Rh-1); //output file
    int Cy=Cx+(Rh-1); //output file   
    int Rz = Rx+2*(Rh-1); //zero padded
    int Cz = Cx+2*(Ch-1); //zero padded
    memcpy(&hout,&hin,sizeof(dsp_file_header));
    memcpy(&hz,&hin,sizeof(dsp_file_header));
    hout.d0=Ry;
    hout.d1=Cy;
    hz.d0=Rz;
    hz.d1=Cz;


    
    printf("Finished copying header\n");
    fwrite(&hout,sizeof(dsp_file_header),1,fout);
    fwrite(&hz,sizeof(dsp_file_header),1,fz);
    printf("Finished writing header\n");
    

    float *x=(float*)calloc(sizeof(float),Rz*Cz); //zero padded array for input
    float *y=(float*)calloc(sizeof(float),Ry*Cy); //output array

    float *xp=x+Cz*(Rh-1)+(Ch-1);

    for(int i=0;i<Rx;i++,xp+=Cz){
        fread(xp,sizeof(float),Cx,fin);
    }
    float pixel;
    int i,j,k,l;
    for(i=0;i<Ry;i++){
        for(j=0;j<Cy;j++){
            for(pixel=0.0, k=0;k<Rh;k++){
                for(l=0;l<Ch;l++){
                    pixel+=H(k,l)*X(i+k,j+l);
                }
            }
            Y(i,j)=pixel;
        }
    }
   
    
    printf("Finished convolution\n");
    fwrite(x,sizeof(float),Rz*Cz,fz);
    fwrite(y,sizeof(float),Ry*Cy,fout);
    
    fclose(fin);
    fclose(fout);
    fclose(fz);

    return 1;
}