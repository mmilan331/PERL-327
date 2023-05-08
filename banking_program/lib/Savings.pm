package Savings;
use parent -norequire, 'Account'; #allows use of parent's (Account) sub routines

use strict;
use warnings;

sub new
{
    my $class = shift;

    #call parent class' constructor (Account)
    my $self = $class->Account::new(@_);

    #additional attribute only in this child class
    $self->{acc_type} = "Savings";

    bless($self, $class);

    return $self;
}

sub getType
{
    my $self = shift;
    return $self->{acc_type};
}

1;