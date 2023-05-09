# Perl group
# Node package
# 5/10/23

use strict;
use warnings;

# create new Node package
package Node;

# constructor
sub new {
	my $class = shift;
	my $self = {
		data => shift,
		next => shift
	};
	# bless returns reference of this object
	bless $self, $class;
	return $self;
}

# returns data in Node
sub getData {
	my($self) = @_;
	return $self->{data};
}

# returns next Node 
sub getNext {
	my($self) = @_;
	return $self->{next};
}

# set reference to next Node
sub setNext {
	my($self, $newNext) = @_;
	$self->{next} = $newNext if defined ($newNext);
	return $self->{next};
}

# end Node package definition
1;

		

