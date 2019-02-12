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

typedef struct
{
    float r;
    float g;
    float b;
} pixel;

int main(int argc, char *argv[]){
    printf("rgb2gray fin fout\n");
    FILE *fin,*fout;
    //check if user provided correct number of inputs
    if(argc != 3)
    {
        printf("*Error: provide 1 input file and 1 output file for rgb2gray conversion.");
        return 0; 
    }
    //check for errors opening input and output files
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
    printf("Start Processing\n");

    dsp_file_header hin, hout;
    //read in headers of mono files
    fread(&hin,sizeof(dsp_file_header),1,fin);
    printf("Finished reading input header\n");
    memcpy(&hout,&hin,sizeof(dsp_file_header));
    printf("Finished copying header\n");
    hout.nchan=1;
    fwrite(&hout,sizeof(dsp_file_header),1,fout);
    printf("Finished writing header\n");
    int R=hin.d0;
    int C=hin.d1;
    int m,n;
    int r,g,b,gr;
    pixel *rgb = (pixel*)calloc(sizeof(pixel),R*C); 
    float *gray = (float*)calloc(sizeof(float),R*C);
    pixel currentPixel;
    for(m=0;m<R;m++){
        for(n=0;n<R;n++){
            fread(&currentPixel,sizeof(pixel),1,fin);
            rgb[m*C+n]=currentPixel;
            gray[m*C+n]=convertRGB(currentPixel);
            
        }
    }
    fwrite(gray,sizeof(float),R*C,fout);
    printf("Finished conversion\n");

    fclose(fin);
    fclose(fout);

    return 1;
}

int convertRGB(pixel p){

    return (0.2989)*p.r+(0.5870)*p.g+(0.1140)*p.b;
}