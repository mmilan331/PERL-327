# IT 327
# Created by Mark and Owen
# 4/26/2023

print "Hi there, world!\n\n";

print "\$ stands for scalar variables, like int, float, and strings.\n";

$age = 25;
$name = "Sam Johnson";
$salary = 35000.25;
print "\$age = $age\n";
print "\$name = $name\n";
print "\$salary = $salary\n";

print "\n\@ stands for arrays, or ordered lists of scalar values.\n";
@ages = (25, 23, 84, 19);
@names = ("Lisa", "Tim", "Stacie", "Chris");
print "\$ages[0] = $ages[0]\n";
print "\$ages[2] = $ages[2]\n";
print "\$names[1] = $names[1]\n";
print "\$names[3] = $names[3]\n";

print "\n\% stands for hash variables, or key/value pairs. You must use {<key>} to get the associated value.\n";
%people = ("Lisa", 0, "Tim", 1, "Stacie", 2, "Chris", 3);
print "\$people{'Lisa'} = $people{'Lisa'}\n";
print "\$people{'Tim'} = $people{'Tim'}\n";
print "\$people{'Stacie'} = $people{'Stacie'}\n";
print "\$people{'Chris'} = $people{'Chris'}\n";

print "\nPerl is weakly typed and dynamically typed. Variables are determined through context.\n";
@names = ("Lisa", "Tim", "Stacie", "Chris");
@copy = @names;
$size = @names;
print "Names: @copy\n";
print "Number of names: $size\n";

#Example for loop
print("Times 2: ");
@numArray = (1..10);
for (@numArray){
    $timesTwo = $_ * 2;
    print("$timesTwo ");
}
print("\n");

#You can use "for" or "foreach"
print("Times 3: ");
foreach (@numArray){
    $timesThree = $_ * 3;
    print("$timesThree ");
}
print("\n");

#While loops!
print("Enter numbers, one per line: \n");
print("ctrl-z (windows) or ctrl-d (Linux) to exit\n");
@inputArray = ();
while ($input = <>) {
    chomp $input;
    $num = int($input);
    push(@numbers, $num);
}
print("Numbers input: @numbers\n");