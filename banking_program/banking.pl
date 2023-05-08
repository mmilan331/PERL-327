#By Jonah Raef (5/7/2023)
#Banking program that shows off the following features in the 'perl' programming language:
#Arrays
#Hashes
#Type checking
#Class inheritance
#Encapsulation
#Scope
#Type casting
#Operator overloading

use strict;
use warnings;
use diagnostics; #these 3 lines allow warning/error messages

use feature 'say'; #allows use of 'say', which prints to console, followed by a new line.

use lib 'lib';
use Account;
use Checking;
use Savings;
use Scalar::Util qw(looks_like_number); #determine if a value is a number

#pre-condition: Must enter number values when asked for numbers.
#pre-condition: Must enter existing values when asked for account number.
my @bank_accounts;
my $run_program = "1"; #true
my $user_input = "";
my $account_numbers = 0;
while($run_program == 1) #automatically turns a string, "1", into a number (type casting - done automatically in modern perl)
{
    #Option '4' is insecure in the real-world, but can prevent rememberance issues in the scope of testing this program.
    print "\nWhat would you like to do?:\n", "1. Make an account\n2. Check balance\n3. View account details",
    "\n4. View all account numbers\n5. Withdraw\n6. Print the sum of balances from two accounts", "\nYour selection: ";
    chomp($user_input = <STDIN>);

    if($user_input eq "1") #Make account
    {
        print "Please enter account name: ";
        chomp (my $temp_name = <STDIN>);

        print "Please enter account balance (ex: 465.23): ";
        chomp (my $temp_bal = <STDIN>);

        print "Please enter account type (1: Checking, 2: Savings): ";
        chomp (my $account_type = <STDIN>);
        if($account_type eq "2" || $account_type eq "Savings")
        {
            my $new_account = new Savings($temp_name, $account_numbers++, $temp_bal);
            push @bank_accounts, $new_account;
        }
        else #by default, account type will be 'Checking'
        {
            my $new_account = new Checking($temp_name, $account_numbers++, $temp_bal);
            push @bank_accounts, $new_account;
        }
    }
    elsif($user_input eq "2") #Quickly check balance
    {
        print "Enter the 'account number' of the account you'd like the balance of: ";
        chomp (my $account_num = <STDIN>); #'chomp' removes the \n from the end of <STDIN>

        #Search array for value by index
        if(defined $bank_accounts[$account_num])
        {
            say "Balance of account #$account_num: ", $bank_accounts[$account_num]->getBal();
        }
        else
        {
            say "Account #$account_num does not exist!";
        }
    }
    elsif($user_input eq "3") #View all account details by providing the name on the account
    {
        print "Enter the name on the account you want to see the information for: ";
        chomp($user_input = <STDIN>);

        for my $curr_account (@bank_accounts)
        {
            #Search table table to and get information from it if the it contains the key
            if($curr_account->{name} eq $user_input)
            {
                #print account information -- by using getters
                say "\tAccount Number: ", $curr_account->getNum();
                say "\tAccount Balance: ", $curr_account->getBal();
                say "\tAccount Type: ", $curr_account->getType();
            }
            else
            {
                say "There is no account under the name '$user_input'.";
            }
        }
    }
    elsif($user_input eq "4")
    {
        for my $curr_account (@bank_accounts)
        {
            #these values can be accessed by key in a hash table because they were "blessed," making them public
            say "Name, Number: ", $curr_account->{name}, ", ", $curr_account->{acc_num}, ";";
        }
    }
    elsif($user_input eq "5")
    {
        my $acc_found = 0; #boolean tracking whether account was found or not
        print "Enter the account number or name you'd like to withdraw from: ";
        chomp($user_input = <STDIN>);
        if(looks_like_number($user_input) && defined $bank_accounts[$user_input])
        {
            $acc_found = 1;
            if($bank_accounts[$user_input]->getType() eq "Checking")
            {
                $bank_accounts[$user_input]->withdrawl();
            }
            else
            {
                say "This is a Savings account. You cannot withdraw from it!";
            }

        }
        else
        {
            for my $curr_account (@bank_accounts)
            {
                if($curr_account->{name} eq $user_input)
                {
                    $acc_found = 1;
                    if($curr_account->getType eq "Checking")
                    {
                        $curr_account->withdrawl();
                    }
                    else
                    {
                        say "This is a Savings account. You cannot withdraw from it!";
                    }
                }
            }
        }
        if($acc_found == 0)
        {
            say "Account not found!";
        }
    }
    elsif($user_input == "6")
    {
        if(scalar(@bank_accounts) < 2)
        {
            say "The bank needs at least two accounts to sum together.\nThere are currently ", scalar(@bank_accounts), " accounts.";
        }
        else
        {
            say "Select accounts:";
            for my $curr_account (@bank_accounts)
            {
               say "Name, Number: ", $curr_account->{name}, ", ", $curr_account->{acc_num}, ";";
            }
            print "First account number: ";
            chomp (my $account1 = <STDIN>);
            chomp (my $account2 = <STDIN>);
            say "Sum of balances from accounts #", $account1, " & #", $account2, ": ", $bank_accounts[$account1] + $bank_accounts[$account2];
        }
    }
    else
    {
        print "Are you sure you want to exit the program? (Y/N): "; #mistype precaution
        chomp($user_input = <STDIN>);
        if($user_input eq "Y" || $user_input eq "y")
        {
            $run_program = 0; #false
        }
    }
}