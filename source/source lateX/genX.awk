BEGIN {
	print "%{"
	print "	#include <iostream>"
	print "	#include <string>"
	print "	#include <stack>"
	print "	#include <vector>"
	print "	#include <cstdio>"
	fX = 0
	eleX = 0	
	nameX = 0
	headX = 0
	funX = 0
}

{	
	gsub("[\t\n ]*","")

	#print eleX
	#print nameX
	#print headX
	#print funX
	#print ""

	if(funX == 1){
		funArX[fX++] = $0
		funX = 0
	}
	else if(headX == 1){
		headArX[fX] = $0
		headX = 0
	}
	else if(nameX == 1){
		nameArX[fX] = $0
		nameX = 0
	}
}
$0~"<preprocess>"	{
				eleX = 1		
		}
$0~"<postprocess>"	{
				eleX = 1		
		}
$0~"<element>"	{
				eleX = 1		
		}
			
$0~"<name>" 	{
				nameX = 1		
			}

$0~"<function>" 	{
				funX = 1		
			}
			
$0~"<header>" 	{
				headX = 1		
			}
$0~"<\/preprocess>"	{
				eleX = 0
		}
$0~"<\/postprocess>"	{
				eleX = 0
		}
$0~"<\/element>" 	{
				eleX = 0		
			}
			
$0~"<\/name>" 	{
				nameX = 0
			}

$0~"<\/function>" 	{
				funX = 0	
			}
			
$0~"<\/header>" 	{
				headX = 0		
			}
			
			
END {
	for(i = 0; i < fX; i++)
		print "	#include \""headArX[i]"\""
		
	print "		using namespace std;"
	print "	"
	print "		stack<string> content, tempStack;"
	print "		int tabC;"
	print "		bool eopt;"
	print "	"
	print "		vector<string> revX(stack<string> toRevX){"
	print "			vector<string> elemContent;"
	print "			while(!content.empty()&&content.top()[0] != '#'){"
	print "					tempStack.push(content.top());"
	print "					content.pop();"
	print "			}"
	print "			while(!tempStack.empty()){"
	print "					elemContent.push_back(tempStack.top());"
	print "					tempStack.pop();"
	print "			}"
	print "			return elemContent;"
	print "		}"
	print "%}"
	print "%%"	
	print "	"
	print ".*	{ "
	print "		       	int temp = 0;"
	print "		       	string line = yytext;"
	print "		       	for(; line[temp] == '	'; temp++);"
	print "				vector<string> elemC; "
	print "				while (tabC > temp && !eopt ){"
	print "					elemC=revX(content);"
	print "					string fileX = content.top().substr(1);"
	print "					content.pop();"
	
	for(i = 0; i < fX; i++){
		print "					if(fileX == \""nameArX[i]"\")"
		print "						content.push("funArX[i]"(elemC,eopt));	"
	}
	
	print "						if(eopt)"
	print "							cout<<content.top();"
	print "					tabC--;"
	print "				  }"
	print "				  if(!eopt)"
	print "					tabC = temp;"
	print "				 content.push(line.substr(temp));"
	print "			}	"
	print "[\\n]	{"
	print "	"
	print "		}"
	print "%%"
	print "	"
	print "	int main(int argc, char **argv){"
	print "		yyin = fopen(argv[1],\"r\");"
	print "	"
	print "		//User Code"
	print "	"
	print "		yylex();"
	print "	"
	print "		if(!eopt){"
	print "			vector<string> elemC;"
	print "				while (tabC && !eopt ){"
	print "					elemC=revX(content);"
	print "					string fileX = content.top().substr(1);"
	print "					content.pop();"
	
	for(i = 0; i < fX; i++){
		print "					if(fileX == \""nameArX[i]"\")"
		print "						content.push("funArX[i]"(elemC,eopt));	"
	}
	
	print "						if(eopt) {"
	print "							cout<<content.top();"
	print "							break;"
	print "						}"
	print "					tabC--;"
	print "				  }"
	print "			elemC = revX(content);"
	print "			if(!eopt)"
	print "				for(int i = 0; i < elemC.size(); i++) cout<<elemC[i];"
	print "		}	"
	print "	}"
}
