# Perl group
# CircularLinkedList package and tests
# 5/10/23

use lib 'lib';
use Node;

# create new CircularLinkedList package
package CircularLinkedList;

# constructor
sub new {
	my $class = shift;
	my $self = {};
	my $head;
	my $tail;
	# bless returns reference of this object
	bless $self, $class;
	return $self;
}

# insert new Node at end of list
sub insert {
	my($self, $insertData) = @_;
	if(defined($head)){
		my $insertNode = new Node($insertData, $head);
		$tail->setNext($insertNode);
		$tail = $insertNode;
	} else {
		my $insertNode = new Node($insertData, $tail);
		$head = $insertNode;
		$tail = $insertNode;
	}
}

# removes first Node with specified data from list
# PREREQ: list has at least one element, at least one element in list has specified data
sub remove {
	my($self, $key) = @_;
	my $prevNode = $tail;
	while($prevNode->getNext()->getData() != $key){
		$prevNode = $prevNode->getNext();
	}
	
	if($tail == $head) {
		# list has one element
		undef $head;
		undef $tail;
	} elsif ($tail == $prevNode){
		# remove head
		$head = $head->getNext();
		$tail->setNext($head);
	} elsif($tail == $prevNode->getNext()){
		# remove tail
		$tail = $prevNode;
		$tail->setNext($head);
	} else {
		# remove from middle of list 
		$prevNode->setNext($prevNode->getNext());
	}
}		

# prints list beginning at head
sub printList {
	my($self) = @_;
	if(defined($head)){
		my $node = $head;
		do{
			$printVal = $node->getData();
			print "$printVal .. ";
			$node = $node->getNext();
		} while ($head != $node);
	}
	print "\n";
}

# end CircularLinkedList package definition
1;

my $list = new CircularLinkedList();
print "Inserting 1... \n";
$list->insert(1);
print "Inserting 2... \n";
$list->insert(2);
\print "Inserting 3... \n";
$list->insert(3);
print "Printing list... \n";
$list->printList;
print "\n";

print "Removing 1... \n";
$list->remove(1);
print "Printing list... \n";
$list->printList;
print "\n";

print "Removing 2... \n";
$list->remove(2);
print "Printing list... \n";
$list->printList;
print "\n";

print "Removing 3... \n";
$list->remove(3);
print "Printing list... \n";
$list->printList;
print "\n";

print "Rebuilding list... \n";
$list->insert(1);
$list->insert(2);
$list->insert(3);
print "Printing list... \n";
$list->printList;



