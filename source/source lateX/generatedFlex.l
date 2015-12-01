%{
	#include <iostream>
	#include <string>
	#include <stack>
	#include <vector>
	#include <cstdio>
	#include "./header/report.h"
	#include "./header/img.h"
	#include "./header/chapter.h"
	#include "./header/section.h"
		using namespace std;
	
		stack<string> content, tempStack;
		int tabC;
		bool eopt;
	
		vector<string> revX(stack<string> toRevX){
			vector<string> elemContent;
			while(!content.empty()&&content.top()[0] != '#'){
					tempStack.push(content.top());
					content.pop();
			}
			while(!tempStack.empty()){
					elemContent.push_back(tempStack.top());
					tempStack.pop();
			}
			return elemContent;
		}
%}
%%
	
.*	{ 
		       	int temp = 0;
		       	string line = yytext;
		       	for(; line[temp] == '	'; temp++);
				vector<string> elemC; 
				while (tabC > temp && !eopt ){
					elemC=revX(content);
					string fileX = content.top().substr(1);
					content.pop();
					if(fileX == "report")
						content.push(report(elemC,eopt));	
					if(fileX == "image")
						content.push(drawImage(elemC,eopt));	
					if(fileX == "chapter")
						content.push(drawChapter(elemC,eopt));	
					if(fileX == "section")
						content.push(drawSection(elemC,eopt));	
						if(eopt)
							cout<<content.top();
					tabC--;
				  }
				  if(!eopt)
					tabC = temp;
				 content.push(line.substr(temp));
			}	
[\n]	{
	
		}
%%
	
	int main(int argc, char **argv){
		yyin = fopen(argv[1],"r");
	
		//User Code
	
		yylex();
	
		if(!eopt){
			vector<string> elemC;
				while (tabC && !eopt ){
					elemC=revX(content);
					string fileX = content.top().substr(1);
					content.pop();
					if(fileX == "report")
						content.push(report(elemC,eopt));	
					if(fileX == "image")
						content.push(drawImage(elemC,eopt));	
					if(fileX == "chapter")
						content.push(drawChapter(elemC,eopt));	
					if(fileX == "section")
						content.push(drawSection(elemC,eopt));	
						if(eopt) {
							cout<<content.top();
							break;
						}
					tabC--;
				  }
			elemC = revX(content);
			if(!eopt)
				for(int i = 0; i < elemC.size(); i++) cout<<elemC[i];
		}	
	}
