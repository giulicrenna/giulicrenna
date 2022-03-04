#include<iostream>
#include<conio.h>
#include<fstream>
#include<cstdlib>

using namespace std;

int main(){
    long long int i = 2;
    long long int counter = 0;
    ofstream outfile;
    outfile.open("list.txt", std::ios::app);
    if(!outfile){
        cerr<<"Error: File couldn't be opened"<<endl;
        exit(1);
    }
    if(outfile.is_open()){
        while(true){
            for(long long int start = 1; start<=i; start++){
                int div = i%start; 
                if(div==0){
                    counter++;
                }    
            }
            if(counter==2){    
                cout<<"Prime number found: "<<i<<endl;
                outfile<<i<<endl;
            }//else{cout<<i<<" Not a prime number"<<endl;}
            counter=0;
            i++;
            
        }
    }else{cout<<"File is not opened"<<endl;}
    outfile.close();
    return 0;
}