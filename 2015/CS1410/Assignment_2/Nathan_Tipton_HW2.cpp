#include < iostream > ;
#include <fstream>;
#include <time.h>;
using namespace std;
//Nathan Tipton A01207112
class IPRecord{
	int frequency;
	double ipaddr;
public:
	IPRecord(){ frequency = 1;};
	void setIPAddress(int i){ ipaddr = i; };
	
	int getIpaddr(){ return ipaddr; };
	int getFrequency(){	return frequency;}
	void addfrequency(){ frequency ++; };

};
class IPTable{
	static const int size = 10000;
	int objects;
	

public:
	IPRecord address[size];
	IPTable(){objects = 0;	}
	
	int getobjects(){ return objects; }
	void sortbyfrequency(){
		for (int i = 0; i < objects; i++)
			for (int j = i + 1; j < objects; j++)
				if (address[i].getFrequency() < address[j].getFrequency()) {
			IPRecord temp = address[i];
			address[i] = address[j];
			address[j] = temp;
	
			}
		}
	
	void insert(int ipaddr){
		int result = BinarySearch(ipaddr);
		
		if (result == -1){
			IPRecord add;
			add.setIPAddress(ipaddr);


			for (int i = 0; i <objects; i++){

				if (add.getIpaddr() < address[i].getIpaddr()){
					IPRecord temp = address[i];
					address[i] = add;
					add = temp;

					
				}

			}address[objects] = add;
			objects++;
		}
		else address[result].addfrequency();
	}
	int BinarySearch(int ipaddr){
		int first = 0;
		int last = objects - 1;

		do {
			int mid = (first + last) / 2;
			
			if (address[mid].getIpaddr() == ipaddr)
				return mid;

			if (address[mid].getIpaddr()< ipaddr)
				first = mid + 1;
			else
				last = mid - 1;
		} while (first <= last);
		
		return -1;
	}
	
};
int main(){
	clock_t t;
	IPTable table;
	
	ifstream filein;
	ofstream fileout;
	int address;
	t = clock();
	filein.open("input2.txt");
	for (int i = 0; i < 1000000;i++){
		filein >> address;
		table.insert(address);
		cout << i << endl;
		
		
	}
	filein.close();
	cout << "Sort by Frequency" << endl;
	table.sortbyfrequency();
	fileout.open("output.txt");
	for (int i = 0; i<table.getobjects(); i++){
		fileout << table.address[i].getIpaddr()<<" "<< table.address[i].getFrequency();
		fileout << endl;
	}
	t = clock() - t;
	float seconds = t / CLOCKS_PER_SEC;
	float minutes = seconds / 60;
	cout << "It took " << minutes << " minutes";



	return 0;
}