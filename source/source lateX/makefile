genX: lex.yy.c
	g++ -std=c++0x lex.yy.c  -ll -o generatedFlex

lex.yy.c: generatedFlex.l
	flex generatedFlex.l

