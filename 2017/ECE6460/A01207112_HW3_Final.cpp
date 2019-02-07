#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <iomanip>
#include <stack>
#include <algorithm>
using namespace std;
 std::vector<int>widthv;
 std::vector<int>heightv;
 std::vector<char>modulev;

    int iterator=0;
   
class AreaNode{
public:
  char module;
  float height;
  float width;
  vector<float>heightvec;
  vector<float>widthvec;
  AreaNode();
  AreaNode(char m);
  void Insert(float h, float w);






};
AreaNode::AreaNode(){

  module='X';
  height=0;
  width=0;



};
  AreaNode::AreaNode(char m){
    module=m;






  };
void AreaNode::Insert(float h, float w){
  heightvec.push_back(h);
  widthvec.push_back(w);



};
stack <AreaNode> AreaStack;
void showstack(stack<AreaNode> AreaStack){
  AreaNode temp1;
  cout<<endl<<"-------Stack-------"<<endl;
  cout<<endl<<"   --W------H--   "<<endl;
  stack <AreaNode> temp=AreaStack;
  while(!temp.empty()){
    temp1=temp.top();
    if((temp1.module!='V')|(temp1.module!='H')){
    cout<<temp1.module<<": ";
    for(int i=0;i<temp1.widthvec.size();i++){
      cout<<temp1.widthvec[i]<<"-"<<temp1.heightvec[i]<<"   ";

    }
    }
    cout<<endl;
    temp.pop();

  }



  cout<<endl<<"-----------------"<<endl;
}


    
float cost(vector<char> NPE){
    ifstream fin;
    char module;
    float area;
    float aspect;
    float width;
    float height;

   
    
  for(int i=0;i<NPE.size();i++){
    cout<<endl<<"NPE["<<i<<"]="<<NPE[i]<<endl;
     fin.open("input_file.txt");
     //  fin.open("input_file2.txt");
     //check if operator is vertical
    if(NPE[i]=='V'){
      AreaNode opNode;
      opNode.module='V';
      float NewWidth,NewHeight;
      AreaNode temp1,temp2;
      temp1=AreaStack.top();
      AreaStack.pop();
      temp2=AreaStack.top();
      AreaStack.pop();
      //Find all possible relations
      for(int i=0;i<temp1.widthvec.size();i++){
	for(int j=0;j<temp2.widthvec.size();j++){

	  NewWidth=temp1.widthvec[i]+temp2.widthvec[j];
	  opNode.widthvec.push_back(NewWidth);
	}



      }
      for(int i=0;i<temp1.heightvec.size();i++){

	for(int j=0;j<temp2.heightvec.size();j++){

	  NewHeight=max(temp1.heightvec[i],temp2.heightvec[j]);
	  opNode.heightvec.push_back(NewHeight);
	}


      }
      //find optimal area

      AreaStack.push(opNode);
      //  showstack(AreaStack);
    
    }
    //Check if operator is horizontal
    else if(NPE[i]=='H'){
       AreaNode opNode;
      opNode.module='H';
       AreaNode temp1,temp2;
      temp1=AreaStack.top();
      AreaStack.pop();
      temp2=AreaStack.top();
      AreaStack.pop();
      float NewWidth,NewHeight;
      //Find all possible rotations
       for(int i=0;i<temp1.heightvec.size();i++){
	for(int j=0;j<temp2.heightvec.size();j++){

	  NewHeight=temp1.heightvec[i]+temp2.heightvec[j];
	  opNode.heightvec.push_back(NewHeight);
	}



      }
      for(int i=0;i<temp1.widthvec.size();i++){

	for(int j=0;j<temp2.widthvec.size();j++){

	  NewWidth=max(temp1.widthvec[i],temp2.widthvec[j]);
	  opNode.widthvec.push_back(NewWidth);
	}


      }
      //push operator onto stack
      AreaStack.push(opNode);
      //  showstack(AreaStack);
        
    }
    //Search through file for matching module operand
    else{
      while(!fin.eof()){
	fin>>module;
	if(module==NPE[i]){
	  //cout<<"Match!"<<module<<" "<<NPE[i]<<endl;
	    fin>>area;
	  
	    fin>>aspect;
       
	    break;
	  }
	  
	float temp;
	fin>>temp;
	fin>>temp;
      }
    
      
      
      height=sqrt(area/aspect);
      // cout<<"Height: "<<height<<endl;
      width=aspect*height;
      // cout<<"New node on stack:"<<"MODULE: "<<module<<" "<<"W:"<<width<<" "<<"H:"<<height<<" "<<"A: "<<area<<" "<<"R: "<<aspect<<endl;
      AreaNode newNode;
      newNode=AreaNode(module);
      //insert operand node with rotation
      newNode.Insert(height,width);
      newNode.Insert(width,height);
       AreaStack.push(newNode);
       //   showstack(AreaStack);
    }
    fin.close();
}
  
  AreaNode FinalBlock;
    FinalBlock=AreaStack.top();
  
    AreaStack.pop();
    cout<<"NPE: ";
    for(int i=0;i<NPE.size();i++){
      cout<<NPE[i];
    }
    cout<<endl;
    float bestArea=1000000;
    float testArea;
    for(int i=0;i<FinalBlock.widthvec.size();i++){
      //Using all the heights and widths find the minimal area
      testArea=FinalBlock.widthvec[i]*FinalBlock.heightvec[i];
      if(testArea<bestArea){
	bestArea=testArea;
      }

    }
    cout<<"Area: "<<bestArea;
    return bestArea;
}

int main() {
  float area1,area2,area3;   
   const char NPE_1[]={'1','2','V','3','V','4','V','5','V','6','V','7','V','8','V','9','V','a','V','b','V','c','V','d','V','e','V','f','V','g','V','i','V','j','V','k','V','l','V'};
  const char NPE_2[]={'1','2','H','3','H','4','H','5','H','6','H','7','H','8','H','9','H','a','H','b','H','c','H','d','H','e','H','f','H','g','H','i','H','j','H','k','H','l','H'};
  const char NPE_3[]={'2','1','3','5','4','6','H','7','V','H','V','a','8','V','9','H','c','V','H','g','H','i','b','d','H','k','V','H','f','e','H','V','l','H','V','j','H','V','H'};
  // const char NPE_1[]={'1','2','H','3','4','V','5','6','V','H','V'};
    const std::vector<char> NPE1(NPE_1,NPE_1+sizeof(NPE_1)/sizeof(char));
     const std::vector<char> NPE2(NPE_2,NPE_2+sizeof(NPE_2)/sizeof(char));
      const std::vector<char> NPE3(NPE_3,NPE_3+sizeof(NPE_3)/sizeof(char));
        area1=cost(NPE1);
        area2=cost(NPE2);
	 area3=cost(NPE3);
     

     cout<<"AREAS: "<<endl;
     cout<<"Area 1: "<<area1<<endl;
       cout<<"Area 2: "<<area2<<endl;
        cout<<"Area 3: "<<area3<<endl;
    
    
    
    
    
    return 0;
}
