#include <iostream>
#include <string>
using namespace std;

//Nathan Tipton A01207112

class BankAccount {
	int AccountNumber;
	string AccountHolder;
	double AccountBalance;

public:
	BankAccount(){ AccountBalance = 5; };
	int getAccountNumber(){ return AccountNumber; };
	void setAccountNumber(int myAccountNumber){ AccountNumber = myAccountNumber; };

	string getAccountHolder(){ return AccountHolder; };
	void setAccountHolder(string myAccountHolder){ AccountHolder = myAccountHolder; };
	
	double getAccountBalance(){ return AccountBalance; };
	void setAccountBalance(double myAccountBalance){ AccountBalance = myAccountBalance; };
	void newAccount(BankAccount accounts[]);
	void print(){
		cout << "Account Number: " << AccountNumber<< endl;
		cout << "Account Holder: "<< AccountHolder << endl;
		cout << "Account Balance: $" << AccountBalance << endl;
	};
};
int AccountSearch(BankAccount accounts[], int size, int key) {
	for (int i = 0; i < size; i++)
		if (accounts[i].getAccountNumber() == key)
			return i;
	return -1;
}
void NewAccount(BankAccount accounts[], int size, int index){
	int newAcct;
	string name;
	double deposit;
	
	cout << "--OPEN A NEW ACCOUNT--\n";
	cout << "Total available accounts: " << size << endl;
	cout << "Accounts in use: " << index << endl;
	
	
	
	if (index == size){ cout << "Sorry no more accounts available\n"; }
	else{
		
		cout << "Enter new account number: \n";
		cin >> newAcct;
		int test = AccountSearch(accounts, size, newAcct);
		while (test != -1){


			cout << "Account Number in use:\n";
			cout << "Please enter a new account number: \n";
			cin >> newAcct;
			test = AccountSearch(accounts, size, newAcct);


		}
		accounts[index].setAccountNumber(newAcct);
		cout << "Number Accepted!\n";
		cout << "Account Holder Name? ";
		cin >> name;
		accounts[index].setAccountHolder(name);

		cout << "Account created.\n";
		cout <<"Thanks for your business.\n";
		

	}

}
void deposit(BankAccount accounts[],int size){
	int Acct;
	double depositAmount;
	double temp;
	cout << "--DEPOSIT--\n";
	cout << "Enter account number: \n";
	cin >> Acct;
	int test = AccountSearch(accounts, size, Acct);
	while (test == -1){


		cout << "Invalid Account Number:\n";
		cout << "Please enter a valid account number: \n";
		cin >> Acct;
		test = AccountSearch(accounts, size, Acct);


	}
	accounts[test].print();
	cout << "How much would you like to deposit? $";
		cin >> depositAmount;
		temp = accounts[test].getAccountBalance();
			temp += depositAmount;
		accounts[test].setAccountBalance(temp);
		cout << endl;
		cout << "New Balance:";
			accounts[test].print();
			cout << endl;


}
void withdraw(BankAccount accounts[], int size){
	int Acct;
	double withdrawAmount;
	double temp;
	cout << "--WITHDRAW--\n";
	cout << "Enter account number: \n";
	cin >> Acct;
	int test = AccountSearch(accounts, size, Acct);
	while (test == -1){


		cout << "Invalid Account Number:\n";
		cout << "Please enter a valid account number: \n";
		cin >> Acct;
		test = AccountSearch(accounts, size, Acct);


	}
	accounts[test].print();
	cout << "How much would you like to withdraw? $";
	cin >> withdrawAmount;
	temp = accounts[test].getAccountBalance();
	temp -= withdrawAmount;
	if (temp < 0){ cout << "Overdraft: Negative balance in account.\n"; };
	accounts[test].setAccountBalance(temp);
	cout << endl;
	cout << "New Balance:\n";
	accounts[test].print();
	cout << endl;


}
void balance(BankAccount accounts[], int size){
	int Acct;
	double withdrawAmount;
	double temp;
	cout << "--ACCOUNT BALANCE--\n";
	cout << "Enter account number: \n";
	cin >> Acct;
	int test = AccountSearch(accounts, size, Acct);
	while (test == -1){


		cout << "Invalid Account Number:\n";
		cout << "Please enter a valid account number: \n";
		cin >> Acct;
		test = AccountSearch(accounts, size, Acct);


	}
	accounts[test].print();
	cout << endl;
	



}

int main(){

	
	const int size = 5;
	int index = 0;
	BankAccount accounts[size];
	accounts[index].setAccountNumber(1);
	accounts[index].setAccountHolder("Tom");
	accounts[index].setAccountBalance(142);
	index++;

	accounts[index].setAccountNumber(2);
	accounts[index].setAccountHolder("Fred");
	accounts[index].setAccountBalance(345);
	index++;

	accounts[index].setAccountNumber(3);
	accounts[index].setAccountHolder("Sally");
	accounts[index].setAccountBalance(586);
	index++;

	int choice;
	do{
		
		cout << "-- What would you like to do? --\n 1 - Open a new account \n 2 - Deposit to an existing account \n 3 - Withdraw from an existing account \n 4 - Check your account balance\n 5 - Quit\n";
		cout << "Please type 1,2,3,4, or 5: ";
		cin >> choice;
		switch (choice){
		case 1:
			NewAccount(accounts, size, index);
			index++;
			break;
		case 2:
			deposit(accounts, size);
			break;
		case 3:
			withdraw(accounts, size);
			break;
		case 4:
			balance(accounts, size);
			break;
		
		default: cout << "That is not a valid choice. Please try again.\n";
		case 5: cout << "Goodbye!\n";
		}
	} while (choice != 5);
	

	return 0;
}