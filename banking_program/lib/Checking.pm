package Checking;
use parent -norequire, 'Account'; #allows use of parent's (Account) sub routines

use strict;
use warnings;
use feature 'say';

sub new
{
    my $class = shift;

    #call parent class' constructor (Account)
    my $self = $class->Account::new(@_);

    #additional attribute only in this child class
    $self->{acc_type} = "Checking";

    bless($self, $class);

    return $self;
}

sub getType
{
    my $self = shift;
    return $self->{acc_type};
}


#Only 'Checking' accounts can withdrawl, so "Savings" doesn't have this.
sub withdrawl
{
    my $self = shift;
    print "Current balance: ";
    $self->printBal();
    print "Please enter amount you want to withdrawl: ";
    chomp (my $user_input = <STDIN>); # "my $user_input" used in this scope. It was also used in banking.pl
    
    #type cast from string to float by using 'eval'
    my $new_bal = (eval($self->{balance}) * 1) - (eval($user_input) * 1); #Also used in new scope
    if($new_bal >= 0.00)
    {
        $self->{balance} = $new_bal;
    }
    else
    {
        say "You cannot withdrawl because you don't have enough money!";
    }
}

1;