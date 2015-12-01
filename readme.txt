Title : Text to HTML converter
Tamojit Chatterjee
Pijush Chakraborty

this is a general code converter framework. that takes as input a hyper text file and generates an html file. We have also generated latex using this framework to show that this framework can be used to convert to lot of other types of languages.

for parsing the ".htxt" file this uses an iterative version of a recusrsive decent parser. More over if you want to write your own ".htxt" to some other language converter all you have to do is edit the "syntax.config" file and add the element you want to parse along with the C++ header and the method name which will parse the component.

HOW TO RUN:
The "source html" folder has a main script file called hcc.
Suppose the input htxt file is input.htxt and we want to generate output.html 
we run it using the following command

./hcc input output

for the latex counter part it is 
./lcc input output

Technologies Used:
Awk
Flex
c++ 11

Note : please check the flow chart included  for understanding the work flow.
