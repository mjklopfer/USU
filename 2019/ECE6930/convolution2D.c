#include <stdio.h>
#include <stdlib.h>
#include <string.h>


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
    printf("2D convolution: impulse, fin, fout\n");
    FILE *fh,*fx,*fy;
    //check if user provided correct number of inputs
    if(argc != 4)
    {
        printf("*Error: provide 1 impulse file, 1 input file and 1 output file for 2D Convolution.");
        return 0; 
    }
    //check for errors opening input and output files
     if(NULL ==(fh=fopen(argv[1],"rb")))
    {
        printf("ERROR: Can't open %s for impulse.\n",argv[1]);
        return 0;
    }
    if(NULL ==(fx=fopen(argv[2],"rb")))
    {
        printf("ERROR: Can't open %s for input.\n",argv[2]);
        return 0;
    }
    if(NULL ==(fy=fopen(argv[3],"wb")))
    {
        printf("ERROR: Can't open %s for output.\n",argv[3]);
        return 0;
    }
    printf("Start Processing\n");

    dsp_file_header hh, hx, hy;
    //read in headers of input files
    fread(&hx,sizeof(dsp_file_header),1,fx);
    fread(&hh,sizeof(dsp_file_header),1,fh);
    if(hx.nchan>1){
        printf("Input file must be single channel signal.\n");
        return 0;
    }

    printf("Finished reading input header\n");
    memcpy(&hy,&hx,sizeof(dsp_file_header));
    printf("Finished copying header\n");
    int Lh,Lx, Ly,Lz;
    Lh=hh.d0; //Length of impulse response
    Lx=hx.d0; //Length of input
    Ly=Lx+(Lh-1); //Length of convolution
    
    Lz=Lx+2*(Lh-1);

    printf("Ly: %d Lx: %d Lh: %d Lz: %d \n",Ly,Lx,Lh,Lz);
    hy.d0=Ly;
    fwrite(&hy,sizeof(dsp_file_header),1,fy);
    printf("Finished writing header\n");
    printf("Starting Convolution\n");
    float *x=(float*)calloc(sizeof(float),Lz);
    float *y=(float*)calloc(sizeof(float),Ly);
    float *h=(float*)calloc(sizeof(float),Lh);
    printf("Allocated memory\n");
    fread(x+Lh-1,sizeof(float),Lx,fx);
    fread(h,sizeof(float),Lh,fh);
    printf("Finished reading in Data\n");
   int i, j;
   for(i=0; i<Ly; i++){
       //printf("First loop\n");
       for(j=0;j<Lh; j++){
          // printf("Second loop\n");
        //  printf("i: %d  j: %d  i+j: %d Ly: %d  Lh: %d Lx: %d \n",i,j,i+j,Ly,Lh,Lx);
           y[i]+= h[j]*x[i+j]; //MACC
       }
   }
   printf("writing out\n");
    fwrite(y,sizeof(float),Ly,fy);
    
    printf("Finished convolution\n");
    printf("Number of zeros padding input signal %d\n", (Lh-1));
    printf("Total length of padded input signal %d\n", Lz);
    printf("Length of output signal %d\n",Ly);
    
    fclose(fh);
    fclose(fx);
    fclose(fy);

    return 1;
}