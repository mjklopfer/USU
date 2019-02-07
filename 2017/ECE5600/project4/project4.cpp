
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <fstream>

//
// default IP address (if not specified on the command line
//
#define IP_ADDR "0.0.0.0"


sockaddr sa;
sockaddr_in *sin = (sockaddr_in *) &sa;
int sk;

int main(int argc, char *argv[])
{
   sk = socket(PF_INET, SOCK_STREAM, 0);
   if ( sk < 0 ) return -1;

   memset(&sa,0,sizeof(sa));
   sin->sin_family = PF_INET;
   sin->sin_port = htons(5600);
   if ( argc<2 || inet_pton(PF_INET, argv[1], &(sin->sin_addr)) <= 0 )
      inet_pton(PF_INET, IP_ADDR, &(sin->sin_addr));

   if ( bind(sk, &sa, sizeof(sa)) < 0 )
   {
      printf("bind failed\n");
      return 0;
   }
   printf("bind succeeded\n");

   if ( listen(sk, 5) < 0 )
   {
      printf("listen failed\n");
      return 0;
   }
   printf("listen succeeded\n");

   sockaddr client;
   socklen_t clientlen = sizeof(client);

   int socket = accept(sk, &client, &clientlen);
   if (socket < 0)
   {
       printf("accept failed\n");
       return -1;
   }

   std::ofstream file("received_data.txt");
   char buffer[256];
   bzero(buffer, 256);
   int n = read(socket, buffer, 255);
   if (n < 0)
   {
       printf("Error reading from the socket\n");
       return -1;
   }
   file << buffer;
   std::cout << "Received data: " << std::endl;
   std::cout << buffer << std::endl;

   close(sk);
   printf("socket closed\n");
}
