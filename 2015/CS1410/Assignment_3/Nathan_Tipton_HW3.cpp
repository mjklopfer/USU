#include <iostream>
#include <fstream>
#include <string>
using namespace std;
//Nathan Tipton A01207112
ifstream fin;
ofstream fout;
class BankAccount{
	int AccountNumber;
	string AccountHolder;
	double AccountBalance;

public:
	BankAccount(){ AccountBalance = 0; };
	BankAccount(int aNum, string aHolder, double aBalance){
		AccountNumber = aNum;
		AccountHolder = aHolder;
		AccountBalance = aBalance;
	};
	int getAccountNumber(){ return AccountNumber; };
	void setAccountNumber(int myAccountNumber){ AccountNumber = myAccountNumber; };

	string getAccountHolder(){ return AccountHolder; };
	void setAccountHolder(string myAccountHolder){ AccountHolder = myAccountHolder; };

	double getAccountBalance(){ return AccountBalance; };
	void setAccountBalance(double myAccountBalance){ AccountBalance = myAccountBalance; };

	void print(){
		cout << "Account Number: " << AccountNumber << endl;
		cout << "Account Holder: " << AccountHolder << endl;
		cout << "Account Balance: $" << AccountBalance << endl;
	};

};

class BankBranch{
	BankAccount**accounts;
	BankAccount**accounts2;
	int nAccounts;
	int test;
	
public:
	void LoadAccounts(string filename){
		int accountNum;
		string accountHold;
		float accountBal;
		string info;
		BankAccount temp;
		fin.open(filename);
		if (fin.is_open()){
			getline(fin, info);
			nAccounts = stoi(info);
			accounts = new BankAccount*[nAccounts];
			for (int i = 0; i < nAccounts; i++){


				getline(fin, info);
				accountNum = stoi(info);
				getline(fin, accountHold);
				getline(fin, info);
				accountBal = stof(info);
				accounts[i] = new BankAccount(accountNum, accountHold, accountBal);
				

			}fin.close();
			for (int i = 0; i < nAccounts; i++)
				for (int j = i + 1; j < nAccounts; j++)
					if (accounts[i]->getAccountNumber() > accounts[j]->getAccountNumber()) {
				temp = *accounts[i];
				*accounts[i] = *accounts[j];
				*accounts[j] = temp;
					}
			for (int i = 0; i < nAccounts; i++){

				accounts[i]->print();
			}
		}
		else
			cout << "FAILED TO OPEN" << endl;
	}
	void saveAccounts(string filename){

		fout.open(filename);
		fout << nAccounts << endl;
		for (int i = 0; i < nAccounts; i++){
			fout << accounts[i]->getAccountNumber() << endl;
			fout << accounts[i]->getAccountHolder() << endl;
			fout << accounts[i]->getAccountBalance() << endl;

		}
		cout << "Accounts Saved Successfully" << endl;
		fout.close();


	}
	int BinarySearch(int accountNum){
		int first = 0;
		int last = nAccounts - 1;

		do {
			int mid = (first + last) / 2;

			if (accounts[mid]->getAccountNumber() == accountNum)
				return mid;

			if (accounts[mid]->getAccountNumber() < accountNum)
				first = mid + 1;
			else
				last = mid - 1;
		} while (first <= last);
		return -1;
	}
	void AddAccount(){
		int newAcct;
		BankAccount temp;
		string firstname;
		string middle = " ";
		string lastname;
		string name;
		cout << "New account number?";
		cin >> newAcct;
		test = BinarySearch(newAcct);
		while (test != -1){
			cout << "Account Number in use, Please try again." << endl;
			cin >> newAcct;
			test = BinarySearch(newAcct);
		};
		cout << "Account Holder? " << endl;
		cout << "First Name: ";
		cin>>firstname;
		cout << endl << "Last Name:";
		cin >> lastname;
		name = firstname + middle+lastname;
		accounts2 = new BankAccount*[nAccounts + 1];
		for (int i = 0; i < nAccounts; i++){
			accounts2[i] = accounts[i];
		}

		
		accounts = accounts2;
		
		
		nAccounts++;
		accounts[nAccounts - 1] = new BankAccount(newAcct, name,0);
		for (int i = 0; i < nAccounts; i++)
			for (int j = i + 1; j < nAccounts; j++)
				if (accounts[i]->getAccountNumber() > accounts[j]->getAccountNumber()) {
			temp = *accounts[i];
			*accounts[i] = *accounts[j];
			*accounts[j] = temp;
			

				}
	

	}
	void deposit(){
		int Acct;
		double deposit;
		double balance;
		cout << "Account number? ";
		cin >> Acct;
		test = BinarySearch(Acct);
		while (test == -1){
			cout << "Account number invalid, please try again." << endl;
			cin >> Acct;
			test = BinarySearch(Acct);
		};
		cout << "Deposit amount? $";
		cin >> deposit;
		balance = accounts[test]->getAccountBalance();
		accounts[test]->setAccountBalance(deposit + balance);
		cout << "$" << deposit << " was deposited into account " << accounts[test]->getAccountNumber() << " successfully!" << endl;
		cout << "New balance is $" << accounts[test]->getAccountBalance() << endl;

	}
	void withdraw(){
		int Acct;
		double withdraw;
		double balance;
		cout << "Account number? ";
		cin >> Acct;
		test = BinarySearch(Acct);
		while (test == -1){
			cout << "Account number invalid, please try again." << endl;
			cin >> Acct;
			test = BinarySearch(Acct);
		};
		cout << "Available Balance: $" << accounts[test]->getAccountBalance() << endl;
		cout << "Withdraw amount? $";
		cin >> withdraw;
		balance = accounts[test]->getAccountBalance();
		accounts[test]->setAccountBalance(balance - withdraw);
		if (accounts[test]->getAccountBalance() < 0){
			cout << "Overdraft!  You have a negative balance." << endl;
		}
		cout << "$" << withdraw << " was withdrawn from account " << accounts[test]->getAccountNumber() << " successfully!" << endl;
		cout << "New balance is $" << accounts[test]->getAccountBalance() << endl;

	}
	void displayAccount(){
		int Acct;
		cout << "What account number would you like to display? ";
		cin >> Acct;
		cout << endl;
		test = BinarySearch(Acct);
		while (test == -1){
			cout << "Account number invalid, please try again." << endl;
			cin >> Acct;
			test = BinarySearch(Acct);
		}
		accounts[test]->print();
	}
};
int main(){
	BankBranch account;
	int choice;
	do{
		cout << endl;]
		cout << "     *****BANK OF USU*****" << endl;
		cout << endl;
		cout << "-- What would you like to do? --" << endl;
		cout << "1 - Open a new account \n";
		cout << "2 - Deposit to an existing account \n";
		cout << "3 - Withdraw from an existing account \n";
		cout << "4 - Display Account\n";
		cout << "5 - Load Account Info from File\n";
		cout << "6 - Save Account Info to File\n";
		cout<<"7 - Quit\n";
		cout << "Please type a number 1 - 7: ";
		
		cin >> choice;
		cout << endl;
		switch (choice){
		case 1:
			
			account.AddAccount();
			break;
		case 2:
			account.deposit();
			break;
		case 3:
			account.withdraw();
			break;
		case 4:
			account.displayAccount();
			break;
		case 5:
			account.LoadAccounts("input.txt");
			break;
		case 6:
			account.saveAccounts("input.txt");
			break;

		default: cout << "That is not a valid choice. Please try again.\n";
		case 7: cout << "Goodbye!\n";
		}
	} while (choice != 7);
	
return 0;
}