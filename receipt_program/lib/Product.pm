#IT 327
#Created by Addison
#5/6/2023

package Product;

use strict;
use warnings;

#constructor to create objects
sub new {
    my ($class,$args) = @_;
    my $self = { 
        name => $args->{name},
        price => $args->{price},
        quantity => $args->{quantity}
    };
    return bless $self, $class;
}

#returns the name of an object of the Product class
sub get_name {
    my $self = shift;
    return $self->{name};
}

#sets a new name of an object of the Product class
sub set_name {
    my ($self, $new_name) = @_;
    $self->{name} = $new_name;
}

#returns the price of an object of the Product class
sub get_price {
    my $self = shift;
    return $self->{price};
}

#sets the price of an object of the Product class
sub set_price {
    my ($self, $new_price) = @_;
    $self->{price} = $new_price;
}

#returns the quantity of an object of the Product class
sub get_quantity {
    my $self = shift;
    return $self->{quantity};
}

#sets the quantity of an object of the Product class
sub set_quantity{
    my ($self, $new_quantity) = @_;
    $self->{quantity} = $new_quantity;
}

1;