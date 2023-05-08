#use strict;
use warnings;
use diagnostics;

use feature 'say';
package Account;
use overload '+' => \&add;


sub new
{
    my $class = shift;
    
    my $self =
    {
        name => shift,
        acc_num => shift,
        balance => shift
    };

    #bless allows an object to have methods called on it.
    bless $self, $class;
    return $self;
}


sub getName
{
    my $self = shift;
    return $self->{name};
}

sub getNum
{
    my $self = shift;
    return $self->{acc_num};
}

sub getBal
{
    my $self = shift;
    return $self->{balance};
}

sub setBal
{
    my $self = ($self, $new_bal) = @_;
    $self->{balance} = $new_bal;
}

sub printBal
{
    my $self = shift;
    say "Balance is: ",  $self->{balance};
}

#Overloads the '+' operator so when you use it between two objects the result is the addition of their balances.
#Example:
#my $acc1 = new Account("Jonah", 1, 123.45);
#my $acc2 = new Account("Erin", 2, 500.46);
#print $acc1 + $acc2;
#outout: 623.91
sub add
{
    my ($self, $other) = @_;
    my $result = $self->{balance} + $other->{balance};
    return $result;
}


1; #Perl classes must return 'true'