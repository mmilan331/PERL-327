#IT 327
#Created by Addison
#5/6/2023

#Basic Program that displays a Receipt, 
#containing the item, quantity, price and grand total.

#This program deals with -
#objects
#inheritance
#arrays
#hashes
#for loop
#while loops

package Reciept;

use lib 'lib';
use Product;
use strict;
use warnings;

#creating objects of the Product Class
my $milk = Product->new({name => "2% Milk", price => 4.25, quantity => 2});
my $bread = Product->new({name => "Wheat Bread", price => 2.50, quantity => 1});
my $apples = Product->new({name => "Red Apples", price => 5.25, quantity => 6});
my $chicken = Product->new({name => "Chicken Breast", price => 17.82, quantity => 1});
my $pasta = Product->new({name => "Pasta Noodles", price => 1.43, quantity => 2});
my $oranges = Product->new({name => "Oranges", price => 1.50, quantity => 4});

#placing those objects into an array
my @reciept = ($milk, $bread, $apples, $chicken, $pasta, $oranges);

#prints the top part of the receipt
print("         GROCERY RECEIPT          ");
print("\n--------------------------------");
print("\nITEM      QUANTITY         PRICE");
print("\n--------------------------------");

#for loop to iterate through the receipt array
#prints the name, quantity, and price
for(@reciept){
    print("\n",$_->get_name(),"     ",$_->get_quantity(),"         ",$_->get_price(),"\n");
}

print("\n---------------------------------");

my $subtotal = 0;
my $tax = 0.01;
my $i = 0;

#while loop to get the subtotal of the receipt
while($i<scalar@reciept){
   my $sum = $reciept[$i]->get_quantity()*$reciept[$i]->get_price();
   $subtotal = $subtotal + $sum;
   $i++;
}

#prints the subtotal
print("\nSUBTOTAL:                  ", $subtotal);

#prints the tax(subtotal * tax)
my $with_tax = $subtotal*$tax;
print("\nTAX:                       ");
#prints only two decimal places 
printf('%.2f',$with_tax);

#prints the grand total(tax + subtotal)
my $total = $with_tax + $subtotal;
print("\nTOTAL:                     ");
#prints only two decimal places
printf('%.2f', $total);
